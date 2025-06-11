void drawMinimap() {
  HUD.image(map,50,50,160,160);
  int miniX = int(eyeX+5000)/gridSize;
  int miniY = int(eyeZ+5000)/gridSize;
  
  // Convert to minimap coordinates
  int mapX = miniX*4 + 50;
  int mapY = miniY*4 +50;
  
  // Draw direction 
  icon(15, mapX, mapY, leftRightHeadAngle + PI);
  
  HUD.textSize(20);
  HUD.text("X: " + miniX,50,230);
  HUD.text("Y: " + miniY,50,270);
}

void icon(int size, int x, int y, float direction) {
  HUD.strokeWeight(0);
  HUD.fill(red);
  // Draw arc rotated to match player's direction
  float startAngle = direction - QUARTER_PI/2;  
  float endAngle = direction + QUARTER_PI/2;    
  HUD.arc(x, y, size, size, startAngle, endAngle, PIE);
}
    
