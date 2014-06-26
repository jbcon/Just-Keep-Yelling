//the black hole
class BlackHole {
  PImage hole;
  float theta;
  //polymorphic ArrayLists with all suckable objects
  //frontItems has stuff in front of the black hole
  ArrayList<Suckable> frontItems;
  //backItems has stuff behind it
  ArrayList<Suckable> backItems;
  BlackHole() {
    hole = loadImage("blackhole.png");
    frontItems = new ArrayList<Suckable>();
    frontItems.add(new Cabinet());
    frontItems.add(new Table());
    frontItems.add(new StickyNote());
    frontItems.add(new Lamp());
    backItems = new ArrayList<Suckable>();
    backItems.add(new BG());
    //invisible leaves to be torn off the tree
    for (int i = 0; i < 15; i++){
      backItems.add(new Leaf(i));
    }
    backItems.add(new Tree());
    backItems.add(new Room());
  }

  void draw(float vol) {
    //draws objects not being sucked
    for (Suckable s : backItems){
      if (!s.sucked && !s.sucking){
        image(s.sprite, s.x, s.y);
      }
    }
    pushMatrix();
    translate(512, 384);
    rotate(radians(theta/10));
    for (Suckable s : backItems){
      //if the volume breaks the object's threshold
      if (vol > s.threshold)
        s.sucking = true;
      //if being sucked and the radius goes beyond zero
      if (s.sucking && s.r <= 0){
        //stop sucking the object
        s.sucked = true;
        s.sucking = false;
      }
      //if it is being sucked
      if(s.sucking && !s.sucked){
        //draw it 
        s.draw();
      }
      
    }
    image(hole, -vol/3, -vol/3, vol/1.5, vol/1.5);
    //this loop takes care of objects to be sucked into black hole
    //they will also be transformed by same matrix as black hole
    for (Suckable s : frontItems){
      //if the volume breaks the object's threshold
      if (vol > s.threshold)
        s.sucking = true;
      //if being sucked and the radius goes beyond zero
      if (s.sucking && s.r <= 0){
        //stop sucking the object
        s.sucked = true;
        s.sucking = false;
      }
      //if it is being sucked
      if(s.sucking && !s.sucked){
        //draw it 
        s.draw();
      }
      
    }
    
    popMatrix();
    for (Suckable s : frontItems){
      if (!s.sucked && !s.sucking){
        image(s.sprite, s.x, s.y);
      }
    }
    theta += 10*dt;
  }
}
