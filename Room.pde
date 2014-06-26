class Room extends Suckable{
  Room(){
    x = -155;
    y = -110;
    threshold = 550;
    //solely used to determine size
    radius = dist(x,y,512,384);
    //pretty much useless here
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("office.png");
    spin = .7;
  }
  void draw(){
    if (sucking && !sucked){
      r -= spin*dt;
      image(sprite, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
    }
  }
}
