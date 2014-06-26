class Cabinet extends Suckable{
  PImage sprite2;
   Cabinet(){
    x = 650;
    y = 400;
    threshold = 300;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("cabinet.png");
    sprite2 = loadImage("cabinet2.png");
    spin = .3;
   }
   void draw(){
     //closed drawers
     if (!sucking)
       image(sprite, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
     //drawers pulled open
     else
       image(sprite2, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
     r -= spin*dt;
     x = r*cos(theta);
     y = r*sin(theta);
   }


}
