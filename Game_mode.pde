void game () {
  noCursor();
  //game engine
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(calculateBackgroundColor());
  
  
  
  if (calculateBackgroundColor() == nighttime) {
    world.pointLight(0,0,130,eyeX,eyeY,eyeZ);
}
  
  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  // Clear previous frame's bushes
  berryBushes.clear();
  
  // Draw opaque elements with depth testing
  world.hint(ENABLE_DEPTH_TEST);
  drawMap();
  
  drawBerryBushes();
  drawGlassBlocks();
  controlCamera();
 
  // Door interaction
  if (mouseReleased) {
    PVector targetedBlock = getTargetedBlock();
    
    if (targetedBlock != null) {
      int gridX = (int)targetedBlock.x;
      int gridY = (int)targetedBlock.y;
      String doorKey = gridX + "," + gridY;
      boolean currentState = doorStates.getOrDefault(doorKey, false);
      doorStates.put(doorKey, !currentState);
      println("Toggled door at: " + gridX + "," + gridY);
    }
    mouseReleased = false;
  }
  
  world.endDraw();
  image(world,0,0);
   
  HUD.beginDraw();
  HUD.clear();
  pushMatrix();
  scale(0.5);
  translate(width/2,height/2);
  cross();
  popMatrix();
   
  drawMinimap();
  HUD.endDraw();
  image(HUD,0,0);
}
