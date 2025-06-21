//Eric Li
//May 18th 2025

//import
import java.awt.Robot;

//mouse wrapping
Robot rbt;
boolean skipFrame;

//game variables
boolean wkey, akey, skey, dkey,okey,zkey, spacekey, shiftkey, sprintkey = false;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;   

//COLOR PALLETE
//sky blue
color daylight = #87CEEB;
//black
color nighttime = #000000;
//white color rgb(255,255,255)
color white = #FFFFFF;
//black color rgb(0,0,0)
color black = #000000;
//blue color rgb(0,0,255)
color blue = #0000FF;
//pink color rgb(193, 28, 132)
color pink = #C11C84;
//red color rgb(255, 0, 0)
color red = #FF0000;
//green color rgb(0, 255, 0)
color green = #00FF00;
//yellow color rgb(255, 255, 0)
color yellow = #FFFF00;
//gold color rgb(255, 215, 0)
color gold = #FFD700;
//orange color rgb(255, 165, 0)
color orange = #FFA500;
//grey color rgb(100, 100, 100)
color grey = #646464;
//light grey color rgb(211, 211, 211)
color lightgrey = #D3D3D3;
//purple color rgb(211, 3, 252)
color purple = #d303fc;
//purple blue color rgb(115, 3, 252)
color purpblue = #7303fc;
//color treebranch
color tb = #22B14C;
//color dirt
color dt = #880015;
//color dirt2
color dt2 = #880014;
//color dirt 3
color dt3 = #880013;
//color dirt 4
color dt4 = #880012; 
//color rock
color st = #C3C3C3;
//color rock2
color st2 = #C3C3C2;
//color  berrry
color br = #ED1C24;
//color hole
color ho = #000003;
//color hole2
color ho2 = #000002;
//color diamond
color dia = #99D9EA;
//coal
color coalc = #7F7F7F;
//cobblestone
color cbs = #969696;
//wall
color wl = #450E0F;
//glass
color gls = #FFFFFE;
//leaf column
color lc = #B5E61D;
//leaf column 2
color lc2 = #C9FF20;
//leaf column 3
color lc3 = #C9FF21;
//spruce plank
color spp = #FFF200;
//transparent
color transparent = color(0, 1, 0, 0);
//pumpkin
color pumpk = #FFF201;

//Map variables
int gridSize;
PImage map;
boolean[][][] solidBlocks; // 3D array for solid blocks

//texture variables
PImage grassbs;
PImage grassbt;
PImage grassbb;
PImage spwoodbt;
PImage spwoodbs;
PImage spleaves;
PImage Stones;
PImage Berry;
PImage bedrock;
PImage diamond;
PImage coal;
PImage cobblestone;
PImage glass;
PImage spplanks;
PImage background;
PImage trapdoor;
PImage sprucedoor;
PImage pumpkint;
PImage pumpkinb;
PImage pumpkins;
PImage pumpkinf;

// Player collision dimensions (AABB)
float playerWidth = 0.6 * gridSize;
float playerDepth = 0.6 * gridSize;
float playerHeightBox = 1.8 * gridSize;  // Total height of player
float eyeToFeet = 1.62 * gridSize;  // Distance from eyes to feet



// Tree height 
int[][] treeHeights;

//berry position
ArrayList<PVector> berryBushes = new ArrayList<>();
ArrayList<PVector> glassBlocks = new ArrayList<>();

//canvases
PGraphics world;
PGraphics HUD;

//Game Objects
ArrayList<GameObject> objects;

 //mode frame work
  int mode = 0;
  final int loading = 0;
  final int game = 1;
  
  //Button class
 Button myButton;
 boolean mouseReleased;
 boolean wasPressed;
 
 //Font for all text
  PFont all;
  
  // Door state management
  HashMap<String, Boolean> doorStates = new HashMap<>();
  boolean doorClicked = false;
  
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
  buildSolidBlocks();
  
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
  
 
  
  // Initialize button (text, x, y, w, h, normalColor, highlightColor)
  myButton = new Button("START", 1920/2, 1080/2 + 400, 300, 100, transparent, white);
  
  //load font
  all = createFont("MinecraftTen-VGORe.ttf", 200); 
  
  if (map == null) {
    println("ERROR: Map not found!");
    exit();
} else {
    map.loadPixels(); // Ensure pixels are available
}



}

void buildSolidBlocks() {
    if (map == null) {
        println("Error: Map not loaded!");
        return;
    }
    
    // Load pixels for direct access
    map.loadPixels();
    
    solidBlocks = new boolean[map.width][50][map.height];
    
    for (int x = 0; x < map.width; x++) {
        for (int z = 0; z < map.height; z++) {
            // Get color from pixel array
            color c = map.pixels[z * map.width + x];
            
            // Base layers
            solidBlocks[x][0][z] = true; // Bedrock bottom
            solidBlocks[x][1][z] = (c != ho && c != ho2); // Dirt/grass unless hole
            solidBlocks[x][2][z] = true; // Stone
            solidBlocks[x][3][z] = true; // Stone
            solidBlocks[x][4][z] = true; // Stone
            solidBlocks[x][5][z] = true; // Bedrock top

            //// Tree trunk
            if (c == tb) {
                int trunkHeight = treeHeights[x][z];
                for (int y = 6; y < 6 + trunkHeight; y++) {
                    if (y < 50) solidBlocks[x][y][z] = true;
                }
            }
            
            // Dirt variations
            if (c == dt || c == dt2 || c == dt3 || c == dt4) {
                solidBlocks[x][1][z] = true;
                if (c == dt2 || c == dt3 || c == dt4) solidBlocks[x][2][z] = true;
                if (c == dt3 || c == dt4) solidBlocks[x][3][z] = true;
                if (c == dt4) solidBlocks[x][4][z] = true;
            }
            
            // Stone variations
            if (c == st || c == st2) {
                solidBlocks[x][1][z] = true;
                if (c == st2) solidBlocks[x][2][z] = true;
            }
            
            // Ores
            if (c == dia) solidBlocks[x][1][z] = true;
            if (c == coalc) {
                solidBlocks[x][1][z] = true;
                solidBlocks[x][2][z] = true;
            }
            
            // Cobblestone
            if (c == cbs) {
                solidBlocks[x][0][z] = true;
                solidBlocks[x][5][z] = true;
            }
            
            // Walls
            if (c == wl) {
                for (int y = 6; y <= 8; y++) solidBlocks[x][y][z] = true;
            }
            
            // Leaves columns
            if (c == lc || c == lc2 || c == lc3) {
                for (int y = 6; y <= 9; y++) {
                    // For lc2, skip leaves at y=9
                    if (c == lc2 && y == 9) continue;
                    solidBlocks[x][y][z] = true;
                }
            }
            
            // Spruce planks
            if (c == spp) {
                for (int y = 6; y <= 9; y++) solidBlocks[x][y][z] = true;
            }
            
            // Pumpkin
            if (c == pumpk) solidBlocks[x][6][z] = true;
            
            // Glass
            if (c == gls) {
                for (int y = 6; y <= 8; y++) solidBlocks[x][y][z] = true;
            }
        }
    }
    
    println("Solid blocks built successfully!");
}


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
