void cross() {
   // Top arm
  rectMode(CENTER);
  rect(width/2, height/2 - 40, 10, 40);

  // Bottom arm
  rect(width/2, height/2 + 40, 10, 40);

  // Left arm
  rect(width/2-40, height/2, 40, 10);

  // Right arm
  rect(width/2 + 40, height/2, 40, 10);

  // Central dot
  square(width/2, height/2, 10);
  
  //top left corner
  rect(width/2-40, height/2-30, 10, 25);
  rect(width/2-30, height/2-38, 25, 10);
  
  //top right corner
  rect(width/2+40, height/2-30, 10, 25);
  rect(width/2+30, height/2-38, 25, 10);
  
  //down left corner
  rect(width/2-40, height/2+30, 10, 25);
  rect(width/2-30, height/2+38, 25, 10);
  
  //down right corner
  rect(width/2+40, height/2+30, 10, 25);
  rect(width/2+30, height/2+38, 25, 10);
}
  
    
