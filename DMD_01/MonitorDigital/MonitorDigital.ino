/*input digital*/

// definir entradas
int pushbutton1 = 2;
int pushbutton2 = 3;
int pushbutton3 = 4;
int pushbutton4 = 5;
int pushbutton5 = 6;
int pushbutton6 = 7;
int pushbutton7 = 8;

// preparar rutina de lectura
void setup() {
  Serial.begin(9600);
  // definir pins como entradas
  pinMode(pushbutton1, INPUT);
    pinMode(pushbutton2, INPUT);
      pinMode(pushbutton3, INPUT);
        pinMode(pushbutton4, INPUT);
          pinMode(pushbutton5, INPUT);
            pinMode(pushbutton6, INPUT);
              pinMode(pushbutton7, INPUT);
}

// rutina loop
void loop() {
  //leer el boton
  int buttonstate1 = digitalRead(pushbutton1);
    int buttonstate2 = digitalRead(pushbutton2);
        int buttonstate3 = digitalRead(pushbutton3);
            int buttonstate4 = digitalRead(pushbutton4);
                int buttonstate5 = digitalRead(pushbutton5);
                    int buttonstate6 = digitalRead(pushbutton6);
                        int buttonstate7 = digitalRead(pushbutton7);
                        
                        Serial.println(buttonstate1);
                        Serial.println(buttonstate2);
                        Serial.println(buttonstate3);
                        Serial.println(buttonstate4);
                        Serial.println(buttonstate5);
                        Serial.println(buttonstate6);
                        Serial.println(buttonstate7);
}
                        
  
