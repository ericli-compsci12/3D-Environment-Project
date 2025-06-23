//void controlCamera() {
  //float speed = sprintkey ? 40 : 10;
  //float vertSpeed = sprintkey ? 20 : 5;

  //// Calculate direction vectors based on camera angles
  //float forwardX = cos(leftRightHeadAngle);
  //float forwardZ = sin(leftRightHeadAngle);
  //float rightX = sin(leftRightHeadAngle);
  //float rightZ = -cos(leftRightHeadAngle);

  //// Calculate movement direction based on keys
  //float moveX   = 0;
  //float moveZ = 0;

  //if (wkey) {
  //  moveX += forwardX;
  //  moveZ += forwardZ;
  //}
  //if (skey) {
  //  moveX -= forwardX;
  //  moveZ -= forwardZ;
  //}
  //if (akey) {
  //  moveX += rightX;
  //  moveZ += rightZ;
  //}
  //if (dkey) {
  //  moveX -= rightX;
  //  moveZ -= rightZ;
  //}

  //// Normalize diagonal movement
  //if (moveX != 0 || moveZ != 0) {
  //  float length = sqrt(moveX * moveX + moveZ * moveZ);
  //  moveX = (moveX / length) * speed;
  //  moveZ = (moveZ / length) * speed;
  //}

  //// X and Z axis collision check
  //boolean xMoveOk = !isColliding(eyeX + moveX, eyeY, eyeZ);
  //boolean zMoveOk = !isColliding(eyeX, eyeY, eyeZ + moveZ);

  //if (xMoveOk) {
  //  eyeX += moveX;
  //}
  //if (zMoveOk) {
  //  eyeZ += moveZ;
  //}

  //// Vertical movement
  //float newEyeY = eyeY;
  //if (spacekey) newEyeY -= vertSpeed;  // Move up
  //if (shiftkey) newEyeY += vertSpeed;  // Move down

  //if (!isColliding(eyeX, newEyeY, eyeZ)) {
  //  eyeY = newEyeY;
  //}

  void controlCamera() {
  float speed = sprintkey ? 40 : 10;
  float vertSpeed = sprintkey ? 20 : 5;

  if (wkey && canMoveForward()) {
    eyeX += cos(leftRightHeadAngle) * speed;
    eyeZ += sin(leftRightHeadAngle) * speed;
  }
  if (skey && canMoveBackward()) {
    eyeX -= cos(leftRightHeadAngle) * speed;
    eyeZ -= sin(leftRightHeadAngle) * speed;
  }
  if (akey && canMoveLeft()) { 
    eyeX -= cos(leftRightHeadAngle + radians(90)) * speed;
    eyeZ -= sin(leftRightHeadAngle + radians(90)) * speed;
  }
  if (dkey && canMoveRight()) {
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

 
