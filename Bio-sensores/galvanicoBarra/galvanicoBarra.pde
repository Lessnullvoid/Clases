// Graphing potentiometer sketch - Processing code
 
 
 // This program takes ASCII-encoded strings
 // from the serial port at 9600 baud and graphs them. It expects values in the
 // range 0 to 1023, followed by a newline, or newline and carriage return
 
 // Created 20 Apr 2005
 // Updated 18 Jan 2008
 // by Tom Igoe
 // This example code is in the public domain.
 
 import processing.serial.*;
 
 Serial myPort;        // The serial port
 int xPos = 1;         // horizontal position of the graph
 
 void setup () {
 // set the window size:
 size(400, 300);        
 
 // List all the available serial ports
 println(Serial.list());
 
 //
 // I am assuming that the Arduino is connected to USB
 // on /dev/tty.usbmodem621, so I open Serial.list()[4]
 //
 // To find out which serial port talks to your Arduino,
 // open the Arduino IDE and look up �Tools > Serial Port�.
 // Compare that to the entry in the list in your Processing
 // console output after you run this sketch, and select
 // this one by its number...
 //
 // The list will look something like this:
 // [0] "/dev/tty.Bluetooth-PDA-Sync"
 // [1] "/dev/cu.Bluetooth-PDA-Sync"
 // [2] "/dev/tty.Bluetooth-Modem"
 // [3] "/dev/cu.Bluetooth-Modem"
 // [4] "/dev/tty.usbmodem621"
 // [5] "/dev/cu.usbmodem621"
 
 myPort = new Serial(this, Serial.list()[0], 9600);
 
 // don't generate a serialEvent() unless you get a newline character:
 myPort.bufferUntil('\n');
 // set inital background:
 background(0);
 }
 void draw () {
 // everything happens in the serialEvent()
 }
 
 void serialEvent (Serial myPort) {
 // get the ASCII string:
 String inString = myPort.readStringUntil('\n');
 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 // convert to an int and map to the screen height:
 float inByte = float(inString);
 inByte = map(inByte, 0, 1023, 0, height);
 
 // draw the line:
 stroke(127,34,255);
 line(xPos, height, xPos, height - inByte);
 
 // at the edge of the screen, go back to the beginning:
 if (xPos >= width) {
 xPos = 0;
 background(0);
 }
 else {
 // increment the horizontal position:
 xPos++;
 }
 }
 }
