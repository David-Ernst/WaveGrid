class Camera {
  private PVector camPos;
  private PVector camCenter;
  private PVector directionDegree;
  private PVector direction;
  private float speed;



  Robot robot;

  private PVector mouseVec;
  private float camSensitivity;

  Camera() {
    camPos = new PVector(width/2.0, height/2.0, -200);
    camCenter = new PVector(width/2.0, height/2.0+1, 0);
    direction = new PVector(0, 1.0, 0);
    directionDegree = new PVector(0, 0.0);
    speed = 5;

    camSensitivity = 0.06;
    mouseVec = new PVector(0, 0);

    try {
      robot = new Robot();
    }
    catch (AWTException e) {
      e.printStackTrace();
    }
  }

  public void update() {
    handleInputs();
    camera(camPos.x, camPos.y, camPos.z, camCenter.x + camPos.x, camCenter.y + camPos.y, camCenter.z + camPos.z, 0.0, 0.0, 1.0);
  }

  private void handleInputs() {
    // Vector from the middle to the mouse position
    mouseVec.x = mouseX - (width/2);
    mouseVec.y = mouseY - (height/2);

    // The camera angle is multiplied by its sensitivity and added to the vector
    directionDegree.x = directionDegree.x - mouseVec.x * camSensitivity;
    directionDegree.y = directionDegree.y + mouseVec.y * camSensitivity;

    // The mouse position is set to the middle of the screen
    robot.mouseMove(width/2, height/2);

    if (!keyPressed) {
      up = false;
      down = false;
      forward = false;
      backward = false;
      right = false;
      left = false;
    }

    if (up) {
      camPos.z = camPos.z - speed;
    }
    if (down) {
      camPos.z = camPos.z + speed;
    }
    if (forward) {
      camPos = camPos.add(direction.mult(speed));
      direction.normalize();
    }
    if (backward) {
      camPos = camPos.add(direction.mult(-speed));
      direction.normalize();
    }
    if (!backward) {
      if (right) {
        camPos = camPos.add(perpendicularVector(direction.mult(speed)));
        direction.normalize();
      }
      if (left) {
        camPos = camPos.add(perpendicularVector(direction.mult(-speed)));
        direction.normalize();
      }
    }else{
      if (right) {
        camPos = camPos.add(perpendicularVector(direction.mult(-speed)));
        direction.normalize();
      }
      if (left) {
        camPos = camPos.add(perpendicularVector(direction.mult(speed)));
        direction.normalize();
      }
    }

    if (directionDegree.y > 89) directionDegree.y = 89;
    if (directionDegree.y < -89) directionDegree.y = -89;
    camCenter.x = cos(directionDegree.x * PI/180) * cos(directionDegree.y * PI/180);
    camCenter.y = sin(directionDegree.x * PI/180) * cos(directionDegree.y * PI/180);
    camCenter.z = sin(directionDegree.y * PI/180);

    direction = new PVector(camCenter.x, camCenter.y);
    direction.normalize();
  }

  private PVector perpendicularVector(PVector v) {
    return new PVector(v.y, -v.x);
  }
}
