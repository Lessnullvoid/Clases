/* ======================================================================
 Arduino Punk Console
 A simple programmable 8 step tone sequencer 
 by dano/beavisaudio.com

 Revs
 -----------------------------------
 15 Sept  djh  initial version
======================================================================*/

// Map all the input and output pins
#define AnalogInFrequency 1
#define AnalogInTempo 2
#define AnalogInDuration 0
#define DigitalOutSignal 11
#define DigitalInSwitch0 2
#define DigitalInSwitch1 3
#define DigitalInSwitch2 4
#define DigitalInSwitch3 5
#define DigitalInSwitch4 6
#define DigitalInSwitch5 7
#define DigitalInSwitch6 8
#define DigitalInSwitch7 9 
#define DigitalInStartStop 10
#define DigitalOutLED 12

// Set up the array for each step
int steps[] = {100,120,140,160,180,200,220,240};

// misc housekeeping
int duration = 50;
int pitchval = 1;
int fPlayMode = true;
int lastPushedStep = -1;

// Initialize the tempo
int tempo = 100;

void setup()
{ 
  // setup pin modes (Digital pins are input by default, but
  // I like to set 'em explicitly just so the code is clear.
  pinMode (DigitalInSwitch0, INPUT);
  pinMode (DigitalInSwitch1, INPUT);
  pinMode (DigitalInSwitch2, INPUT);
  pinMode (DigitalInSwitch3, INPUT);
  pinMode (DigitalInSwitch4, INPUT);
  pinMode (DigitalInSwitch5, INPUT);
  pinMode (DigitalInSwitch6, INPUT);
  pinMode (DigitalInSwitch7, INPUT);                
  pinMode (DigitalInStartStop, INPUT);
  pinMode (DigitalOutSignal, OUTPUT);  
  pinMode (DigitalOutLED, OUTPUT);

  // setup comms for the LCD display
  Serial.begin(9600);

  StartupMessage();

} 

void StartupMessage()
{
  clearLCD();
  Serial.print ("BEAVIS: Arduino");
  delay(300);
  Serial.print (254, BYTE);
  Serial.print (192, BYTE);
  Serial.print ("Punk Console!");
  delay (2000);
  clearLCD();
  Serial.print ("Beavis: APC");
}

void clearLCD()
{
  Serial.print(254, BYTE);
  Serial.print(1, BYTE);
}

void loop() 
{
  // Main sequence loop  
  for (int i=0; i<8; i++)
  {   
    // Are we playing or stopping?
    fPlayMode = digitalRead (DigitalInStartStop);
    digitalWrite (DigitalOutLED, HIGH);

    // Check the Hardware
     readSwitches();
     readPots();

    // update the display
    updateDisplay();

    // Make the noise
    if (fPlayMode)
    {
      freqout (steps[i], duration);
    }
    digitalWrite (DigitalOutLED, LOW);

    // Pause between steps
    delay (tempo);       
  }
} 


void updateDisplay()
{
  Serial.print (254, BYTE);
  Serial.print (192, BYTE);
  Serial.print ("T:");
  Serial.print (tempo);
  Serial.print (" d:");
  Serial.print (duration);

 if (lastPushedStep != -1)
 {
    Serial.print ("*");
    Serial.print (lastPushedStep);
 }
}

// Read the current values of the pots, called from the loop.
void readPots ()
{
    tempo = (analogRead (AnalogInTempo) * 1.9);
    duration = (analogRead (AnalogInDuration));      
}

// Read the current values of the switches and
// if pressed, replace the switch's slot frequency
// by reading the frequency pot.
void readSwitches()
{
  // reset last pushed button number
  lastPushedStep = -1;

  // check switch 0, if pressed, get the current freq into step 0, etc. etc.
  if (digitalRead (DigitalInSwitch0) == HIGH)
  {
    steps[0] = analogRead(AnalogInFrequency);
    lastPushedStep = 1;
  }

  else if (digitalRead (DigitalInSwitch1) == HIGH)
  {
    steps[1] = analogRead(AnalogInFrequency);
    lastPushedStep = 2;
  }

  else if (digitalRead (DigitalInSwitch2) == HIGH)
  {
    steps[2] = analogRead(AnalogInFrequency);
    lastPushedStep = 3;
  }
  else if (digitalRead (DigitalInSwitch3) == HIGH)
  {
    steps[3] = analogRead(AnalogInFrequency);
    lastPushedStep = 4;
  }
  else if (digitalRead (DigitalInSwitch4) == HIGH)
  {
    steps[4] = analogRead(AnalogInFrequency);
    lastPushedStep = 5;
  }
  else if (digitalRead (DigitalInSwitch5) == HIGH)
  {
    steps[5] = analogRead(AnalogInFrequency);
    lastPushedStep = 6;
  }
  else if (digitalRead (DigitalInSwitch6) == HIGH)
  {
    steps[6] = analogRead(AnalogInFrequency);
    lastPushedStep = 7;
  }
  else if (digitalRead (DigitalInSwitch7) == HIGH)
  { 
    steps[7] = analogRead(AnalogInFrequency);
    lastPushedStep = 8;
  }
}


//freqout code by Paul Badger 
// freq - frequency value
// t - time duration of tone
void freqout(int freq, int t) 
{ 
  int hperiod;     //calculate 1/2 period in us 
  long cycles, i; 

  // subtract 7 us to make up for digitalWrite overhead - determined empirically 
  hperiod = (500000 / ((freq - 7) * pitchval));             

  // calculate cycles 
  cycles = ((long)freq * (long)t) / 1000;    // calculate cycles 

  for (i=0; i<= cycles; i++)
  {              // play note for t ms  
    digitalWrite(DigitalOutSignal, HIGH);  
    delayMicroseconds(hperiod); 
    digitalWrite(DigitalOutSignal, LOW);  
    delayMicroseconds(hperiod - 1);     // - 1 to make up for fractional microsecond in digitaWrite overhead 
  } 
}

 

