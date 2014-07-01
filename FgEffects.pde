class FgEffects {
  color overlay;
  int h;
  int w;
  float t;
  float redTint;
  float blackTint;
  float df;


  FgEffects(int w, int h) {
    this.h = h;
    this.w = w;
    redTint = 0;
    blackTint = 0;
    df = 0;
    t = 0;
    overlay = color(255, 255, 255, 0);
  }

  void update(float freq, float vol) {
    println(vol);
    df /= 1.05;
    if (df < 1)
      df = 0;    
    df += .5*sqrt(1+freq);
    if (df > 200)
      df  = 200;
    overlay = color(128, 0, 0, df);
    println("df: "+df + "\nFreq: " + freq);

  }

  void draw() {
    noStroke();
    fill(overlay);
    rect(0, 0, w, h);
  }
}

