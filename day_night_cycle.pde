
color calculateBackgroundColor() {
  int totalCycle = 7200;
  int currentFrame = frameCount % totalCycle;
  //println(frameCount);
  
   if (okey) {
     return nighttime;
  }
  
  if (zkey) {
     return daylight;
  }
  
  if (currentFrame < 3600) {
    return daylight;
  } else if (currentFrame < 3900) {
    float progress = (currentFrame - 3600) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(daylight, nighttime, t);
  } else if (currentFrame < 6900) {
    return nighttime;
  } else {
    float progress = (currentFrame - 6900) / 300.0;
    float t = (1 - cos(progress * PI)) / 2;
    return lerpColor(nighttime, daylight, t);
  }
}
