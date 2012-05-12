#define DIV_PIN   5
#define FREQ_PIN  4
#define DUTY_PIN  3
 
void setup(){
  pinMode(3, OUTPUT);
  pinMode(11, OUTPUT);
  TCCR2A = _BV(COM2A0) | _BV(COM2B1) | _BV(WGM20);
}
 
// accepts values 1-7 to set prescalers 1/8/32/64/128/256/1024
// 0 turns timer off
void setPrescaler(uint8_t divisor){
  if(divisor > 7)
    return;
  TCCR2B = _BV(WGM22) | divisor;
}
 
// expects a value 0.0-1.0
void setDutyCycle(float value){
  OCR2B = OCR2A * value;
}
 
void setTopLimit(uint8_t limit){
  OCR2A = limit;
}
 
void loop(){
  setPrescaler(analogRead(DIV_PIN)>>7);
  setTopLimit(analogRead(FREQ_PIN)>>2);
  setDutyCycle((float)analogRead(DUTY_PIN)/1023.0);
}
