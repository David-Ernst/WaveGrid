class SandboxEditor extends JFrame {
  private JTextField textField1, textField2, textField3, textField4;
  private JButton saveButton;

  public SandboxEditor(String[] initialData) {
    setTitle("Edit Sandbox");
    setSize(400, 200);

    textField1 = new JTextField(20);
    textField2 = new JTextField(20);
    textField3 = new JTextField(20);
    textField4 = new JTextField(20);

    if (initialData.length > 3) {
      textField1.setText(initialData[0]);
      textField2.setText(initialData[1]);
      textField3.setText(initialData[2]);
      textField4.setText(initialData[3]);
    }

    saveButton = new JButton("Save");

    saveButton.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {

        simulationData[0] = textField1.getText();
        simulationData[1] = textField2.getText();
        simulationData[2] = textField3.getText();
        simulationData[3] = textField4.getText();


        editSimulation = true;
      }
    }
    );

    JPanel panel = new JPanel();
    panel.setLayout(new GridLayout(5, 2));
    panel.add(new JLabel("x1-length:"));
    panel.add(textField1);
    panel.add(new JLabel("x2-length:"));
    panel.add(textField2);
    panel.add(new JLabel("Density:"));
    panel.add(textField3);
    panel.add(new JLabel("Resolution:"));
    panel.add(textField4);
    panel.add(saveButton);

    add(panel);

    setVisible(true);
  }
}
