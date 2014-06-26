class Tree extends Suckable{
  PImage sprite2;
   Tree(){
    x = 675;
    y = 100;
    threshold = 800;
    radius = dist(x,y,512,384);
    theta = atan(y/x);
    r = radius;
    sprite = loadImage("tree.png");
    sprite2 = loadImage("tree2.png");
    spin = .3;
   }
   void draw(){
     //tree with leaves
     if (!sucking)
       image(sprite, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
     //all leaves torn off
     else
       image(sprite2, x, y, sprite.width*(r/radius), sprite.height*(r/radius));
     r -= spin*dt;
     x = r*cos(theta);
     y = r*sin(theta);
   }


}
