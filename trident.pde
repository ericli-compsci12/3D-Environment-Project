void trident(float x, float y, float z, float w, float h, float d) {
 
  world.pushStyle();
  

  world.fill(seagreen);
  world.noStroke();

  world.pushMatrix();
  world.translate(x, y, z+100);
  world.box(w, h, d+250);
  world.popMatrix();
  
  world.fill(seagreen);
  world.pushMatrix();
  world.translate(x, y, z);
  world.translate(0, 0, -60 * (d/200)); 
  world.box(80 * (d/200), 10 * (h/10), 10 * (w/10));
  world.popMatrix();

  world.pushMatrix();
  world.translate(x, y, z);
  world.translate(40 * (d/200), 0, -80 * (d/200));
  world.fill(seagreen);
  world.box(10 * (w/10), 10 * (h/10), 50 * (d/200)); 
  world.popMatrix();
  
  world.pushMatrix();
  world.translate(x, y, z);
  world.translate(-40 * (d/200), 0, -80 * (d/200)); 
  world.fill(seagreen);
  world.box(10 * (w/10), 10 * (h/10), 50 * (d/200)); 
  world.popMatrix();

  world.popStyle();
}
