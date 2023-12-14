class GUI {
  public ControlFrame controlFrame;
  GUI() {
  }

  public void show() {
    SwingUtilities.invokeLater(() -> {
      this.controlFrame = new ControlFrame();
      this.controlFrame.setVisible(true);
    }
    );
  }

}
