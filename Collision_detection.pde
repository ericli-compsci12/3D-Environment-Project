boolean isColliding(float testX, float testY, float testZ, float radius, float height) {
  if (solidBlocks == null) {
        println("Collision system not initialized!");
        return false;
    }
    
    // Convert to grid coordinates with bounds checking
    int minGridX = max(0, (int)((testX - radius + 5000) / gridSize));
    int maxGridX = min(map.width-1, (int)((testX + radius + 5000) / gridSize));
    int minGridZ = max(0, (int)((testZ - radius + 5000) / gridSize));
    int maxGridZ = min(map.height-1, (int)((testZ + radius + 5000) / gridSize));
    int minGridY = max(0, (int)(testY / gridSize));
    int maxGridY = min(49, (int)((testY + height) / gridSize)); // Max 49 layers

    for (int y = minGridY; y <= maxGridY; y++) {
        for (int x = minGridX; x <= maxGridX; x++) {
            for (int z = minGridZ; z <= maxGridZ; z++) {
                // Skip non-solid blocks
                if (!solidBlocks[x][y][z]) continue;
                
                // Special case for doors
                if (isDoorBlock(x, z) && isDoorOpen(x, z)) {
                    continue;
                }
                
                // Block position in world coordinates
                float blockX = x * gridSize - 5000;
                float blockZ = z * gridSize - 5000;
                float blockY = y * gridSize;
                
                // Collision detection
                float closestX = constrain(testX, blockX, blockX + gridSize);
                float closestZ = constrain(testZ, blockZ, blockZ + gridSize);
                float distance = dist(testX, testZ, closestX, closestZ);
                
                boolean yOverlap = (testY < blockY + gridSize) && (testY + height > blockY);
                
                if (distance < radius && yOverlap) {
                    return true;
                }
            }
        }
    }
    return false;
}



boolean isDoorBlock(int gridX, int gridZ) {
    color c = map.get(gridX, gridZ);
    return c == lc3; // Only lc3 blocks have doors
}

boolean isDoorOpen(int gridX, int gridZ) {
    String doorKey = gridX + "," + gridZ;
    return doorStates.getOrDefault(doorKey, false);
}
