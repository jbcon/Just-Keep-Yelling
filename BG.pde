class BG extends Suckable{
  BG(){
    x = -315;
    y = -230;
    threshold = 900;
    //solely used to determine size
    radius = dist(x,y,512,384);
    //pretty much useless in this class
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("background.png");
    spin = .8;
  }
  void draw(){
    if (sucking && !sucked){
      x = sprite.width*(r/radius);
      y = sprite.height*(r/radius);
      r -= spin*dt;
      image(sprite, -x/2, -y/2, x, y);
    }
  }
}
