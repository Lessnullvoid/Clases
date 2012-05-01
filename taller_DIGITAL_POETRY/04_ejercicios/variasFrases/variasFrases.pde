// area de variables
PFont tipografia;
// fragmento Charles Baudaliere 
String[] poema1 = { 
  "la vida", "es un", "hospital", "donde", "cada enfermo", "está poseído", "por el ", "deseo", "de cambiar", " de cama", " "};
int elpoema1 = 0;

void setup() {
  size(600, 500);
  tipografia = loadFont("Dekar-48.vlw");
  textFont(tipografia);
  textAlign(LEFT);
  frameRate(8);
}

void draw() {
  fill(125, 24);
  rect(0, 0, width, height);  
  noCursor();

  // intineracion de palabras
  elpoema1++;
  if (elpoema1 == poema1.length) {
    elpoema1 = 0;
  }   

  fill (0);
  textAlign(LEFT);
  text(poema1[elpoema1], mouseX, mouseY);
} 


