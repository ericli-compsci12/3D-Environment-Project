//Eric Li
//May 18th 2025
  
void setup () {
  click();
  fullScreen(P2D);
  //create canvases
  println(width,height);
  world = createGraphics(1920,1080,P3D);
  HUD = createGraphics(1920,1080,P2D);
  
  //create game object list
  objects = new ArrayList<GameObject>();
  
  
  wkey = akey =skey = dkey = false;
  eyeX = 0;
  eyeY = height - eyeToFeet - 400;
  eyeZ = 0;
  focusX = width/2;
  focusY = height/2;
  focusZ = 10;
  tiltX = 0;
  tiltY = 1;
  tiltZ = 0;
  leftRightHeadAngle = radians(270);
  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;

  //initialize map
  map = loadImage("map.png");
  gridSize = 10000 / map.width; // Adjust gridSize based on map width
  map = loadImage("map.png");
  
   

  treeHeights = new int[map.width][map.height];
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if (c == tb) {
        treeHeights[x][y] = (int)random(3, 8);
      } else {
        treeHeights[x][y] = 0; // No tree
      }
    }
  }
  
  // Initialize solid blocks array
  //buildSolidBlocks();
  
  //load textures
  grassbs = loadImage("grass_block_side.png");
  grassbt = loadImage("Grass_Block_Top_C.png");
  grassbb = loadImage("dirt.png");
  spwoodbt  = loadImage("spruce_log_top.png");
  spwoodbs  = loadImage("spruce_log.png");
  spleaves =  loadImage("spruceleaves.jpg");
  Stones =  loadImage("stone.png");
  Berry =  loadImage("berry bush.png");
  bedrock =  loadImage("Bedrock.png");
  diamond = loadImage("diamond_ore.png");
  coal = loadImage("coal_ore.png");
  cobblestone = loadImage("cobblestone.png");
  glass = loadImage("glass.png");
  spplanks = loadImage("spruce_planks.png");
  background = loadImage("starting image.png");
  trapdoor = loadImage("Spruce_Trapdoor.png");
  sprucedoor = loadImage("sprucedoor.jpg");
  pumpkint = loadImage("pumpkin_top.png");
  pumpkins = loadImage("pumpkin_side.png");
  pumpkinb = loadImage("pumpkin_bottom.png");
  pumpkinb = loadImage("pumpkin_bottom.png");
  pumpkinf = loadImage("jack_o_lantern.png");
  hotbar = loadImage("hotbar.png");
  hotbarselector = loadImage("hotbarselector.png");
  trident = loadImage("Trident.png");
  sun = loadImage("sun.png");
  moon = loadImage("moon.jpg");
 
  
  // Initialize button (text, x, y, w, h, normalColor, highlightColor)
  myButton = new Button("START", 1920/2, 1080/2 + 400, 300, 100, transparent, white);
  
  //initialize bullet
  Trident = new Bullet();
  
  //load font
  all = createFont("MinecraftTen-VGORe.ttf", 200); 
  
  // Initialize audio system
  minim = new Minim (this);
  
  // Load all audio files
  backgroundm = minim.loadFile("nop.mp3");
  
  //loop the song
  backgroundm.loop();
  
  if (map == null) {
    println("ERROR: Map not found!");
    exit();
} else {
    map.loadPixels(); // Ensure pixels are available
}



}

//void buildSolidBlocks() {
//    if (map == null) {
//        println("Error: Map not loaded!");
//        return;
//    }
    
//    // Load pixels for direct access
//    map.loadPixels();
    
//    solidBlocks = new boolean[map.width][50][map.height];
    
//    for (int x = 0; x < map.width; x++) {
//        for (int z = 0; z < map.height; z++) {
//            // Get color from pixel array
//            color c = map.pixels[z * map.width + x];
            
//            // Base layers
//            solidBlocks[x][0][z] = true; // Bedrock bottom
//            solidBlocks[x][1][z] = (c != ho && c != ho2); // Dirt/grass unless hole
//            solidBlocks[x][2][z] = true; // Stone
//            solidBlocks[x][3][z] = true; // Stone
//            solidBlocks[x][4][z] = true; // Stone
//            solidBlocks[x][5][z] = true; // Bedrock top

//            //// Tree trunk
//            if (c == tb) {
//                int trunkHeight = treeHeights[x][z];
//                for (int y = 6; y < 6 + trunkHeight; y++) {
//                    if (y < 50) solidBlocks[x][y][z] = true;
//                }
//            }
            
//            // Dirt variations
//            if (c == dt || c == dt2 || c == dt3 || c == dt4) {
//                solidBlocks[x][1][z] = true;
//                if (c == dt2 || c == dt3 || c == dt4) solidBlocks[x][2][z] = true;
//                if (c == dt3 || c == dt4) solidBlocks[x][3][z] = true;
//                if (c == dt4) solidBlocks[x][4][z] = true;
//            }
            
//            // Stone variations
//            if (c == st || c == st2) {
//                solidBlocks[x][1][z] = true;
//                if (c == st2) solidBlocks[x][2][z] = true;
//            }
            
//            // Ores
//            if (c == dia) solidBlocks[x][1][z] = true;
//            if (c == coalc) {
//                solidBlocks[x][1][z] = true;
//                solidBlocks[x][2][z] = true;
//            }
            
//            // Cobblestone
//            if (c == cbs) {
//                solidBlocks[x][0][z] = true;
//                solidBlocks[x][5][z] = true;
//            }
            
//            // Walls
//            if (c == wl) {
//                for (int y = 6; y <= 8; y++) solidBlocks[x][y][z] = true;
//            }
            
//            // Leaves columns
//            if (c == lc || c == lc2 || c == lc3) {
//                for (int y = 6; y <= 9; y++) {
//                    // For lc2, skip leaves at y=9
//                    if (c == lc2 && y == 9) continue;
//                    solidBlocks[x][y][z] = true;
//                }
//            }
            
//            // Spruce planks
//            if (c == spp) {
//                for (int y = 6; y <= 9; y++) solidBlocks[x][y][z] = true;
//            }
            
//            // Pumpkin
//            if (c == pumpk) solidBlocks[x][6][z] = true;
            
//            // Glass
//            if (c == gls) {
//                for (int y = 6; y <= 8; y++) solidBlocks[x][y][z] = true;
//            }
//        }
//    }
    
//    println("Solid blocks built successfully!");
//}


void draw() {
  
  if (mode == game) {
    game();
  }
  else if (mode == loading) {
    loadingPage();
  }
  
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
}

void click() {
  doorClicked = false;
  if (mousePressed) {
    wasPressed = true;
  } else {
    if (wasPressed) {
      mouseReleased = true;
      wasPressed = false;
    } else {
      mouseReleased = false;
    }
  }
}

//void drawFloor () {
//  world.stroke(255);
//  // Expand floor grid to 5000x5000
//  for (int x = -2500; x <= 2500; x = x + 100) {
//    world.line(x, height, -2500, x, height, 2500);
//    world.line(-2500, height, x, 2500, height, x);
//  }
//}
