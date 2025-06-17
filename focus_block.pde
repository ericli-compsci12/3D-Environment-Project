PVector getTargetedBlock() {
  float maxDistance = 500; 
  float step = 10;
  float distance = 0;
  
  while (distance < maxDistance) {
    float checkX = eyeX + cos(leftRightHeadAngle) * distance;
    float checkY = eyeY + tan(upDownHeadAngle) * distance;
    float checkZ = eyeZ + sin(leftRightHeadAngle) * distance;
    
    int gridX = int(checkX + 5000) / gridSize;
    int gridY = int(checkZ + 5000) / gridSize;
    
    if (gridX >= 0 && gridX < map.width && gridY >= 0 && gridY < map.height) {
      color c = map.get(gridX, gridY);
      if (c == lc3) {
        return new PVector(gridX, gridY);
      }
    }
    distance += step;
  }
  return null;
}
