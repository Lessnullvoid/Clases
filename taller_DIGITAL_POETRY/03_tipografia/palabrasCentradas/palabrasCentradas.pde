PFont font;
String[] words = { "es luz", "en silencio", "espacios", "ausentes",":",
"la esquina", "el limite", "salidas", "constantes", " " };

int whichWord = 0;

void setup() {
size (720, 480);
font = loadFont("Helvetica-Bold-120.vlw");
textFont(font);
textAlign(CENTER);
frameRate(5);
}

void draw() {

  background (0);
  whichWord++;
  if (whichWord == words.length) {
    whichWord = 0;
  }
 text(words[whichWord], width/2, height/2);
}
