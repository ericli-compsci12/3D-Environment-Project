//Eric Li
//May 18th 2025

//import
import java.awt.Robot;

//mouse wrapping
Robot rbt;
boolean skipFrame;

//game variables
boolean wkey, akey, skey, dkey,okey,zkey, spacekey, shiftkey, sprintkey = false;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

//COLOR PALLETE
//sky blue
color daylight = #87CEEB;
//black
color nighttime = #000000;
//white color rgb(255,255,255)
color white = #FFFFFF;
//black color rgb(0,0,0)
color black = #000000;
//blue color rgb(0,0,255)
color blue = #0000FF;
//pink color rgb(193, 28, 132)
color pink = #C11C84;
//red color rgb(255, 0, 0)
color red = #FF0000;
//green color rgb(0, 255, 0)
color green = #00FF00;
//yellow color rgb(255, 255, 0)
color yellow = #FFFF00;
//gold color rgb(255, 215, 0)
color gold = #FFD700;
//orange color rgb(255, 165, 0)
color orange = #FFA500;
//grey color rgb(100, 100, 100)
color grey = #646464;
//purple color rgb(211, 3, 252)
color purple = #d303fc;
//purple blue color rgb(115, 3, 252)
color purpblue = #7303fc;
//color treebranch
color tb = #22B14C;
//color dirt
color dt = #880015;
//color dirt2
color dt2 = #880014;
//color dirt 3
color dt3 = #880013;
//color dirt 4
color dt4 = #880012; 
//color rock
color st = #C3C3C3;
//color rock2
color st2 = #C3C3C2;
//color  berrry
color br = #ED1C24;
//color hole
color ho = #000003;
//color hole2
color ho2 = #000002;
//color diamond
color dia = #99D9EA;
//coal
color coalc = #7F7F7F;
//cobblestone
color cbs = #969696;

//Map variables
int gridSize;
PImage map;

//texture variables
PImage grassbs;
PImage grassbt;
PImage grassbb;
PImage spwoodbt;
PImage spwoodbs;
PImage spleaves;
PImage Stones;
PImage Berry;
PImage bedrock;
PImage diamond;
PImage coal;
PImage cobblestone;

// Tree height 
int[][] treeHeights;

//berry position
ArrayList<PVector> berryBushes = new ArrayList<>();

void setup () {
  fullScreen(P3D);
  textureMode(NORMAL);
  wkey = akey =skey = dkey = false;
  eyeX = width/2;
  eyeY = height/2;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  leftRightHeadAngle = radians(270);
  noCursor();
  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  //initialize map
  map = loadImage("map.png");
  gridSize = 10000 / map.width; // Adjust gridSize based on map width
  map = loadImage("map.png");
  
  //load textures
  grassbs = loadImage("grass_block_side.png");
  grassbt = loadImage("Grass_Block_Top_C.png");
  grassbb = loadImage("dirt.png");
  spwoodbt  = loadImage("spruce_log_top.png");
  spwoodbs  = loadImage("spruce_log.png");
  spleaves =  loadImage("spruceleaves.jpg");
  Stones =  loadImage("stone.png");
  Berry =  loadImage("berry bush.png");
  bedrock =  loadImage("Bedrock.png");
  diamond = loadImage("diamond_ore.png");
  coal = loadImage("coal_ore.png");
  cobblestone = loadImage("cobblestone.png");
  
  
  treeHeights = new int[map.width][map.height];
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == tb) {
        treeHeights[x][y] = (int)random(3, 8);
      } else {
        treeHeights[x][y] = 0; // No tree
      }
    }
  }
}

void draw() {
  background(calculateBackgroundColor());
  if (calculateBackgroundColor() == nighttime) {
    pointLight(0,0,130,eyeX,eyeY,eyeZ);
  }
  
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  // Clear previous frame's bushes
  berryBushes.clear();
  
  // Draw opaque elements with depth testing
  hint(ENABLE_DEPTH_TEST);
  drawMap();
  
  // Draw transparent elements last
  drawBerryBushes();
  
  // Draw focal point
  drawFocalPoint();
  controlCamera();
 
}

void drawBerryBushes() {
  // Enable depth testing and blending
  hint(ENABLE_DEPTH_TEST);
  blendMode(BLEND);
  hint(DISABLE_DEPTH_MASK);
  
  // Draw each bush 
  for (PVector bush : berryBushes) {
    texturedCross(bush.x, bush.y, bush.z, Berry, gridSize);
  }
  
  // Reset depth settings
  hint(ENABLE_DEPTH_MASK);
}


