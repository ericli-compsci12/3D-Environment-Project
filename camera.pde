

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
