class Particle {
  final public float x;  //in m
  final public float y;  //in m
  public float z;        //in m
  private ArrayList<Wave> waves;
  private ArrayList<Float> distances;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.z = 0f;
  }

  public void addWaveList(ArrayList<Wave> waves) {
    this.waves = waves;
    distances = new ArrayList<Float>();
    for (Wave wave : this.waves) {
      distances.add(wave.calculateDistance(this.x, this.y));
    }
  }

  public void update() {
    z = 0f;
    if (waves.size() != distances.size()) addWaveList(waves);
    if (waves.isEmpty()) return;
    for (int i = 0; i < waves.size(); i++) {
      Wave wave = waves.get(i);
      z = z + wave.calculateAmplitude(distances.get(i));
    }
  }
}
