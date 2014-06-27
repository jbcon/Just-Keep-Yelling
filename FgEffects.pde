class FgEffects {
  color overlay;
  int h;
  int w;
  float redTint;
  float blackTint;

  
  FgEffects(int w, int h) {
    this.h = h;
    this.w = w;
    redTint = 0;
    blackTint = 0;
    overlay = color(255,255,255,0);
  }
  
  void update(float freq, float vol) {
  
    println(vol);
    if (vol < .04) {
      redTint /= 1.05;
      blackTint /= 1.05;
      if (blackTint < 1)
        blackTint = 0;
      if (redTint < 1)
        redTint = 0;
      println("Red: t = " + redTint);
      println("Black: t = " + blackTint);
        
    }
    if (freq > 300 ) {
      blackTint = 0;
      redTint += .001*sqrt(freq)*dt;
      overlay = color(128,0,0,redTint);
      println("Red: t = " + redTint);
    }
    /*else if (freq <= 300 && vol >= .04) {
      redTint = 0;
      blackTint += .001*sqrt(freq)*dt;
      overlay = color(0,0,0,blackTint);
      println("Black: t = " + blackTint);
    }*/
  }
  
  void draw() {
    noStroke();
    fill(overlay);
    rect(0,0,w,h);
  }  
}
