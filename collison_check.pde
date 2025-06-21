boolean isColliding(float testX, float testY, float testZ) {
  // Define player bounding box dimensions
  float halfWidth = 0.03 * gridSize;
  float halfDepth = 0.03 * gridSize;
  float playerHeight = 1.8 * gridSize;

  // Calculate player's AABB in world coordinates
  float playerMinX = testX - halfWidth;
  float playerMaxX = testX + halfWidth;
  float playerMinZ = testZ - halfDepth;
  float playerMaxZ = testZ + halfDepth;
  float playerMinY = testY - playerHeight;
  float playerMaxY = testY;

  // Convert bounding box to grid space
  int minGridX = (int)((playerMinX + 5000) / gridSize);
  int maxGridX = (int)((playerMaxX + 5000) / gridSize);
  int minGridZ = (int)((playerMinZ + 5000) / gridSize);
  int maxGridZ = (int)((playerMaxZ + 5000) / gridSize);
  int minGridY = (int)(playerMinY / gridSize);
  int maxGridY = (int)(playerMaxY / gridSize);

  // Check collisions within bounding box range
  for (int y = minGridY; y <= maxGridY; y++) {
    for (int x = minGridX; x <= maxGridX; x++) {
      for (int z = minGridZ; z <= maxGridZ; z++) {
       if (x < 0 || x >= map.width || z < 0 || z >= map.height || y < 0 || y >= 50)
          continue;

        if (!solidBlocks[x][y][z])
          continue;

         //Skip open doors
        if (isDoorBlock(x, z) && isDoorOpen(x, z))
          continue;

        //// Block AABB in world space
        float blockMinX = x * gridSize - 5000;
        float blockMaxX = (x + 1) * gridSize - 5000;
        float blockMinZ = z * gridSize - 5000;
        float blockMaxZ = (z + 1) * gridSize - 5000;
        float blockMinY = y * gridSize;
        float blockMaxY = (y + 1) * gridSize;

        // Check for overlap in all 3 axes
         boolean xOverlap = (playerMaxX > blockMinX ) && (playerMinX < blockMaxX);
         boolean yOverlap = playerMaxY > (blockMinY) && playerMinY < (blockMaxY);
         boolean zOverlap = playerMaxZ > (blockMinZ) && playerMinZ < (blockMaxZ);
         
        // if (xOverlap) {
        //   println("collidied at x" + eyeX);
        // }
         
        // if (yOverlap) {
        //   println("collidied at y" + eyeY);
        // }
         
        // if (zOverlap) {
        //   println("collidied at z" + eyeZ);
        // }

        //if (xOverlap && yOverlap && zOverlap) {
        //  return true;
        //}
      }
    }
  }

  return false;
}





// Door helper functions
boolean isDoorBlock(int gridX, int gridZ) {
  color c = map.get(gridX, gridZ);
  return c == lc3; // Only lc3 blocks have doors
}

boolean isDoorOpen(int gridX, int gridZ) {
  String doorKey = gridX + "," + gridZ;
  return doorStates.getOrDefault(doorKey, false);
}
