class ParticleField {
  private ArrayList<Wave> waves;
  private Particle[][] field;
  private float density = 10f;  //Particles per Meter
  private float resolution = 100f;  //Pixel per Meter

  ParticleField(float x, float y, float density) {
    waves = new ArrayList<Wave>();
    this.density = density;
    createField(x, y, this.density);
  }

  public ArrayList<Wave> getWaves() {
    return waves;
  }

  public void setWaves(ArrayList<Wave> waves) {
    this.waves = waves;
    for (int i = 0; i < field.length; i++) {
      for (int j = 0; j < field[0].length; j++) {
        field[i][j].addWaveList(this.waves);
      }
    }
  }

  public void setResolution(float resolution) {
    this.resolution = resolution;
  }

  // IMPORTANT: Execute this first!
  public void createField(float x, float y, float density) {
    if (density == 0) return;
    int xLength = int(x*density);
    int yLength = int(y*density);
    field = new Particle[xLength][yLength];
    for (int i = 0; i < xLength; i++) {
      for (int j = 0; j < yLength; j++) {
        field[i][j] = new Particle(float(i)/density, float(j)/density);
      }
    }
  }

  public void update() {
    for (int i = 0; i < field.length; i++) {
      for (int j = 0; j < field[0].length; j++) {
        field[i][j].update();
      }
    }
  }

  public void render() {
    for (int i = 0; i < field.length; i++) {
      for (int j = 0; j < field[0].length; j++) {
        stroke(255);
        point(field[i][j].x * resolution, field[i][j].y * resolution, field[i][j].z * resolution * -1);
      }
    }
  }

  public void renderTriangle() {

    for (int i = 0; i < field.length-1; i++) {
      for (int j = 0; j < field[0].length-1; j++) {

        noFill();
        stroke(64, 64, 255);
        strokeWeight(1);
        beginShape(TRIANGLE_STRIP);
        vertex(field[i][j].x * resolution, field[i][j].y * resolution, field[i][j].z * resolution * -1);
        vertex(field[i+1][j].x * resolution, field[i+1][j].y * resolution, field[i+1][j].z * resolution * -1);
        vertex(field[i+1][j+1].x * resolution, field[i+1][j+1].y * resolution, field[i+1][j+1].z * resolution * -1);
        endShape();
      }
    }
  }
}
