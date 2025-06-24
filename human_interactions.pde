void keyPressed () {
    if (dialogActive) return;
  if (key == 'W' || key == 'w' || keyCode == UP ) wkey = true;
  if (key == 'A' || key == 'a' || keyCode == LEFT) akey = true;
  if (key == 'S' || key == 's' || keyCode == DOWN) skey = true;
  if (key == 'D' || key == 'd' || keyCode == RIGHT) dkey = true;
  if (key == 'Z' || key == 'z' ) zkey = true;
  if (key == '8') eightkey = true;
  if (key == '9') {
    ninekey = true;
    zerokey = false;
  }
  if (key == '0') {
    zerokey = true;
    ninekey = false;}
  if (key == ' ')  spacekey = true;
  if (keyCode == SHIFT) shiftkey = true;
  if (key == 'Q' || key == 'q') sprintkey = true;
  
  if (key < 256)
    keys[Character.toLowerCase(key)] = true;
    
    if (key == 'X' || key == 'x') xkey = true;
    if (key == 'M' || key == 'm') m++;
    if (keyCode == CONTROL) {
      control = true;
    }
    
    //loop the song
  if (m%2 == 0) {
  if (!backgroundm.isPlaying()) {
  backgroundm.loop(); 
  }
  }
  if (m%2 == 1) {
  backgroundm.pause();  
  }
}



void keyReleased () {
    if (dialogActive) return;
  if (key == 'W' || key == 'w' || keyCode == UP ) wkey = false;
  if (key == 'A' || key == 'a' || keyCode == LEFT) akey = false;
  if (key == 'S' || key == 's' || keyCode == DOWN) skey = false;
  if (key == 'D' || key == 'd' || keyCode == RIGHT) dkey = false;
  if (key == 'Z' || key == 'z' ) zkey = false;
  if (key == 'X' || key == 'x') xkey = false;
  if (key == ' ')  spacekey = false;
  if (keyCode == SHIFT) shiftkey = false;
  if (key == 'Q' || key == 'q') sprintkey = false;
  if (keyCode == CONTROL) control = false;
  if (key == '8') eightkey = false;
}
