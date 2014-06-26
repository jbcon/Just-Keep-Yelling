//handles sound input
class SoundHandler {
  Minim minim;
  AudioPlayer holeSound;
  AudioInput in;
  float dv;
  float volume;
  float threshold;
  boolean looping;

  SoundHandler(Minim m) {
    minim = m;
    in = minim.getLineIn();
    holeSound = minim.loadFile("OMINOUS2.mp3");
    dv = 0;
    volume = 0;
    threshold = 0;
    looping = false;
  }  

  float getVolume() {
    return volume;
  }

  void update() {
    //grab sound level
    dv = in.mix.level();
    //tolerance level to filter out bg noise
    if (dv > threshold){
      if (!looping){
        holeSound.loop();
        looping = true;
      }
      //"volume" increases logarithmically
      volume += log(dv*dt);
    }
    //if no input
    else {
      //volume decreases proportionally to size
      volume /= 1.05;
      if (volume-2 < 0)
        volume = 0;
    }
    if (volume == 0){
      holeSound.rewind();
      looping = false;
    }
  }
}
