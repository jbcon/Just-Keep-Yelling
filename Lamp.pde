class Lamp extends Suckable{
  Lamp(){
    x = 250;
    y = 300;
    threshold = 250;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("lamp.png");
    spin = .3;
  }

}
