class Leaf extends Suckable{
  Leaf(int i){
    x = 690;
    y = 100;
    threshold = 600+10+(i*(i+1))/2;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("leaf.png");
    spin = .9;
  }
  void draw(){
    if (sucking){
      image(sprite, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
      r -= spin*dt;
      x = r*cos(theta);
      y = r*sin(theta);
    }
  }
}
