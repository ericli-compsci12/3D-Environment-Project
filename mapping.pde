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
        texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spplanks, gridSize,gridSize/2,gridSize);
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
        texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spplanks, gridSize,gridSize/2,gridSize);
      }
      
      if (c == lc) {
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,spleaves, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*2, y*gridSize-5000,spleaves, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*3, y*gridSize-5000,spleaves, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spleaves, gridSize);
      }
      
       if (c == lc2) {
        texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spleaves, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*3, y*gridSize-5000,trapdoor, gridSize,gridSize,gridSize*(3/16));
        texturedCube(x*gridSize-5000, height-gridSize*2, y*gridSize-5000,trapdoor, gridSize,gridSize,gridSize*(3/16));
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,trapdoor, gridSize,gridSize,gridSize*(3/16));
      }
      
      if (c == lc3) {
    texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spleaves, gridSize);
    
    // Get door state
    String doorKey = x + "," + y;
    boolean isOpen = doorStates.getOrDefault(doorKey, false);
    
    // Draw door based on state
    if (isOpen) {
        texturedCube(x*gridSize-5000 + gridSize, height-gridSize*1, y*gridSize-5000,sprucedoor, gridSize/10,gridSize*2);
    } else {
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,sprucedoor, gridSize,gridSize*2,gridSize*(3/16));
    }
    
    texturedCube(x*gridSize-5000, height-gridSize*3, y*gridSize-5000,trapdoor, gridSize,gridSize,gridSize*(3/16));
    texturedCube(x*gridSize-5000+gridSize*2, height-gridSize*4, y*gridSize-5000,spleaves, gridSize);
}

      
      if (c == spp) {
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,spplanks, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*2, y*gridSize-5000,spplanks, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*3, y*gridSize-5000,spplanks, gridSize);
        texturedCube(x*gridSize-5000, height-gridSize*4, y*gridSize-5000,spplanks, gridSize,gridSize/2,gridSize);
        texturedCube(x*gridSize-5000-gridSize, height-gridSize*4, y*gridSize-5000,spplanks, gridSize,gridSize/2,gridSize);
        texturedCube(x*gridSize-5000+gridSize, height-gridSize*4, y*gridSize-5000,spplanks, gridSize,gridSize/2,gridSize);
      }  
      
      if (c == pumpk) {
        texturedCube(x*gridSize-5000, height-gridSize*1, y*gridSize-5000,pumpkint,pumpkinb,pumpkinf,pumpkins,pumpkins,pumpkins, gridSize);
        if (calculateBackgroundColor() == nighttime) {
          pushStyle();
          world.lightFalloff(1.0, 0.0005, 0.000001);
           world.lightSpecular(200, 150, 100);
          world.pointLight(255, 220, 180,x*gridSize-5000, height-gridSize*2 , y*gridSize-5000);  
          world.pointLight(255, 220, 180,x*gridSize-5000+gridSize, height-gridSize*1 , y*gridSize-5000);  
        popStyle();
    }      
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
