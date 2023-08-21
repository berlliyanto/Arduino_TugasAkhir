#include <PZEM004Tv30.h>
#include <Wire.h>
#include <ArduinoJson.h>

//WARNA KABEL PZEM PADA PLANT
//putih  = 5v
//abu = gnd
//biru = D6
//ungu = D7

PZEM004Tv30 pzem(6, 7); // Software Serial pin 12 (RX) & 11 (TX)
StaticJsonDocument<64> pzemJson;
StaticJsonDocument<64> countJson;

const int  sensorPin1 = 2;
const int  sensorPin2 = 3;
const int  sensorPin3 = 4;
const int  sensorPin4 = 5;
const int  sensorPin5 = 12;
const int  relayPin1 = 11;
const int  relayPin2 = 10;
const int  relayPin3 = 9;
const int  relayPin4 = 8;

int sensorState1 = 0;
int sensorState2 = 0;
int sensorState3 = 0;
int sensorState4 = 0;
int sensorState5 = 0;
int lastsensorState1 = 0;
int lastsensorState2 = 0;
int lastsensorState3 = 0;
int lastsensorState4 = 0;

unsigned long cTimelimit1 = 0;
unsigned long pTimelimit1 = 0;
unsigned long intervallimit1 = 10;

unsigned long cTimelimit2 = 0;
unsigned long pTimelimit2 = 0;
unsigned long intervallimit2 = 10;

unsigned long cTimelimit3 = 0;
unsigned long pTimelimit3 = 0;
unsigned long intervallimit3 = 10;

unsigned long cTimelimit4 = 0;
unsigned long pTimelimit4 = 0;
unsigned long intervallimit4 = 10;

unsigned long cTime2 = 0;
unsigned long pTime2 = 0;
unsigned long interval2 = 3000;

unsigned long cSendJson = 0;
unsigned long pSendJson = 0;
unsigned long intervalSendJson = 30;


void setup() {
  pinMode(sensorPin1, INPUT);
  pinMode(sensorPin2, INPUT);
  pinMode(sensorPin3, INPUT);
  pinMode(sensorPin4, INPUT);
  pinMode(sensorPin5, INPUT);
  pinMode(relayPin1, OUTPUT);
  pinMode(relayPin2, OUTPUT);
  pinMode(relayPin3, OUTPUT);
  pinMode(relayPin4, OUTPUT);

  Serial.begin(9600);
}

void loop() {
  //--------------PZEM-----------------//
  cTime2 = millis();
  cTimelimit1 = millis();
  cTimelimit2 = millis();
  cTimelimit3 = millis();
  cTimelimit4 = millis();
  if (cTime2 - pTime2 >= interval2)
  {
    float voltage = pzem.voltage();
    float current = pzem.current();
    float power = pzem.power();
    float energy = pzem.energy();
    float frequency = pzem.frequency();
    float pf = pzem.pf();

    pzemJson["voltage"] = voltage;
    pzemJson["current"] = current;
    pzemJson["power"] = power;
    pzemJson["energy"] = energy;
    pzemJson["frequency"] = frequency;
    pzemJson["pf"] = pf;

    serializeJson(pzemJson, Serial);
    Serial.println();
    pTime2 = cTime2;
  }
  counting();
}

void counting(){
  sensorState1 = digitalRead(sensorPin1);
  sensorState2 = digitalRead(sensorPin2);
  sensorState3 = digitalRead(sensorPin3);
  sensorState4 = digitalRead(sensorPin4);
  sensorState5 = digitalRead(sensorPin5);

if(cTimelimit1 - pTimelimit1 >= intervallimit1){
    if (sensorState1 != lastsensorState1) {
      if (sensorState1 == LOW) {
        countJson["count1"] = "ON";
        //Serial.println("count1");
      }
      countJson["count1"] = "OFF";
//    delay(50);
    }
//  delay(50);
  countJson["count1"] = "OFF";
  lastsensorState1 = sensorState1;
  pTimelimit1 = cTimelimit1;
}
if(cTimelimit2 - pTimelimit2 >= intervallimit2){
    if (sensorState2 != lastsensorState2) {
      if (sensorState2 == LOW) {
        countJson["count2"] = "ON";
        //Serial.println("count2");
      }
      countJson["count2"] = "OFF";
//    delay(50);
    }
//   delay(50);
countJson["count2"] = "OFF";
  lastsensorState2 = sensorState2;
  pTimelimit2 = cTimelimit2;
}
if(cTimelimit3 - pTimelimit3 >= intervallimit3){
    if (sensorState3 != lastsensorState3) {
      if (sensorState3 == LOW) {
        countJson["count3"] = "ON";
        //Serial.println("count3");
      }
      countJson["count3"] = "OFF";
//    delay(50);
    }
//  delay(50);
  countJson["count3"] = "OFF";
  lastsensorState3 = sensorState3;
  pTimelimit3 = cTimelimit3;
}
if(cTimelimit4 - pTimelimit4 >= intervallimit4){
    if (sensorState4 != lastsensorState4) {
      if (sensorState4 == LOW) {
        countJson["count4"] = "ON";
        //Serial.println("count4");
      }
      countJson["count4"] = "OFF";
//    delay(50);
    }
//  delay(50);
  countJson["count4"] = "OFF";
  lastsensorState4 = sensorState4;
  pTimelimit4 = cTimelimit4;
}

if(cSendJson - pSendJson >= intervalSendJson){
    serializeJson(countJson, Serial);
  pSendJson = cSendJson;
}

  if (sensorState5 == LOW) {
    // turn LED on:
    digitalWrite(relayPin1, HIGH);
    digitalWrite(relayPin2, HIGH);
    digitalWrite(relayPin3, HIGH);
    digitalWrite(relayPin4, HIGH);
  } else if(sensorState5 == HIGH){
    // turn LED off:
    digitalWrite(relayPin1, LOW);
    digitalWrite(relayPin2, LOW);
    digitalWrite(relayPin3, LOW);
    digitalWrite(relayPin4, LOW);
  }
}
