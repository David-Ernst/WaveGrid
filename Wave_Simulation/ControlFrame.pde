class ControlFrame extends JFrame {

  public boolean test;

  public ControlFrame() {
    setTitle("Control Frame");
    setSize(200, 300);
    setLocation(960-100, 540-150);
    setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);

    JButton openWaves = new JButton("Open Wave List");
    openWaves.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        // Create and display the main frame with data from the ArrayList
        WaveTable waveTable = new WaveTable(waveData);
        waveTable.setVisible(true);
      }
    }
    );
    JButton editSandbox = new JButton("Edit Sandbox");
    editSandbox.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        // Create and display the main frame with data from the ArrayList
        SandboxEditor sandboxEditor = new SandboxEditor(simulationData);
        sandboxEditor.setVisible(true);
      }
    }
    );
    JButton exitAll = new JButton("Exit");
    exitAll.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        // Create and display the main frame with data from the ArrayList
        exit();
      }
    }
    );

    setLayout(new GridLayout(3, 1));
    add(openWaves);
    add(editSandbox);
    add(exitAll);
  }


  @Override
    public void toFront() {
    super.setVisible(true);
    int state = super.getExtendedState();
    state &= ~JFrame.ICONIFIED;
    super.setExtendedState(state);
    super.setAlwaysOnTop(true);
    super.toFront();
    super.requestFocus();
    super.setAlwaysOnTop(false);
  }
}
