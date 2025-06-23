
//--------------------------------------------------------------
//**************************************************************
// THIS PAGE CONTAINS THE DECLARATION & INITIALIZATION CODE OF THE PROJECT
//**************************************************************
//--------------------------------------------------------------


//--------------------------------------------------------------
// Declarations Imports and Initializations
//--------------------------------------------------------------

//import for cursor wrapping
import java.awt.Robot;

// Import required Minim libraries for audio handling
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//popup
import javax.swing.JOptionPane;
import java.awt.EventQueue;

//mouse wrapping
Robot rbt;
boolean skipFrame;

//game variables
boolean wkey, akey, skey, dkey,zerokey,ninekey, spacekey, shiftkey, sprintkey,zkey,xkey= false;
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
//color seagreen color rgb (11, 80, 79)
color seagreen = #0B504F;
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
//cloud
color cloud = #F2F2F2;

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
PImage trident;
PImage sun;
PImage moon;

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
  
//hotbar
PImage hotbar;
PImage hotbarselector;
int blockSelected = 1;
boolean[] keys = new boolean[256];

//Bullet Class
Bullet Trident;

//sound
Minim minim;
AudioPlayer backgroundm;

//mapping mniy
int currentMiniY;

//pop up window
boolean dialogActive = false;
