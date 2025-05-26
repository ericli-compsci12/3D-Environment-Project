//import
import java.awt.Robot;

//mouse wrapping
Robot rbt;
boolean skipFrame;

//game variables
boolean wkey, akey, skey, dkey;
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

//Map variables
int gridSize;
PImage map;

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
  gridSize = 100;
}


void draw () {
   background(calculateBackgroundColor());
  camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,tiltX,tiltY,tiltZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
  drawMap();
}

void drawMap () {
  for (int x = 0; x < map.width;x++) {
    for (int y = 0; y < map.height;y++) {
    color c = map.get(x,y);
    if (c !=white) {
      pushMatrix();
      fill(c);
      stroke(100);
      translate(x*gridSize-2000,height/2,y*gridSize-2000);
      box(gridSize,height,gridSize);
      popMatrix();
    }
    }
  }
}

color calculateBackgroundColor() {
  int totalCycle = 72000;
  int currentFrame = frameCount % totalCycle;

  if (currentFrame < 360000) {
    return daylight;
  } else if (currentFrame < 39000) {
    float progress = (currentFrame - 36000) / 3000.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(daylight, nighttime, t);
  } else if (currentFrame < 69000) {
    return nighttime;
  } else {
    float progress = (currentFrame - 69000) / 3000.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(nighttime, daylight, t);
  }
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX,focusY,focusZ);
  sphere(5);
  popMatrix();
}

void drawFloor () {
  stroke(255);
  for (int x = -2000;x<= 2000;x=x+100) {
    line(x,height,-2000,x,height,2000);
    line(-2000,height,x,2000,height,x);
  }
}

void controlCamera() {
 if (wkey) {
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
   rbt.mouseMove(width-3,mouseY);
   skipFrame = true;
 }
 else if (mouseX > width -2) {
    rbt.mouseMove(3,mouseY);
    skipFrame = true;
 }
 else {
    skipFrame = false;
 }
 println(eyeX,eyeY,eyeZ);
}

void keyPressed () {
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'D' || key == 'd' ) dkey = true;
  
}

void keyReleased () {
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'D' || key == 'd' ) dkey = false;
  
}
