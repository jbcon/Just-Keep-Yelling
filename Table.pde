class Table extends Suckable{
  Table(){
    x = 50;
    y = 600;
    threshold = 400;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("table.png");
    spin = .3;
  }
}
