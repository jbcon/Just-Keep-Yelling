//handles sound input
class SoundHandler {
  Minim minim;
  AudioPlayer holeSound;
  AudioInput in;
  float volume;
  float volMod;
  float freq;
  float threshold;
  boolean looping;
  FFT fft;

  SoundHandler(Minim m) {
    minim = m;
    in = minim.getLineIn();
    fft = new FFT(in.bufferSize(), in.sampleRate());
    holeSound = minim.loadFile("OMINOUS2.mp3");
    volume = 0;
    volMod = 0;
    threshold = 0;
    freq = 0;
    looping = false;
  }  
  
  float getVolMod() {
    return volMod;
  }
  
  float getVolume() {
    return volume;
  }
  
  float getFreq() {
    return freq;
  }

  void update() {
    //-----Perform pitch stuff-------*/
    fft.forward(in.mix);
    int avg = 0;
    for (int i = 0; i < fft.specSize(); i++) {
      /*if (fft.getBand(i) > fft.getBand(highest)){
        highest = i;
      }*/
      avg += fft.getBand(i);
    }
    avg /= fft.specSize();
    freq = avg*.5*in.sampleRate()/fft.specSize();
    
    
    
    /*------Perform vol stuff-------*/
    //grab sound level
    volume = in.mix.level();
    //tolerance level to filter out bg noise
    if (volume > threshold){
      if (!looping){
        holeSound.loop();
        looping = true;
      }
      //"vol" increases 
      volMod += sqrt(volume*dt);
    }
    //if no input
    else {
      //volMod decreases proportionally to size
      volMod /= 1.05;
      if (volMod-2 < 0)
        volMod = 0;
    }
    if (volMod == 0){
      holeSound.rewind();
      looping = false;
    }
  }
}