void drawMap () {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      float wx = x * gridSize - 5000;
      float wz = y * gridSize - 5000;
      // Draw base block for all positions
      if (c != ho && c != ho2) {
      texturedCube(x*gridSize-5000, height, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      if (c != ho2) {
      texturedCube(x*gridSize-5000, height+gridSize, y*gridSize-5000, grassbb, gridSize);
      }
      
      texturedCube(x*gridSize-5000, height+gridSize*2, y*gridSize-5000, Stones, gridSize);
      texturedCube(x*gridSize-5000, height+gridSize*3, y*gridSize-5000, Stones, gridSize);
      texturedCube(x*gridSize-5000, height+gridSize*4, y*gridSize-5000, Stones, gridSize);
       texturedCube(x*gridSize-5000, height+gridSize*5, y*gridSize-5000, bedrock, gridSize);
      
      if (c == tb) {
        // Get tree height
        int trunkHeight = treeHeights[x][y];
        float topY = height - (trunkHeight - 1) * gridSize;
        
        // Draw trunk
        for (int i = 0; i < trunkHeight; i++) {
          float yPos = height - i * gridSize;
          texturedCube(x*gridSize-5000, yPos, y*gridSize-5000, spwoodbt, spwoodbs, gridSize);
        }
        
        // Draw leaves layers relative to top of trunk
        // First layer 
        drawLeavesLayer(x, y, topY, gridSize);
        // Second layer
        drawLeavesLayer(x, y, topY - gridSize, gridSize);
        // Third layer 
        drawLeavesLayer(x, y, topY - 2 * gridSize, gridSize);
        // Fourth layer
        texturedCube(x*gridSize-5000, topY - 3 * gridSize, y*gridSize-5000, spleaves, gridSize);
      }
      
      if (c == dt) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt2) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt3) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,grassbb, gridSize);
         texturedCube(x*gridSize-5000, height - gridSize*3, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt4) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*3, y*gridSize-5000, grassbb,gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*4, y*gridSize-5000, grassbb,gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*5, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
        
      }
      
      if (c == st) {
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
      }
      
      if (c == st2) {
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,Stones, gridSize);
      }
      
      if (c == br) {
     
        berryBushes.add(new PVector(wx, height - gridSize, wz));
      }
      
       if (c == dia) {
     
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,diamond, gridSize);
      }
      
       if (c == coalc) {
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,coal, gridSize);
      }
      
       if (c == cbs) {
        texturedCube(x*gridSize-5000, height, y*gridSize-5000,cobblestone, gridSize);
      }
      
    }
  }
}

void drawLeavesLayer(int x, int y, float layerY, float size) {
 
  for (int dx = -1; dx <= 1; dx++) {
    for (int dz = -1; dz <= 1; dz++) {
     
      if (abs(dx) == 1 && abs(dz) == 1) continue;
      texturedCube((x+dx)*gridSize-5000, layerY, (y+dz)*gridSize-5000, spleaves, size);
    }
  }
}

color calculateBackgroundColor() {
  int totalCycle = 7200;
  int currentFrame = frameCount % totalCycle;
  println(frameCount);
  
   if (okey) {
     return nighttime;
  }
  
  if (zkey) {
     return daylight;
  }
  
  if (currentFrame < 3600) {
    return daylight;
  } else if (currentFrame < 3900) {
    float progress = (currentFrame - 3600) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(daylight, nighttime, t);
  } else if (currentFrame < 6900) {
    return nighttime;
  } else {
    float progress = (currentFrame - 6900) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(nighttime, daylight, t);
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(5);
  popMatrix();
}

//void drawFloor () {
//  stroke(255);
//  for (int x = -5000; x <= 5000; x = x + 100) {
//    line(x, height, -5000, x, height, 5000);
//    line(-5000, height, x, 5000, height, x);
//  }
//}

void controlCamera() {
  if (!sprintkey) {
  if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + radians(90))*10;
    eyeZ = eyeZ - sin(leftRightHeadAngle + radians(90))*10;
  }
  if (dkey) {
    eyeX = eyeX + cos(leftRightHeadAngle + radians(90))*10;
    eyeZ = eyeZ + sin(leftRightHeadAngle + radians(90))*10;
  }
  if (spacekey) {
    eyeY = eyeY - 5;
  }
  
  if (shiftkey) {
    eyeY = eyeY + 5;
  }
  }
  else if (sprintkey) {
    if (wkey && canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*40;
    eyeZ = eyeZ + sin(leftRightHeadAngle)*40;
  }
  if (skey) {
    eyeX = eyeX - cos(leftRightHeadAngle)*40;
    eyeZ = eyeZ - sin(leftRightHeadAngle)*40;
  }
  if (akey) {
    eyeX = eyeX - cos(leftRightHeadAngle + radians(90))*40;
    eyeZ = eyeZ - sin(leftRightHeadAngle + radians(90))*40;
  }
  if (dkey) {
    eyeX = eyeX + cos(leftRightHeadAngle + radians(90))*40;
    eyeZ = eyeZ + sin(leftRightHeadAngle + radians(90))*40;
  }
  if (spacekey) {
    eyeY = eyeY - 20;
  }
  
  if (shiftkey) {
    eyeY = eyeY + 20;
  }
  }

  if (skipFrame == false) {
    leftRightHeadAngle = leftRightHeadAngle + (mouseX - pmouseX) * 0.005;
    upDownHeadAngle = upDownHeadAngle + (mouseY - pmouseY) * 0.005;
  }

  if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
  if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;


  focusX = eyeX + cos(leftRightHeadAngle)*300;
  focusZ = eyeZ + sin(leftRightHeadAngle)*300;
  focusY = eyeY + tan(upDownHeadAngle)*300;

  if (mouseX < 2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width -2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}

void keyPressed () {
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'D' || key == 'd' ) dkey = true;
  if (key == '1') {
    okey = true;
    zkey = false;
  }
  if (key == '0') {
    zkey = true;
    okey = false;}
  if (key == ' ')  spacekey = true;
  if (keyCode == SHIFT) shiftkey = true;
  if (keyCode == CONTROL) sprintkey = true;
}

void keyReleased () {
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'D' || key == 'd' ) dkey = false;
  if (key == ' ')  spacekey = false;
  if (keyCode == SHIFT) shiftkey = false;
  if (keyCode == CONTROL) sprintkey = false;
}
