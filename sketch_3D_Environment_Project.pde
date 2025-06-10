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
//wall
color wl = #450E0F;
//glass
color gls = #FFFFFE;

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
PImage glass;

// Tree height 
int[][] treeHeights;

//berry position
ArrayList<PVector> berryBushes = new ArrayList<>();
ArrayList<PVector> glassBlocks = new ArrayList<>();

//canvases
PGraphics world;
PGraphics HUD;

void setup () {
  fullScreen(P2D);
  //create canvases
  println(width,height);
  world = createGraphics(1920,1080,P3D);
  HUD = createGraphics(width,height,P2D);
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
  glass = loadImage("glass.png");
  
  
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
  world.beginDraw();
  world.textureMode(NORMAL);
  
  world.background(calculateBackgroundColor());
  
  if (calculateBackgroundColor() == nighttime) {
    world.pointLight(0,0,130,eyeX,eyeY,eyeZ);
  }
  
  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  // Clear previous frame's bushes
  berryBushes.clear();
  
  // Draw opaque elements with depth testing
  hint(ENABLE_DEPTH_TEST);
  drawMap();
  
  drawBerryBushes();
  drawGlassBlocks();
  controlCamera();
  
   world.endDraw();
   image(world,0,0);
   
   pushMatrix();
   scale(0.5);
   translate(width/2,height/2);
   cross();
   popMatrix();
}
