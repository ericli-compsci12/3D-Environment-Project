void game () {
  if (!dialogActive) {
  noCursor();
  }
  
  if (Trident.lives == 0) {
  if (zkey) {
  zkey = false;
  Trident.lives = 1;
  objects.add(new Bullet());
}
  }
  //game engine
  int i = 0;
  while (i < objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  
  for (int i_ = 1; i_ < 8; i_++) {
    if (keys['0'+i_]) {
      keys['0'+i_] = false;
      blockSelected = i_;
    }
  }
  
  world.beginDraw();
  world.textureMode(NORMAL);
  world.background(calculateBackgroundColor());
  
   for (GameObject obj : objects) {
    obj.show();
  }

  
   // Calculate day/night cycle intensity
  float sunIntensity = 0;
  float nightIntensity = 0;
  int totalCycle = 7200;
  int currentFrame = frameCount % totalCycle;
  
  if (ninekey) {
    // Forced night mode
    sunIntensity = 0;
    nightIntensity = 1;
  } else if (zerokey) {
    // Forced day mode
    sunIntensity = 1;
    nightIntensity = 0;
  } else if (currentFrame < 3600) {
    // Full daylight
    sunIntensity = 1;
    nightIntensity = 0;
  } else if (currentFrame < 3900) {
    // Sunset 
    float progress = (currentFrame - 3600) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    sunIntensity = 1 - t;
    nightIntensity = t;
  } else if (currentFrame < 6900) {
    // Full night 
    sunIntensity = 0;
    nightIntensity = 1;
  } else {
    // Sunrise 
    float progress = (currentFrame - 6900) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    sunIntensity = t;
    nightIntensity = 1 - t;
  }
 
  float celestialX = 5000;
  float celestialY = -10000;  
  float celestialZ = 5000;
  
  // sun light
  if (sunIntensity > 0) {
    int sunBrightness = (int)(5000 * sunIntensity);
    // Create sun light with full brightness
    world.pointLight(
      sunBrightness, 
      sunBrightness, 
      sunBrightness, 
      celestialX, celestialY, celestialZ
    );
    world.lightSpecular(255, 255, 255);
    world.lightFalloff(1, 0, 0.0000001);
  }
  
  // moonlight (1/4 sun brightness)
  if (nightIntensity > 0) {
    int moonBrightness = (int)(1250 * nightIntensity);  // 5000 / 4 = 1250
    // Create moon light with 1/4 brightness
    world.pointLight(
      moonBrightness, 
      moonBrightness, 
      moonBrightness, 
      celestialX, celestialY, celestialZ
    );
    world.lightSpecular(255, 255, 255);
    world.lightFalloff(1, 0, 0.0000001);
  }
  
  // direction lights (Downward facing)
  float directionalIntensity = 200 * sunIntensity + 50 * nightIntensity;
  world.directionalLight(
    (int)directionalIntensity, 
    (int)directionalIntensity, 
    (int)directionalIntensity, 
    0, -1, 0
  );
  
  // ambient light (1/4 brightness at night)
  float ambientLevel = 200 * sunIntensity + 50 * nightIntensity;
  world.ambientLight(
    (int)ambientLevel, 
    (int)ambientLevel, 
    (int)ambientLevel
  );

  world.camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  
  // Clear previous frame's bushes
  berryBushes.clear();
  
  // Draw opaque elements with depth testing
  world.hint(ENABLE_DEPTH_TEST);
  drawMap();
  
  drawBerryBushes();
  drawGlassBlocks();
  controlCamera();
  //drawFloor();
  
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
  
  //if (calculateBackgroundColor() == daylight) {
    
  //texturedCube(5000, -10001, 5000, sun, gridSize*400);
  //}
  
  //else {
  //  texturedCube(5000, -10001, 5000, moon, gridSize*400);  
  //}
  
  world.endDraw();
  image(world,0,0);
   
  HUD.beginDraw();
  HUD.clear();
 if (xkey && !dialogActive && mode == game) {
   cursor();
    dialogActive = true;
    xkey = false;
    
    new Thread(() -> {
      // Create dialog on a separate thread
      javax.swing.JFrame frame = new javax.swing.JFrame();
      frame.setAlwaysOnTop(true);
      
      String inputValue = javax.swing.JOptionPane.showInputDialog(
        frame,
        "Teleport to (format: x y z):", 
        "Teleport", 
        javax.swing.JOptionPane.QUESTION_MESSAGE
      );
      
      if (inputValue != null) {
        String[] coords = inputValue.split(" ");
        if (coords.length == 3) {
          try {
            eyeX = int(Float.parseFloat(coords[0])) * gridSize - 5000;
            eyeY = (-int(Float.parseFloat(coords[1])) + 21)*gridSize - 5000 ;
            eyeZ = int(Float.parseFloat(coords[2])) * gridSize - 5000 ;
          } 
          catch (NumberFormatException e) {
            System.err.println("Invalid input format");
          }
        }
      }
      frame.dispose();
      dialogActive = false;
    }).start();
  }
  
  if (control && !dialogActive) {
   cursor();
    dialogActive = true;
    control = false;
    
    new Thread(() -> {
      // Create dialog on a separate thread
      javax.swing.JFrame frame = new javax.swing.JFrame();
      frame.setAlwaysOnTop(true);
      
    JOptionPane.showMessageDialog(frame, message, "Information",JOptionPane.INFORMATION_MESSAGE);

    frame.dispose();
      dialogActive = false;
    }).start();
  }
  
  pushMatrix();
  scale(0.5);
  translate(width/2,height/2);
  cross();
  popMatrix();
   
  drawMinimap();
   int hotbarheight = hotbar.height*width/3/hotbar.width;
  HUD.image(hotbar, width/2-hotbarheight*3-57, height-hotbarheight/2-50, width/3, hotbarheight);

  HUD.image(hotbarselector, width/2+(blockSelected-5)*hotbarheight*40/44, height-hotbarheight/2-52, hotbarheight*48/44, hotbarheight*48/44);
  
  if (Trident.lives == 0) {
  HUD.image(trident, width/2+-4*hotbarheight*40/44+13, height-hotbarheight/2-30, hotbarheight*30/44, hotbarheight*30/44);
  }
  
  HUD.endDraw();
  image(HUD,0,0);
  

}
