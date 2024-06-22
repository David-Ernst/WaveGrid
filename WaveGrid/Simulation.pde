class Simulation {

  Camera cam;
  Timer timer;
  ParticleField particleField = new ParticleField(10, 10, 10);

  ArrayList<Wave> waves;

  Simulation() {

    cam = new Camera();

    timer = new Timer();
    waves = new ArrayList<Wave>();

    particleField.setWaves(waves);
  }

  void update() {
    beginCamera();
    noCursor();
    background(0);
    rotateX(PI/3);
    cam.update();
    timer.execute();
    particleField.update();
    particleField.renderTriangle();
    endCamera();
  }

  void setSandbox(String[] data) {
    //prohibiting errors through wrong inputs
    if (data.length != 4) return;
    float x = strToFloat(data[0]);
    if (x <= 0) x = 10;
    float y = strToFloat(data[1]);
    if (y <= 0) y = 10;
    float density = strToFloat(data[2]);
    if (density <= 0) density = 10;
    float resolution = strToFloat(data[3]);
    if (resolution <= 0) resolution = 100;

    particleField = new ParticleField(x, y, density);
    particleField.setResolution(resolution);

    particleField.setWaves(waves);
  }

  void setWaves(ArrayList<String[]> strList) {
    waves = new ArrayList<Wave>();
    for (String[] s : strList) {
      Wave wave = new Wave(strToFloat(s[0]), strToFloat(s[1]));
      wave.setAmplitude(strToFloat(s[2]));
      wave.setWavelength(strToFloat(s[3]));
      wave.setWavespeed(strToFloat(s[4]));
      wave.setStartTime(strToFloat(s[5]));
      wave.setPhaseConstant(strToFloat(s[6]));

      wave.addTimer(timer);

      waves.add(wave);
    }
    particleField.setWaves(waves);
  }

  float strToFloat(String s) {
    float floatVal;

    try {
      floatVal = Float.parseFloat(s);
      return floatVal;
    }
    catch (Exception e) {
      return 0f;
    }
  }
}
