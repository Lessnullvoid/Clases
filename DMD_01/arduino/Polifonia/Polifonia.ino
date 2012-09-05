byte state;

byte mod[] = {

0, 0, 0, 0};

void setup() {

DDRD = DDRD | B11111100;

DDRB = DDRB | B00000000;

}

void loop() {

for(int i = 0; i < 32767; i++) {

for(int j = 0; j < 4; j++) {

state = 0;

mod[j] = analogRead(j) >> 2 & B11111110;

mod[j] = i % mod[j] / (mod[j] / 2);

state = state + mod[j];

state = state << 1;

PORTD = state << 2;

}

}

}
