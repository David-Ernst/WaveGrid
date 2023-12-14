class Wave {
  private float x;  // In m
  private float y;  // In m

  private float s;  // Maximum amplitude of the wave in m
  private float λ;  // Wavelength in m
  private float c;  // Wave velocity in m/s
  private float ω;  // Angular frequenzy
  private float k;  // Wave number (measure of the spatial frequency of the wave)
  private float ϕ;  // The phase shift of the wave
  private float startTime; //At which point in time the wave starts

  private Timer timer;

  Wave(float x, float y) {
    this.x = x;
    this.y = y;
    s = 0f;
    λ = 0f;
    c = 0f;
    ω = 0f;
    k = 0f;
    ϕ = 0f;
    startTime = 0f;
  }
  
  public void setStartTime(float startTime){
    this.startTime = startTime;
  }
  
  public void addTimer(Timer timer) {
    this.timer = timer;
  }

  public void setAmplitude(float s) {
    this.s = s;
  }

  public void setWavelength(float λ) {
    this.λ = λ;
    if (λ == 0) return;
    this.k = (2 * PI) / λ;
    if (this.c == 0) return;
    ω = (c / λ) * 2*PI;
  }

  public void setWavespeed(float c) {
    this.c = c;
    if (this.c == 0) return;
    if (λ == 0) return;
    ω = (c / λ) * 2*PI;
  }
  
  public void setPhaseConstant(float ϕ){
    this.ϕ = ϕ;
  }

  public float calculateAmplitude(float x) {
    float t = timer.getTime();
    if (x > (t - startTime) * c) return 0f;
    return -s * sin(k * x - ω * (t - startTime) + ϕ);
  }

  public float calculateDistance(float x, float y) {
    return dist(x, y, this.x, this.y);
  }
}
