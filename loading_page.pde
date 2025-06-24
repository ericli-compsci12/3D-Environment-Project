void loadingPage() {
  background(black);
  
  pushStyle();
  imageMode(CORNER);
  image(background, 0, 0, width, height);
  popStyle();
  // Show and handle button

  myButton.text = "S T A R T";
  myButton.show();
  
  fill(white);
  textSize(750);
  textAlign(CENTER, CENTER);
  textFont(all);
  text(  "M I N E C A F T", width/2, 200);
  
  click();
  
  if (mouseReleased && myButton.isHovered()) {
    mode = game;
    Trident.lives = 0;
  }
  
  if (control && !dialogActive) {
   cursor();
    dialogActive = true;
    control = false;
    
    new Thread(() -> {
      // Create dialog on a separate thread
      javax.swing.JFrame frame = new javax.swing.JFrame();
      frame.setAlwaysOnTop(true);
      
    JOptionPane.showMessageDialog(frame, message, "KEY INPUTS",JOptionPane.INFORMATION_MESSAGE);

    frame.dispose();
      dialogActive = false;
    }).start();
  }
  
  textAlign(CENTER, CENTER);
  fill(white);
  textSize(30);
  text("Press CONTROL Key To Learn More", width/2, height/2 + 480);
}  //<>//
