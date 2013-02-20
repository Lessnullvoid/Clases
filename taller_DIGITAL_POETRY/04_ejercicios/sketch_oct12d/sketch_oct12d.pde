PFont myFont; 
void setup(){ 
size(800, 800); 
background(255,255,255); 
// String[] fontList = PFont. 
list(); 
// println(fontList); 
myFont = createFont("Times- Roman",48); 
textFont(myFont,272); 
translate(400,400); 
for(int i=0;i<10;i=i+1) 
{ 
fill(0,0,0); 
textAlign(CENTER); 
pushMatrix(); 
rotate(PI*i/3); 
text("libre",0,0); 
popMatrix(); 
} 
} 

