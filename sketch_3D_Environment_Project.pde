boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup () {
  size(800,600,P3D);
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
}


void draw () {
  background(0);
  camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ,tiltX,tiltY,tiltZ);
  drawFloor();
  drawFocalPoint();
  controlCamera();
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
 if (skey) eyeZ = eyeZ - 10;
 if (akey) eyeX = eyeX + 10;
 if (dkey) eyeX = eyeX - 10;
 
 leftRightHeadAngle = leftRightHeadAngle + 0.005*(mouseX-pmouseX);
 upDownHeadAngle = upDownHeadAngle + 0.005*(mouseY-pmouseY);
 if (upDownHeadAngle > PI/2.5) upDownHeadAngle = PI/2.5;
 if (upDownHeadAngle < -PI/2.5) upDownHeadAngle = -PI/2.5;

 
 focusX = eyeX + cos(leftRightHeadAngle)*300;
 focusZ = eyeZ + cos(leftRightHeadAngle)*300;
 focusY = eyeY + tan(upDownHeadAngle)*300;
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
