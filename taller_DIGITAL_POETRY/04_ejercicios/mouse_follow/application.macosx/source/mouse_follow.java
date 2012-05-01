import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class mouse_follow extends PApplet {

//inicio del programa, configuracion visual
public void setup(){
  size(480, 629);
  smooth();
}

// segmento que se ejecuta continuo
public void draw(){
  // segmento de selecci\u00f3n de estado
  if (mousePressed){
    fill(0);
  }else{
    fill(mouseX, 0, mouseY);
  }
  ellipse(mouseX, mouseY, 80, 80);
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "mouse_follow" });
  }
}
