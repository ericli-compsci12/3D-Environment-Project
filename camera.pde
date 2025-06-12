

void controlCamera() {
  float speed = sprintkey ? 40 : 10;
  float vertSpeed = sprintkey ? 20 : 5;

  if (wkey) {
    eyeX += cos(leftRightHeadAngle) * speed;
    eyeZ += sin(leftRightHeadAngle) * speed;
  }
  if (skey) {
    eyeX -= cos(leftRightHeadAngle) * speed;
    eyeZ -= sin(leftRightHeadAngle) * speed;
  }
  if (akey) { 
    eyeX -= cos(leftRightHeadAngle + radians(90)) * speed;
    eyeZ -= sin(leftRightHeadAngle + radians(90)) * speed;
  }
  if (dkey) {
    eyeX += cos(leftRightHeadAngle + radians(90)) * speed;
    eyeZ += sin(leftRightHeadAngle + radians(90)) * speed;
  }
  if (spacekey) {
    eyeY -= vertSpeed;
  }
  if (shiftkey) {
    eyeY += vertSpeed;
  }

 
  if (skipFrame == false) {
    leftRightHeadAngle += (mouseX - pmouseX) * 0.005;
    upDownHeadAngle += (mouseY - pmouseY) * 0.005;
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
