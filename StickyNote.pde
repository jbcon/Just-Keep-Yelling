class StickyNote extends Suckable{
  StickyNote(){
    x = 650;
    y = 600;
    threshold = 150;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("sticky.png");
    spin = .5;
  }
}
