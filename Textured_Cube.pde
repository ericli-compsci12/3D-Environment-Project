//top and bottom are different,sides are the same
void texturedCube (float x, float y,float z,PImage Texturet,PImage Textureb,PImage Textures,float size) {
  world.pushMatrix();
  world.translate(x,y,z);
  world.scale(size);
  world.noStroke();
  world.beginShape(QUADS);
  world.texture(Textureb);
  //bottom
  //     x,y,z,tx,ty
  world.vertex(0,0,0,0,0);
  world.vertex(1,0,0,1,0);
  world.vertex(1,0,1,1,1);
  world.vertex(0,0,1,0,1);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Texturet);
  
  //top
  world.vertex(0,-1,0,0,0);
  world.vertex(1,-1,0,1,0);
  world.vertex(1,-1,1,1,1);
  world.vertex(0,-1,1,0,1);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Textures);
  
  //front
  world.vertex(0,0,1,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(0,-1,1,1,0);
  
  //back
  world.vertex(0,0,0,1,1);
  world.vertex(1,0,0,0,1);
  world.vertex(1,-1,0,0,0);
  world.vertex(0,-1,0,1,0);
 
  
  //left
  world.vertex(0,0,0,1,1);
  world.vertex(0,0,1,0,1);
  world.vertex(0,-1,1,0,0);
  world.vertex(0,-1,0,1,0);
 
  //right
  world.vertex(1,0,0,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(1,-1,0,1,0);
  
  world.endShape();
  world.popMatrix();
}

//all faces of the block are the same
void texturedCube (float x, float y,float z,PImage Texture,float size) {
  world.pushMatrix();
  world.translate(x,y,z);
  world.scale(size);
  world.noStroke();
  world.beginShape(QUADS);
  world.texture(Texture);
  //bottom
  //     x,y,z,tx,ty
  world.vertex(0,0,0,0,0);
  world.vertex(1,0,0,1,0);
  world.vertex(1,0,1,1,1);
  world.vertex(0,0,1,0,1);
 
  //top
  world.vertex(0,-1,0,0,0);
  world.vertex(1,-1,0,1,0);
  world.vertex(1,-1,1,1,1);
  world.vertex(0,-1,1,0,1);
  
 
  //front
  world.vertex(0,0,1,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(0,-1,1,1,0);
  
  //back
  world.vertex(0,0,0,1,1);
  world.vertex(1,0,0,0,1);
  world.vertex(1,-1,0,0,0);
  world.vertex(0,-1,0,1,0);
 
  
  //left
  world.vertex(0,0,0,1,1);
  world.vertex(0,0,1,0,1);
  world.vertex(0,-1,1,0,0);
  world.vertex(0,-1,0,1,0);
 
  //right
  world.vertex(1,0,0,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(1,-1,0,1,0);
  
  world.endShape();
  world.popMatrix();
}

//all sides aare differennt
void texturedCube (float x, float y,float z,PImage Textureto,PImage Texturebo,PImage Texturefr,PImage Texturele,PImage Textureri,PImage Textureba,float size) {
  world.pushMatrix();
  world.translate(x,y,z);
  world.scale(size);
  world.noStroke();
  world.beginShape(QUADS);
  world.texture(Texturebo);
  //bottom
  //     x,y,z,tx,ty
  world.vertex(0,0,0,0,0);
  world.vertex(1,0,0,1,0);
  world.vertex(1,0,1,1,1);
  world.vertex(0,0,1,0,1);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Textureto);
  
  //top
  world.vertex(0,-1,0,0,0);
  world.vertex(1,-1,0,1,0);
  world.vertex(1,-1,1,1,1);
  world.vertex(0,-1,1,0,1);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Texturefr);
  
  //front
  world.vertex(0,0,1,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(0,-1,1,1,0);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Textureba);
  
  //back
  world.vertex(0,0,0,1,1);
  world.vertex(1,0,0,0,1);
  world.vertex(1,-1,0,0,0);
  world.vertex(0,-1,0,1,0);
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Texturele);
  
  //left
  world.vertex(0,0,0,1,1);
  world.vertex(0,0,1,0,1);
  world.vertex(0,-1,1,0,0);
  world.vertex(0,-1,0,1,0);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Textureri);
 
  //right
  world.vertex(1,0,0,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(1,-1,0,1,0);
  
  world.endShape();
  world.popMatrix();
}

//top and bottom,sides are the same 
void texturedCube (float x, float y,float z,PImage Texturetb,PImage Textures,float size) {
  world.pushMatrix();
  world.translate(x,y,z);
  world.scale(size);
  world.noStroke();
  world.beginShape(QUADS);
  world.texture(Texturetb);
  //bottom
  //     x,y,z,tx,ty
  world.vertex(0,0,0,0,0);
  world.vertex(1,0,0,1,0);
  world.vertex(1,0,1,1,1);
  world.vertex(0,0,1,0,1);
  
  
  //top
  world.vertex(0,-1,0,0,0);
  world.vertex(1,-1,0,1,0);
  world.vertex(1,-1,1,1,1);
  world.vertex(0,-1,1,0,1);
  
  world.endShape();
  
  world.beginShape(QUADS);
  world.texture(Textures);
  
  //front
  world.vertex(0,0,1,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(0,-1,1,1,0);
  
  //back
  world.vertex(0,0,0,1,1);
  world.vertex(1,0,0,0,1);
  world.vertex(1,-1,0,0,0);
  world.vertex(0,-1,0,1,0);
 
  
  //left
  world.vertex(0,0,0,1,1);
  world.vertex(0,0,1,0,1);
  world.vertex(0,-1,1,0,0);
  world.vertex(0,-1,0,1,0);
 
  //right
  world.vertex(1,0,0,1,1);
  world.vertex(1,0,1,0,1);
  world.vertex(1,-1,1,0,0);
  world.vertex(1,-1,0,1,0);
  
  world.endShape();
  world.popMatrix();
}

void texturedCross(float x, float y, float z, PImage texture, float size) {
  world.pushMatrix();
  world.translate(x, y, z);
  world.scale(size);
  world.noStroke();
  
  // Enable alpha blending
  world.blendMode(BLEND);
  
  // First quad
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(0, 0, 0, 0, 0);
  world.vertex(1, 0, 1, 1, 0);
  world.vertex(1, -1, 1, 1, 1);
  world.vertex(0, -1, 0, 0, 1);
  world.endShape();
  
  // Second quad
  world.beginShape(QUADS);
  world.texture(texture);
  world.vertex(1, 0, 0, 0, 0);
  world.vertex(0, 0, 1, 1, 0);
  world.vertex(0, -1, 1, 1, 1);
  world.vertex(1, -1, 0, 0, 1);
  world.endShape();
  
  world.popMatrix();
}
