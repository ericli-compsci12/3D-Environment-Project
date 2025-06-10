void drawBerryBushes() {
  // Enable depth testing and blending
  hint(ENABLE_DEPTH_TEST);
  world.blendMode(BLEND);
  hint(DISABLE_DEPTH_MASK);
  
  // Draw each bush 
  for (PVector bush : berryBushes) {
    texturedCross(bush.x, bush.y, bush.z, Berry, gridSize);
  }
  
  // Reset depth settings
  hint(ENABLE_DEPTH_MASK);
}

void drawGlassBlocks() {
  // Enable depth testing and blending
  hint(ENABLE_DEPTH_TEST);
  world.blendMode(BLEND);
  hint(DISABLE_DEPTH_MASK);
  
  // Set transparency for glass 
  world.tint(255, 180); 
  
  // Draw each glass block
  for (PVector block : glassBlocks) {
    texturedCube(block.x, block.y, block.z, glass, gridSize);
  }
  
  world.noTint(); // Reset tint
  world.hint(ENABLE_DEPTH_MASK);
}
