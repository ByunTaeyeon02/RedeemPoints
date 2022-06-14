import 'Model.dart';

class Controller {
  late Model model;
  //ArrayList<JButton> buttons;

  Controller(Model model) {
    this.model = model;
    //buttons = new ArrayList<>();
    //createSpinButt();
    //createReturnButt();
  }
  /*
  void createSpinButt() {
    JButton spin = new JButton("spin");
    spin.setName("spin");
    spin.addActionListener(new ActionListener() {
    void actionPerformed(ActionEvent e) {
    Category choosenOne = model.getWheel().getPrize();
    model.setChoosen(choosenOne);
    model.updateViewer();
    }
    });
    buttons.add(spin);
  }

  void createReturnButt() {
    JButton returnMenu = new JButton("return");
    returnMenu.setName("return");
    returnMenu.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent e) {
    model.setChoosen(null);
    model.updateViewer();
    }
    });
    buttons.add(returnMenu);
  }

  ArrayList<JButton> getButtons() {
    return buttons;
  } */
}