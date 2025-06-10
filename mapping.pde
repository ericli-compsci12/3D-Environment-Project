void drawMap () {
  glassBlocks.clear();
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      float wx = x * gridSize - 5000;
      float wz = y * gridSize - 5000;
      // Draw base block for all positions
      if (c != ho && c != ho2) {
      texturedCube(x*gridSize-5000, height, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      if (c != ho2) {
      texturedCube(x*gridSize-5000, height+gridSize, y*gridSize-5000, grassbb, gridSize);
      }
      
      texturedCube(x*gridSize-5000, height+gridSize*2, y*gridSize-5000, Stones, gridSize);
      texturedCube(x*gridSize-5000, height+gridSize*3, y*gridSize-5000, Stones, gridSize);
      texturedCube(x*gridSize-5000, height+gridSize*4, y*gridSize-5000, Stones, gridSize);
       texturedCube(x*gridSize-5000, height+gridSize*5, y*gridSize-5000, bedrock, gridSize);
      
      if (c == tb) {
        // Get tree height
        int trunkHeight = treeHeights[x][y];
        float topY = height - (trunkHeight - 1) * gridSize;
        
        // Draw trunk
        for (int i = 0; i < trunkHeight; i++) {
          float yPos = height - i * gridSize;
          texturedCube(x*gridSize-5000, yPos, y*gridSize-5000, spwoodbt, spwoodbs, gridSize);
        }
        
        // Draw leaves layers relative to top of trunk
        // First layer 
        drawLeavesLayer(x, y, topY, gridSize);
        // Second layer
        drawLeavesLayer(x, y, topY - gridSize, gridSize);
        // Third layer 
        drawLeavesLayer(x, y, topY - 2 * gridSize, gridSize);
        // Fourth layer
        texturedCube(x*gridSize-5000, topY - 3 * gridSize, y*gridSize-5000, spleaves, gridSize);
      }
      
      if (c == dt) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt2) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt3) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,grassbb, gridSize);
         texturedCube(x*gridSize-5000, height - gridSize*3, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
      }
      
      if (c == dt4) {        
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,grassbb, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*3, y*gridSize-5000, grassbb,gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*4, y*gridSize-5000, grassbb,gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*5, y*gridSize-5000, grassbt, grassbb, grassbs, gridSize);
        
      }
      
      if (c == st) {
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
      }
      
      if (c == st2) {
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,Stones, gridSize);
      }
      
      if (c == br) {
     
        berryBushes.add(new PVector(wx, height - gridSize, wz));
      }
      
       if (c == dia) {
     
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,diamond, gridSize);
      }
      
       if (c == coalc) {
        texturedCube(x*gridSize-5000, height - gridSize*2, y*gridSize-5000,Stones, gridSize);
        texturedCube(x*gridSize-5000, height - gridSize, y*gridSize-5000,coal, gridSize);
      }
      
       if (c == cbs) {
        texturedCube(x*gridSize-5000, height, y*gridSize-5000,cobblestone, gridSize);
      }
      
      if (c == wl) {
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,spwoodbt, spwoodbs, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*2, y*gridSize-5000,spwoodbt, spwoodbs, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*3, y*gridSize-5000,spwoodbt, spwoodbs, gridSize);
      }
      
      if (c == gls) {
        glassBlocks.add(new PVector(wx, height - gridSize, wz));
        glassBlocks.add(new PVector(wx, height - gridSize*2, wz));
        glassBlocks.add(new PVector(wx, height - gridSize*3, wz));
      }
      
    }
  }
}

void drawLeavesLayer(int x, int y, float layerY, float size) {
 
  for (int dx = -1; dx <= 1; dx++) {
    for (int dz = -1; dz <= 1; dz++) {
     
      if (abs(dx) == 1 && abs(dz) == 1) continue;
      texturedCube((x+dx)*gridSize-5000, layerY, (y+dz)*gridSize-5000, spleaves, size);
    }
  }
}
