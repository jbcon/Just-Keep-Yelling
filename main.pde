import ddf.minim.*;

/* SoundReact
  John Conover
  Controls:
    Yell into the mic as long as you can.
*/

SoundHandler sound;
BlackHole blackHole;

//time
float currentTime;
float lastTime;
float dt;
float avg;

Minim minim;

//configures the threshold
void config(){
  float tmp;
  currentTime = millis();
  println(currentTime);
  tmp = sound.in.mix.level();
  avg = (avg+tmp)/2 + .1;
  lastTime = currentTime;
  //draw screen
  background(0,0,0);
  String percentChange = str(int(currentTime/5000*100)) + '%';
  text("Configuring sound from your environment...", 50,50);
  text(percentChange,50,100);
  lastTime += currentTime-lastTime;
  if (sound.threshold == 0)
    sound.threshold = avg+.1;
  println(avg);
}


void setup() {
  size(1024, 768);

  minim=new Minim (this);
  sound = new SoundHandler(minim);
  
  blackHole = new BlackHole();
  currentTime = 0;
  lastTime = 0;
  avg = 0;
}

float update() {
  /*====set the time====*/
  currentTime = millis();
  dt = currentTime-lastTime;
  /*====================*/

  
  sound.update();
  //grabs volume from soundhandler
  float vol = sound.getVolume();
  //if there is sound detected above threshold
  if (vol > 0) {
    pushMatrix();
    // moves the screen's coords to random position
    // causes shaking
    translate(random(-vol/20, vol/20), random(-vol/20, vol/20));
  }
  return vol;
}

void draw() {
  //if just starting, run config
  background(0,0,0);
  if (lastTime < 5000){
    config();
  }
  else{
    float volume = update();
    //black hole stuff
    blackHole.draw(volume);
    if (volume > 0)
      popMatrix();
  }
  //reset lastTime
  lastTime = currentTime;
}

