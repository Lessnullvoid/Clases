//inicio del programa, configuracion visual
void setup(){
  size(480, 629);
  smooth();
}

// segmento que se ejecuta continuo
void draw(){
  // segmento de selección de estado
  if (mousePressed){
    fill(0);
  }else{
    fill(mouseX, 0, mouseY);
  }
  ellipse(mouseX, mouseY, 80, 80);
}

