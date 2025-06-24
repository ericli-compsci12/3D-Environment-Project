//boolean isColliding(float testX, float testY, float testZ) {
//  // Define player bounding box dimensions
//  float halfWidth = 0.03 * gridSize;
//  float halfDepth = 0.03 * gridSize;
//  float playerHeight = 1.8 * gridSize;

//  // Calculate player's AABB in world coordinates
//  float playerMinX = testX - halfWidth;
//  float playerMaxX = testX + halfWidth;
//  float playerMinZ = testZ - halfDepth;
//  float playerMaxZ = testZ + halfDepth;
//  float playerMinY = testY - playerHeight;
//  float playerMaxY = testY;

//  // Convert bounding box to grid space
//  int minGridX = (int)((playerMinX + 5000) / gridSize);
//  int maxGridX = (int)((playerMaxX + 5000) / gridSize);
//  int minGridZ = (int)((playerMinZ + 5000) / gridSize);
//  int maxGridZ = (int)((playerMaxZ + 5000) / gridSize);
//  int minGridY = (int)(playerMinY / gridSize);
//  int maxGridY = (int)(playerMaxY / gridSize);

//  // Check collisions within bounding box range
//  for (int y = minGridY; y <= maxGridY; y++) {
//    for (int x = minGridX; x <= maxGridX; x++) {
//      for (int z = minGridZ; z <= maxGridZ; z++) {
//       if (x < 0 || x >= map.width || z < 0 || z >= map.height || y < 0 || y >= 50)
//          continue;

//        if (!solidBlocks[x][y][z])
//          continue;

//         //Skip open doors
//        if (isDoorBlock(x, z) && isDoorOpen(x, z))
//          continue;

//        //// Block AABB in world space
//        float blockMinX = x * gridSize - 5000;
//        float blockMaxX = (x + 1) * gridSize - 5000;
//        float blockMinZ = z * gridSize - 5000;
//        float blockMaxZ = (z + 1) * gridSize - 5000;
//        float blockMinY = y * gridSize;
//        float blockMaxY = (y + 1) * gridSize;

//        // Check for overlap in all 3 axes
//         boolean xOverlap = (playerMaxX > blockMinX ) && (playerMinX < blockMaxX);
//         boolean yOverlap = playerMaxY > (blockMinY) && playerMinY < (blockMaxY);
//         boolean zOverlap = playerMaxZ > (blockMinZ) && playerMinZ < (blockMaxZ);
         
//        // if (xOverlap) {
//        //   println("collidied at x" + eyeX);
//        // }
         
//        // if (yOverlap) {
//        //   println("collidied at y" + eyeY);
//        // }
         
//        // if (zOverlap) {
//        //   println("collidied at z" + eyeZ);
//        // }

//        //if (xOverlap && yOverlap && zOverlap) {
//        //  return true;
//        //}
//      }
//    }
//  }

//  return false;
//}




boolean canMoveForward() {
  float fwx,fwy,fwz;
  int mapx,mapy;
  fwx = eyeX + cos(leftRightHeadAngle)*200;
  fwy = eyeY;
  fwz = eyeZ + sin(leftRightHeadAngle)*200;
  mapx = int(fwx + 5000) / gridSize; 
  mapy = int(fwz + 5000) / gridSize; 
  
  //println(currentMiniY);
  if ((map.get(mapx,mapy) == white || map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == cloud ) && (currentMiniY == 0)) {
    return true;
  } else if ((currentMiniY == -1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == white || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == -2) && (map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 2) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 3) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc
  || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc || map.get(mapx,mapy) == lc2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 4) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt4|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || 
  map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == lc2 ||
   map.get(mapx,mapy) == spp || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 5) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 6) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if (currentMiniY >= 7) {
    return true;
  }
  
  else {
    return false;
  }
}

