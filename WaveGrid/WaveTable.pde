class WaveTable extends JFrame {
  private JTable table;
  private DefaultTableModel tableModel;
  private ArrayList<String[]> savedData;

  public WaveTable(ArrayList<String[]> initialData) {
    this.savedData = initialData; // Initialize savedData with the provided initial data

    setTitle("Main Frame");
    setSize(400, 300);
    setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

    // Initialize the table model with column names
    // Create a DefaultTableModel with three columns
    Vector<String> columnNames = new Vector<String>();
    columnNames.add("x1-Coordinate");
    columnNames.add("x2-Coordinate");
    columnNames.add("ŝ");
    columnNames.add("λ");
    columnNames.add("c");
    columnNames.add("start time");
    columnNames.add("ϕ");
    tableModel = new DefaultTableModel(columnNames, 0);

    // Create a 2D Vector to hold the table data
    Vector<Vector<String>> tableData = new Vector<>();
    for (String[] rowData : initialData) {
      tableData.add(new Vector<>(java.util.Arrays.asList(rowData)));
    }

    tableModel = new DefaultTableModel(tableData, columnNames);
    table = new JTable(tableModel);
    table.setDefaultEditor(Object.class, new DefaultCellEditor(new JTextField()));
    JScrollPane scrollPane = new JScrollPane(table);

    // A table model listener to save data when it changes
    tableModel.addTableModelListener(new TableModelListener() {
      @Override
        public void tableChanged(TableModelEvent e) {
        int row = e.getFirstRow();
        int column = e.getColumn();
        if (row >= 0 && column >= 0) {
          String value = (String) tableModel.getValueAt(row, column);
          savedData.get(row)[column] = value;
        }
      }
    }
    );

    JPanel buttonPanel = new JPanel();
    JButton addButton = new JButton("Add Row");
    addButton.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        // Add a new empty row to the table and savedData
        Vector<String> newRow = new Vector<>();
        String[] newSavedRow = new String[columnNames.size()];
        for (int i = 0; i < columnNames.size(); i++) {
          newRow.add("");
          newSavedRow[i] = "";
        }
        tableModel.addRow(newRow);
        savedData.add(newSavedRow);
      }
    }
    );

    JButton removeButton = new JButton("Remove Row");
    removeButton.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        // Remove the selected row from the table and savedData
        int selectedRow = table.getSelectedRow();
        if (selectedRow >= 0) {
          tableModel.removeRow(selectedRow);
          savedData.remove(selectedRow);
        }
      }
    }
    );

    JButton saveButton = new JButton("Save Data");
    saveButton.addActionListener(new ActionListener() {
      @Override
        public void actionPerformed(ActionEvent e) {
        saveData(savedData);
      }
    }
    );

    buttonPanel.add(addButton);
    buttonPanel.add(removeButton);
    buttonPanel.add(saveButton);

    setLayout(new BorderLayout());
    add(scrollPane, BorderLayout.CENTER);
    add(buttonPanel, BorderLayout.SOUTH);
  }

  private void saveData(ArrayList<String[]> dataToSave) {
    waveData = dataToSave;
  }
}
