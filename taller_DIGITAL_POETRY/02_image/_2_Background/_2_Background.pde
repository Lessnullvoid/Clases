PImage bg;
int a; 

void setup() 
{
  size(200,200);
  frameRate(30);
  // The background image must be the same size as the parameters
  // into the size() method. In this program, the size of "milan_rubbish.jpg"
  // is 200 x 200 pixels.
  bg = loadImage("street.jpg");
}

void draw() 
{
  background(bg);

  a = (a + 1)%(width+32);
  stroke(14, 255, 3);
  line(0, a, width, a-26);
  line(0, a-6, width, a-32);
    line(0, a-12, width, a-38);
}
