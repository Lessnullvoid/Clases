PFont font;
String[] words = { "la palabra", "el verbo", "acción", "proceso", "ides"," " };

int whichWord = 0;

void setup() {
  size(720, 480);
  font = loadFont("Helvetica-Bold-90.vlw");
  textFont(font);
  noStroke();
}

void draw() {
fill(34, 128, 209, 2);
rect(0, 0, width, height);
fill(0);
 whichWord++;
  if (whichWord == words.length) {
    whichWord = 0;
  }
text (words[whichWord], random(-820, 820), random(-620, 620));

}
  
