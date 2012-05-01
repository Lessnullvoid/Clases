PImage a, b;
float offset;

void setup() {
  size(300, 300);
  a = loadImage("t1l.jpg");  // Load an image into the program 
  b = loadImage("t1R.jpg");   // Load an image into the program 
}

void draw() { 
  image(a, 0, 0);
  float offsetTarget = map(mouseX, 0, width, -b.width/1 - width/1, 0);
  offset += (offsetTarget-offset)*0.05; 
  tint(255, 153);
  image(b, offset, 20);
}
