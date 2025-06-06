//top and bottom are different,sides are the same
void texturedCube (float x, float y,float z,PImage Texturet,PImage Textureb,PImage Textures,float size) {
  pushMatrix();
  translate(x,y,z);
  scale(size);
  noStroke();
  beginShape(QUADS);
  texture(Textureb);
  //bottom
  //     x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  endShape();
  
  beginShape(QUADS);
  texture(Texturet);
  
  //top
  vertex(0,-1,0,0,0);
  vertex(1,-1,0,1,0);
  vertex(1,-1,1,1,1);
  vertex(0,-1,1,0,1);
  
  endShape();
  
  beginShape(QUADS);
  texture(Textures);
  
  //front
  vertex(0,0,1,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(0,-1,1,1,0);
  
  //back
  vertex(0,0,0,1,1);
  vertex(1,0,0,0,1);
  vertex(1,-1,0,0,0);
  vertex(0,-1,0,1,0);
 
  
  //left
  vertex(0,0,0,1,1);
  vertex(0,0,1,0,1);
  vertex(0,-1,1,0,0);
  vertex(0,-1,0,1,0);
 
  //right
  vertex(1,0,0,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(1,-1,0,1,0);
  
  endShape();
  popMatrix();
}

//all faces of the block are the same
void texturedCube (float x, float y,float z,PImage Texture,float size) {
  pushMatrix();
  translate(x,y,z);
  scale(size);
  noStroke();
  beginShape(QUADS);
  texture(Texture);
  //bottom
  //     x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
 
  //top
  vertex(0,-1,0,0,0);
  vertex(1,-1,0,1,0);
  vertex(1,-1,1,1,1);
  vertex(0,-1,1,0,1);
  
 
  //front
  vertex(0,0,1,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(0,-1,1,1,0);
  
  //back
  vertex(0,0,0,1,1);
  vertex(1,0,0,0,1);
  vertex(1,-1,0,0,0);
  vertex(0,-1,0,1,0);
 
  
  //left
  vertex(0,0,0,1,1);
  vertex(0,0,1,0,1);
  vertex(0,-1,1,0,0);
  vertex(0,-1,0,1,0);
 
  //right
  vertex(1,0,0,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(1,-1,0,1,0);
  
  endShape();
  popMatrix();
}

//all sides aare differennt
void texturedCube (float x, float y,float z,PImage Textureto,PImage Texturebo,PImage Texturefr,PImage Texturele,PImage Textureri,PImage Textureba,float size) {
  pushMatrix();
  translate(x,y,z);
  scale(size);
  noStroke();
  beginShape(QUADS);
  texture(Texturebo);
  //bottom
  //     x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  endShape();
  
  beginShape(QUADS);
  texture(Textureto);
  
  //top
  vertex(0,-1,0,0,0);
  vertex(1,-1,0,1,0);
  vertex(1,-1,1,1,1);
  vertex(0,-1,1,0,1);
  
  endShape();
  
  beginShape(QUADS);
  texture(Texturefr);
  
  //front
  vertex(0,0,1,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(0,-1,1,1,0);
  
  endShape();
  
  beginShape(QUADS);
  texture(Textureba);
  
  //back
  vertex(0,0,0,1,1);
  vertex(1,0,0,0,1);
  vertex(1,-1,0,0,0);
  vertex(0,-1,0,1,0);
  endShape();
  
  beginShape(QUADS);
  texture(Texturele);
  
  //left
  vertex(0,0,0,1,1);
  vertex(0,0,1,0,1);
  vertex(0,-1,1,0,0);
  vertex(0,-1,0,1,0);
  
  endShape();
  
  beginShape(QUADS);
  texture(Textureri);
 
  //right
  vertex(1,0,0,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(1,-1,0,1,0);
  
  endShape();
  popMatrix();
}

//top and bottom,sides are the same 
void texturedCube (float x, float y,float z,PImage Texturetb,PImage Textures,float size) {
  pushMatrix();
  translate(x,y,z);
  scale(size);
  noStroke();
  beginShape(QUADS);
  texture(Texturetb);
  //bottom
  //     x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  
  
  //top
  vertex(0,-1,0,0,0);
  vertex(1,-1,0,1,0);
  vertex(1,-1,1,1,1);
  vertex(0,-1,1,0,1);
  
  endShape();
  
  beginShape(QUADS);
  texture(Textures);
  
  //front
  vertex(0,0,1,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(0,-1,1,1,0);
  
  //back
  vertex(0,0,0,1,1);
  vertex(1,0,0,0,1);
  vertex(1,-1,0,0,0);
  vertex(0,-1,0,1,0);
 
  
  //left
  vertex(0,0,0,1,1);
  vertex(0,0,1,0,1);
  vertex(0,-1,1,0,0);
  vertex(0,-1,0,1,0);
 
  //right
  vertex(1,0,0,1,1);
  vertex(1,0,1,0,1);
  vertex(1,-1,1,0,0);
  vertex(1,-1,0,1,0);
  
  endShape();
  popMatrix();
}

void texturedCross(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  noStroke();
  
  // Enable alpha blending
  blendMode(BLEND);
  
  // First quad
  beginShape(QUADS);
  texture(texture);
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, -1, 1, 1, 1);
  vertex(0, -1, 0, 0, 1);
  endShape();
  
  // Second quad
  beginShape(QUADS);
  texture(texture);
  vertex(1, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, -1, 1, 1, 1);
  vertex(1, -1, 0, 0, 1);
  endShape();
  
  popMatrix();
}
