// $Id: clickcount.java,v 1.1 2004/02/09 21:53:38 doros Exp $

import java.applet.*;
import java.awt.*;

public class clickcount extends Applet {
  int count;
  TextField f;

  public void init() {
    setBackground(Color.white);
    count = 0;
    add(new Button("Click Here"));
    f = new TextField("The button has not been clicked at all.");
    f.setEditable(false);
    add(f);
  }

  public boolean action(Event e, Object arg) {
    if (((Button) e.target).getLabel() == "Click Here") {
      count += 1;
      f.setText("The button has been clicked " + count + " times.");
    }
    return true;
  }
}
