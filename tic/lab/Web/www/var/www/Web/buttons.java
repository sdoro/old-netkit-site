// $Id: buttons.java,v 1.1 2004/02/09 21:54:27 doros Exp $

import java.applet.*;
import java.net.*;
import java.awt.*;

public class buttons extends Applet {

  public void init() {
    setBackground(Color.white);
    add(new Button("Ying"));
    add(new Button("Yang"));
  }

  public boolean action(Event e, Object arg) {
    if (((Button) e.target).getLabel() == "Ying") {
      try {
	getAppletContext().showDocument(
	   new URL("http://www.netbook.cs.purdue.edu/cs363/lecture_notes/chap29/ying.html"));
      }
      catch (Exception ex) {
	// note: code to handle the exception goes here //
		   }
    }
    else if (((Button) e.target).getLabel() == "Yang") {
      try {
	getAppletContext().showDocument(
	   new URL("http://www.netbook.cs.purdue.edu/cs363/lecture_notes/chap29/yang.html"));
      }
      catch (Exception ex) {
	// note: code to handle the exception goes here //
		   }
    }
    return true;
  }
}
