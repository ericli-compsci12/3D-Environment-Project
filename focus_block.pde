PVector getTargetedBlock() {
  int gridX = (int)((eyeX + 5000) / gridSize);
  int gridZ = (int)((eyeZ + 5000) / gridSize);
  return new PVector(gridX, gridZ);
}
