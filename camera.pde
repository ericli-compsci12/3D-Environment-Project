void controlCamera() {
  float speed = sprintkey ? 40 : 10;
  float vertSpeed = sprintkey ? 20 : 5;

  // Calculate direction vectors based on camera angles
  float forwardX = cos(leftRightHeadAngle);
  float forwardZ = sin(leftRightHeadAngle);
  float rightX = sin(leftRightHeadAngle);
  float rightZ = -cos(leftRightHeadAngle);

  // Calculate movement direction based on keys
  float moveX   = 0;
  float moveZ = 0;

  if (wkey) {
    moveX += forwardX;
    moveZ += forwardZ;
  }
  if (skey) {
    moveX -= forwardX;
    moveZ -= forwardZ;
  }
  if (akey) {
    moveX += rightX;
    moveZ += rightZ;
  }
  if (dkey) {
    moveX -= rightX;
    moveZ -= rightZ;
  }

  // Normalize diagonal movement
  if (moveX != 0 || moveZ != 0) {
    float length = sqrt(moveX * moveX + moveZ * moveZ);
    moveX = (moveX / length) * speed;
    moveZ = (moveZ / length) * speed;
  }

  // X and Z axis collision check
  boolean xMoveOk = !isColliding(eyeX + moveX, eyeY, eyeZ);
  boolean zMoveOk = !isColliding(eyeX, eyeY, eyeZ + moveZ);

  if (xMoveOk) {
    eyeX += moveX;
  }
  if (zMoveOk) {
    eyeZ += moveZ;
  }

  // Vertical movement
  float newEyeY = eyeY;
  if (spacekey) newEyeY -= vertSpeed;  // Move up
  if (shiftkey) newEyeY += vertSpeed;  // Move down

  if (!isColliding(eyeX, newEyeY, eyeZ)) {
    eyeY = newEyeY;
  }

  // Camera rotation
  if (!skipFrame) {
    leftRightHeadAngle += (mouseX - pmouseX) * 0.005;
    upDownHeadAngle += (mouseY - pmouseY) * 0.005;
  }

  // Clamp vertical look angle
  upDownHeadAngle = constrain(upDownHeadAngle, -PI / 2.5, PI / 2.5);

  // Update focus point
  focusX = eyeX + cos(leftRightHeadAngle) * 300;
  focusZ = eyeZ + sin(leftRightHeadAngle) * 300;
  focusY = eyeY + tan(upDownHeadAngle) * 300;

  // Mouse wrapping
  if (mouseX < 2) {
    rbt.mouseMove(width - 3, mouseY);
    skipFrame = true;
  } else if (mouseX > width - 2) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }
}

 