boolean canMoveLeft() {
  
  float lx,ly,lz;
  int mapx,mapy;
  lx = eyeX - cos(leftRightHeadAngle + radians(90))*200;
  ly = eyeY;
  lz = eyeZ - sin(leftRightHeadAngle + radians(90))*200;
  mapx = int(lx + 5000) / gridSize; 
  mapy = int(lz + 5000) / gridSize;  
  if ((map.get(mapx,mapy) == white || map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == cloud ) && (currentMiniY == 0)) {
    return true;
  } else if ((currentMiniY == -1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == white || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == -2) && (map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 2) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 3) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc
  || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc || map.get(mapx,mapy) == lc2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 4) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt4|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || 
  map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == lc2 ||
   map.get(mapx,mapy) == spp || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 5) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 6) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if (currentMiniY >= 7) {
    return true;
  }
  
  else {
    return false;
  }
  
}

boolean canMoveRight() {
  float rx,ry,rz;
  int mapx,mapy;
  rx = eyeX + cos(leftRightHeadAngle + radians(90))*200;
  ry = eyeY;
  rz = eyeZ + sin(leftRightHeadAngle + radians(90))*200;
  mapx = int(rx + 5000) / gridSize; 
  mapy = int(rz + 5000) / gridSize;  
  if ((map.get(mapx,mapy) == white || map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == cloud ) && (currentMiniY == 0)) {
    return true;
  } else if ((currentMiniY == -1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == white || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == -2) && (map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 2) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 3) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc
  || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc || map.get(mapx,mapy) == lc2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 4) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt4|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || 
  map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == lc2 ||
   map.get(mapx,mapy) == spp || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 5) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 6) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if (currentMiniY >= 7) {
    return true;
  }
  
  else {
    return false;
  }

}

boolean canMoveBackward() {
  float bwx,bwy,bwz;
  int mapx,mapy;
  bwx = eyeX - cos(leftRightHeadAngle)*200;
  bwy = eyeY;
  bwz = eyeZ - sin(leftRightHeadAngle)*200;
  mapx = int(bwx + 5000) / gridSize; 
  mapy = int(bwz + 5000) / gridSize;  
  if ((map.get(mapx,mapy) == white || map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == cloud ) && (currentMiniY == 0)) {
    return true;
  } else if ((currentMiniY == -1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == white || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == -2) && (map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 1) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 2) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == cbs || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  else if ((currentMiniY == 3) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc
  || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc || map.get(mapx,mapy) == lc2 || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 4) && (map.get(mapx,mapy) == ho || map.get(mapx,mapy) == ho2 || map.get(mapx,mapy) == white 
  || map.get(mapx,mapy) == pumpk || map.get(mapx,mapy) == st || map.get(mapx,mapy) == st2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt 
  || map.get(mapx,mapy) == dt2 || map.get(mapx,mapy) == dt3|| map.get(mapx,mapy) == dt4|| map.get(mapx,mapy) == cbs  || map.get(mapx,mapy) == br || 
  map.get(mapx,mapy) == dia || map.get(mapx,mapy) == coalc || map.get(mapx,mapy) == gls || map.get(mapx,mapy) == wl || map.get(mapx,mapy) == lc3 || map.get(mapx,mapy) == lc2 ||
   map.get(mapx,mapy) == spp || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 5) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if ((currentMiniY == 6) && (map.get(mapx,mapy) != tb || map.get(mapx,mapy) == cloud)) {
    return true;
  }
  
  else if (currentMiniY >= 7) {
    return true;
  }
  
  else {
    return false;
  }

}

boolean canMoveDown() {
  int mapx,mapy;
  mapx = int(eyeX + 5000) / gridSize; 
  mapy = int(eyeY + 5000) / gridSize;  
  if (currentMiniY >= 0) {
    return true;
  }
  else if (currentMiniY == -1 && map.get(mapx,mapy) == ho) {
    return true;
  }
  else if (currentMiniY == -2 && map.get(mapx,mapy) == ho2) {
    return true;
  }
  else {
    return false;
  }
}



//// Door helper functions
//boolean isDoorBlock(int gridX, int gridZ) {
//  color c = map.get(gridX, gridZ);
//  return c == lc3; // Only lc3 blocks have doors
//}

//boolean isDoorOpen(int gridX, int gridZ) {
//  String doorKey = gridX + "," + gridZ;
//  return doorStates.getOrDefault(doorKey, false);
//}
