void keyPressed () {
    if (dialogActive) return;
  if (key == 'W' || key == 'w' ) wkey = true;
  if (key == 'A' || key == 'a' ) akey = true;
  if (key == 'S' || key == 's' ) skey = true;
  if (key == 'D' || key == 'd' ) dkey = true;
  if (key == 'Z' || key == 'z' ) zkey = true;
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
}



void keyReleased () {
    if (dialogActive) return;
  if (key == 'W' || key == 'w' ) wkey = false;
  if (key == 'A' || key == 'a' ) akey = false;
  if (key == 'S' || key == 's' ) skey = false;
  if (key == 'D' || key == 'd' ) dkey = false;
  if (key == 'Z' || key == 'z' ) zkey = false;
  if (key == 'X' || key == 'x') xkey = false;
  if (key == ' ')  spacekey = false;
  if (keyCode == SHIFT) shiftkey = false;
  if (key == 'Q' || key == 'q') sprintkey = false;
}
