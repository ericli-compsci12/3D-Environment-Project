boolean canMoveForward() {
  float fwx,fwy,fwz;
  int mapx,mapy;
  fwx = eyeX + cos(leftRightHeadAngle)*200;
  fwy = eyeY;
  fwz = eyeZ + sin(leftRightHeadAngle)*200;
  mapx = int(fwx + 5000) / gridSize; 
  mapy = int(fwz + 5000) / gridSize; 
  if (map.get(mapx,mapy) == white) {
    return true;
  } else {
    return false;
  }
}

//boolean canMoveLeft() {
  
  
  
//}

//boolean canMoveRight () {
  
  
//}

//boolean canMoveBackward() {
  
  
//}
