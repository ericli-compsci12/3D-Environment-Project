void controlCamera() {
    float speed = sprintkey ? 40 : 10;
    float vertSpeed = sprintkey ? 20 : 5;
    
    playerFeetY = eyeY - playerHeight;
    
    float newEyeX = eyeX;
    float newEyeZ = eyeZ;
    
    // Horizontal movement
    if (wkey) newEyeX += cos(leftRightHeadAngle) * speed;
    if (skey) newEyeX -= cos(leftRightHeadAngle) * speed;
    if (akey) newEyeX -= cos(leftRightHeadAngle + radians(90)) * speed;
    if (dkey) newEyeX += cos(leftRightHeadAngle + radians(90)) * speed;
    if (skey) newEyeZ -= sin(leftRightHeadAngle) * speed;
    if (wkey) newEyeZ += sin(leftRightHeadAngle) * speed;
    if (akey) newEyeZ -= sin(leftRightHeadAngle + radians(90)) * speed;
    if (dkey) newEyeZ += sin(leftRightHeadAngle + radians(90)) * speed;

    //// Horizontal collision check
    //if (!isColliding(newEyeX, playerFeetY, eyeZ, playerRadius, playerHeight)) {
    //    eyeX = newEyeX;
    //    eyeZ = newEyeZ;
    //}
    
    //// Vertical movement
    //float newEyeY = eyeY;
    //if (spacekey) newEyeY -= vertSpeed;
    //if (shiftkey) newEyeY += vertSpeed;
    
    //// Vertical collision check
    //if (!isColliding(eyeX, newEyeY - playerHeight, eyeZ, playerRadius, playerHeight)) {
    //    eyeY = newEyeY;
    //}
    
    
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
