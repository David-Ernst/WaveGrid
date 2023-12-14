import controlP5.*;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;
import java.util.ArrayList;
import java.lang.Math;
import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;

boolean forward = false;
boolean backward = false;
boolean right = false;
boolean left = false;
boolean up = false;
boolean down = false;

boolean exited = false;
boolean paused = false;

ArrayList<String[]> waveData = new ArrayList<String[]>();
String[] simulationData = new String[]{"10","10","10","100"};
boolean editSimulation = false;

GUI gui = new GUI();
Simulation simulation = new Simulation();


void setup() {
  fullScreen(P3D);
  clear();

  GUI gui = new GUI();
  gui.show();
}

void draw() {
  if (!exited) {
    simulation.update();
  } else {
    cursor();
    simulation.setWaves(waveData);
    if (editSimulation) {
      simulation.setSandbox(simulationData);
      editSimulation = false;
    }
  }
}

void keyReleased() {
  if (keyCode == SHIFT) {
    down = false;
  }
  if (key == ESC) {
    exited = !exited;
    key = 0;
  }
  if (key == ' ') {
    up = false;
  }
  
  
  
  if (key == 'w' || key =='W') {
    forward = false;
  }
  if (key == 's' || key == 'S') {
    backward = false;
  }

  if (key == 'a' || key == 'A') {
    left = false;
  }
  if (key == 'd' || key == 'D') {
    right = false;
  }
}

void keyPressed() {
  if (keyPressed) {
    if (key == CODED) {
      if (keyCode == SHIFT) {
        down = true;
      }
    }
    if (key == ' ') {
      up = true;
    }
    if(key == 'p' || key == 'P'){
      paused = !paused;
      key = 0;
    }
    if (key == 'w' || key =='W') {
      forward = true;
    }
    if (key == 's' || key == 'S') {
      backward = true;
    }

    if (key == 'a' || key == 'A') {
      left = true;
    }
    if (key == 'd' || key == 'D') {
      right = true;
    }
    if (key == ESC) key = 0;
    if (key == 'r') {
      simulation.timer.reset();
    }
  }
}
