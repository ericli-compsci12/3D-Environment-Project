PVector getTargetedBlock() {
  int gridX = (int)((eyeX + 5000) / gridSize);
  int gridZ = (int)((eyeZ + 5000) / gridSize);
  return new PVector(gridX, gridZ);
}

PVector getTargetedDoor() {
  // Simple raycast - check 5 blocks in front of player
  float checkDistance = gridSize * 5;
  float step = gridSize / 2;
  
  for (float d = 0; d < checkDistance; d += step) {
    float checkX = eyeX + cos(leftRightHeadAngle) * d;
    float checkZ = eyeZ + sin(leftRightHeadAngle) * d;
    
    int gridX = (int)((checkX + 5000) / gridSize);
    int gridZ = (int)((checkZ + 5000) / gridSize);
    
    if (gridX >= 0 && gridX < map.width && gridZ >= 0 && gridZ < map.height) {
      color c = map.get(gridX, gridZ);
      if (c == lc3) { // Only lc3 blocks have doors
        return new PVector(gridX, gridZ);
      }
    }
  }
  return null;
}
