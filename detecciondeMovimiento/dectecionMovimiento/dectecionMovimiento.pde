import processing.video.*;
import oscP5.*; // -->se importan las librerías oscP5 y netP5
import netP5.*;
 
Capture video;
OscP5 oscP5; //--> definición del objeto
NetAddress direccionRemota;

//variables
PImage prevFrame;
int puerto;
String ip;

float threshold = 150;
int Mx = 0;
int My = 0;
int ave = 0;
 
int ballX = width/8;
int ballY = height/8;
int rsp = 5;
 
void setup() {
  size(320, 240);
  String[] cameras = Capture.list();
  video = new Capture(this, width, height, 30);
  video.start();
  prevFrame = createImage(video.width, video.height, RGB);
      println("Available cameras:");
      for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
      }
   ip = "127.0.0.1"; //-->dirección ip a donde se envían los mensajes (en este caso localhost)
   puerto = 11112;
  
  oscP5 = new OscP5(this, puerto); //-->inicialización del objeto
  direccionRemota = new NetAddress(ip, puerto); //-->Entrada: mensajes de entrada por el puerto especificado
}
 
void draw() {
 
  if (video.available()) {
 
    prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); 
    prevFrame.updatePixels();
    video.read();
  }
 
  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();
 
  Mx = 0;
  My = 0;
  ave = 0;
 
 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
 
      int loc = x + y*video.width;            
      color current = video.pixels[loc];      
      color previous = prevFrame.pixels[loc]; 
 
 
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);
 
 
      if (diff > threshold) { 
        pixels[loc] = video.pixels[loc];
        Mx += x;
        My += y;
        ave++;
      } 
      else {
 
        pixels[loc] = video.pixels[loc];
      }
    }
  }
  fill(255);
  rect(0, 0, width, height);
  if (ave != 0) { 
    Mx = Mx/ave;
    My = My/ave;
  }
  if (Mx > ballX + rsp/2 && Mx > 50) {
    ballX+= rsp;
  }
  else if (Mx < ballX - rsp/2 && Mx > 50) {
    ballX-= rsp;
  }
  if (My > ballY + rsp/2 && My > 50) {
    ballY+= rsp;
  }
  else if (My < ballY - rsp/2 && My > 50) {
    ballY-= rsp;
  }
 
  updatePixels();
  noStroke();
  fill(0, 0, 255);
  ellipse(ballX, ballY, 20, 20);
  
   OscMessage mensaje1 = new OscMessage("/mouse/posicion"); //-->crea una etiqueta para el mensaje
  OscMessage mensaje2 = new OscMessage("/mouse/posNorm"); //-->crea una etiqueta para el mensaje
  mensaje1.add(ballX); //-->se le agrega un dato (posición del mouse)
  mensaje1.add(ballY); //-->se le agrega otro dato
  mensaje2.add(map (ballX, 0, width, 0, 1.0));
  mensaje2.add(map (ballY, 0, height, 0, 1.0));

  oscP5.send(mensaje1, direccionRemota); //-->Se envia el mensaje
  oscP5.send(mensaje2, direccionRemota);
}
