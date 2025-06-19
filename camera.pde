void controlCamera() {
    float speed = sprintkey ? 40 : 10;
    float vertSpeed = sprintkey ? 20 : 5;
    
    playerFeetY = eyeY - playerHeight;
    
    // Calculate horizontal movement
    float moveX = 0;
    float moveZ = 0;
    
    if (wkey) {
        moveX += cos(leftRightHeadAngle) * speed;
        moveZ += sin(leftRightHeadAngle) * speed;
    }
    if (skey) {
        moveX -= cos(leftRightHeadAngle) * speed;
        moveZ -= sin(leftRightHeadAngle) * speed;
    }
    if (akey) {
        moveX += cos(leftRightHeadAngle + HALF_PI) * speed;
        moveZ += sin(leftRightHeadAngle + HALF_PI) * speed;
    }
    if (dkey) {
        moveX += cos(leftRightHeadAngle - HALF_PI) * speed;
        moveZ += sin(leftRightHeadAngle - HALF_PI) * speed;
    }
    
    // Normalize diagonal movement
    if (moveX != 0 && moveZ != 0) {
        moveX *= 0.7071; // 1/sqrt(2)
        moveZ *= 0.7071;
    }
    
    float newEyeX = eyeX + moveX;
    float newEyeZ = eyeZ + moveZ;
    
    // Horizontal collision check with new position
    if (!isColliding(newEyeX, playerFeetY, newEyeZ, playerRadius, playerHeight)) {
        eyeX = newEyeX;
        eyeZ = newEyeZ;
    }
    
    // Vertical movement
    float newEyeY = eyeY;
    if (spacekey) newEyeY -= vertSpeed;
    if (shiftkey) newEyeY += vertSpeed;
    
    // Vertical collision check with current horizontal position
    if (!isColliding(eyeX, newEyeY - playerHeight, eyeZ, playerRadius, playerHeight)) {
        eyeY = newEyeY;
    }
    
    // Camera rotation and mouse wrapping
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
