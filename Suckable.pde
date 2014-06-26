//stuff that can be sucked by black hole
//used in polymorphic ArrayList for BlackHole
class Suckable{
  //is it being sucked by black hole?
  boolean sucking;
  //has it been completely sucked into the hole?
  boolean sucked;
  //xpos, ypos
  float x;
  float y;
  //the volume value that throws it into hole
  float threshold;
  //radius, angle at each frame
  float r;
  float theta;
  //original radius for size comparison
  float radius;
  PImage sprite;
  //modifies speed at which it enters black hole
  float spin;
  Suckable(){
    sucking = false;
    sucked = false;
  }
  
  void draw(){
    image(sprite, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
    r -= spin*dt;
    x = r*cos(theta);
    y = r*sin(theta);
  }
}
