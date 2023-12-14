class ControlFrame extends JFrame {
  public boolean disposed = false;

  public ControlFrame() {
    setTitle("Control Frame");
    setSize(200, 300);
    setLocation(width/2-100, height/2-150);
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
    JButton moveToBack = new JButton("Go to Simulation");
    moveToBack.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        disposed = true;
        dispose();
        exited = false;
      }
    }
    );

    setLayout(new GridLayout(4, 1));
    add(moveToBack);
    add(openWaves);
    add(editSandbox);
    add(exitAll);
  }
}
