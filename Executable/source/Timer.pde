class Timer {
  private long lastTime;  // In Milliseconds
  private float currentTime;  // In Seconds
  private float factor = 1f;

  Timer() {
    reset();
  }

  public void reset() {
    lastTime = System.currentTimeMillis();
    this.currentTime = 0f;
  }

  public void setFactor(float factor) {
    this.factor = factor;
  }
  
  public void pause(){
    lastTime = System.currentTimeMillis();
  }
  
  public void execute() {
    if(paused) pause();
    long passedTimeLong = System.currentTimeMillis() - this.lastTime;
    if(passedTimeLong > 500){
      lastTime = System.currentTimeMillis();
      return;
    }
    float passedTimeFloat = (float)(passedTimeLong) / 1000f;                  // Convert from Milliseconds to Seconds
    this.currentTime = this.currentTime + (passedTimeFloat * this.factor);
    
    lastTime = System.currentTimeMillis();
  }

  public float getTime() {
    return this.currentTime;
  }
}
