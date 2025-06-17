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
    mode ++;
  }
}
