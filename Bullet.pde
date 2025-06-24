class Bullet extends GameObject {
    PVector dir;
    float speed;
    
    Bullet() {
        super(eyeX, eyeY, eyeZ, 10);
        speed = 50;
        float vx = cos(leftRightHeadAngle);
        float vy = tan(upDownHeadAngle);
        float vz = sin(leftRightHeadAngle);
        dir = new PVector(vx, vy, vz);
        dir.setMag(speed);
    }
    
    void act() {
        int hitx = int(loc.x + 5000) / gridSize;  
        int hity = int(loc.z + 5000) / gridSize;
        int hitY = 21-int((loc.y+5000)/gridSize); 
        if ((map.get(hitx,hity) == white || map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == cbs || map.get(hitx,hity) == lc3 ) && (hitY == 0)) {
   loc.add(dir);
  } else if ((hitY == -1) && (map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == lc3 || map.get(hitx,hity) == white || map.get(hitx,hity) == cloud)) {
    loc.add(dir);
  }
  else if ((hitY == -2) && (map.get(hitx,hity) == ho2 || map.get(hitx,hity) == cloud)) {
   loc.add(dir);
  }
  else if ((hitY == 1) && (map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == white 
  || map.get(hitx,hity) == pumpk || map.get(hitx,hity) == st || map.get(hitx,hity) == dt 
  || map.get(hitx,hity) == cbs || map.get(hitx,hity) == lc3 || map.get(hitx,hity) == br || map.get(hitx,hity) == dia || map.get(hitx,hity) == coalc|| map.get(hitx,hity) == cloud)) {
   loc.add(dir);
  }
  else if ((hitY == 2) && (map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == white 
  || map.get(hitx,hity) == pumpk || map.get(hitx,hity) == st || map.get(hitx,hity) == st2 || map.get(hitx,hity) == dt 
  || map.get(hitx,hity) == dt2 || map.get(hitx,hity) == cbs || map.get(hitx,hity) == lc3 || map.get(hitx,hity) == br || map.get(hitx,hity) == dia || map.get(hitx,hity) == coalc || map.get(hitx,hity) == cloud)) {
    loc.add(dir);
  }
  else if ((hitY == 3) && (map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == white 
  || map.get(hitx,hity) == pumpk || map.get(hitx,hity) == st || map.get(hitx,hity) == st2 || map.get(hitx,hity) == dt3|| map.get(hitx,hity) == dt 
  || map.get(hitx,hity) == dt2 || map.get(hitx,hity) == dt3|| map.get(hitx,hity) == cbs  || map.get(hitx,hity) == br || map.get(hitx,hity) == dia || map.get(hitx,hity) == coalc
  || map.get(hitx,hity) == gls || map.get(hitx,hity) == wl || map.get(hitx,hity) == lc || map.get(hitx,hity) == lc2 || map.get(hitx,hity) == cloud)) {
   loc.add(dir);
  }
  
  else if ((hitY == 4) && (map.get(hitx,hity) == ho || map.get(hitx,hity) == ho2 || map.get(hitx,hity) == white 
  || map.get(hitx,hity) == pumpk || map.get(hitx,hity) == st || map.get(hitx,hity) == st2 || map.get(hitx,hity) == dt3|| map.get(hitx,hity) == dt 
  || map.get(hitx,hity) == dt2 || map.get(hitx,hity) == dt3|| map.get(hitx,hity) == dt4|| map.get(hitx,hity) == cbs  || map.get(hitx,hity) == br || 
  map.get(hitx,hity) == dia || map.get(hitx,hity) == coalc || map.get(hitx,hity) == gls || map.get(hitx,hity) == wl || map.get(hitx,hity) == lc3 || map.get(hitx,hity) == lc2 ||
   map.get(hitx,hity) == spp || map.get(hitx,hity) == cloud)) {
   loc.add(dir);  
  }
  
  else if ((hitY == 5) && (map.get(hitx,hity) != tb || map.get(hitx,hity) == cloud)) {
    loc.add(dir);
  }
  
  else if ((hitY == 6) && (map.get(hitx,hity) != tb || map.get(hitx,hity) == cloud)) {
    loc.add(dir);
  }
  
  else if (hitY>= 7) {
    loc.add(dir);
  } 
        else {
            speed = 0;
            if ((abs(loc.x-eyeX) < gridSize || abs(loc.y-eyeZ) < gridSize ) && (abs(hitY-currentMiniY) < gridSize)) {
          lives = 0;
          Trident.lives = 0;
        }
        }
        
    }
    
   void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    
    // Calculate rotation angles to face movement direction
    float horizontalAngle = atan2(dir.x, dir.z);
    float verticalAngle = -asin(dir.y / dir.mag());
    
    // Apply rotations 
    world.rotateY(horizontalAngle);
    world.rotateX(verticalAngle);
    
    // Flip trident to point forward (original model faces backward)
    world.rotateY(-PI); 
    
    // Draw trident at origin after transformations
    trident(0, 0, 0, size, size, size*20);
    
    world.popMatrix();
}
}
