/* This is example for trial1.ino file!
   This is auto-generated ARDUINO C code from LDmicro.
   Rename this file as trial1.ino or copy content(or part) of this file
   to existing trial1.ino. Remove this comment from trial1.ino */
#include <ArduinoJson.h>

#include "trial1.h"

const int  buttonPin1 = A1;
const int  buttonPin2 = A2;
const int  buttonPin3 = A3;
const int  buttonPin4 = A4;

int buttonState1 = 0;
int buttonState2 = 0;
int buttonState3 = 0;
int buttonState4 = 0;
int lastButtonState1 = 0;
int lastButtonState2 = 0;
int lastButtonState3 = 0;
int lastButtonState4 = 0;

char y;

void setup() {
  // Put your setup code here, to run once, only if you no longer generate C code from LDmicro again.
  setupPlc();
  pinMode(buttonPin1, INPUT);
  pinMode(buttonPin2, INPUT);
  pinMode(buttonPin3, INPUT);
  pinMode(buttonPin4, INPUT);
  Serial.begin(9600);
}

void loop() {
//  
//  // You can place your code here to run repeatedly, only if you no longer generate C code from LDmicro again.
//    buttonState1 = digitalRead(buttonPin1);
//  buttonState2 = digitalRead(buttonPin2);
//  buttonState3 = digitalRead(buttonPin3);
//  buttonState4 = digitalRead(buttonPin4);
//
//   while (Serial.available()>0)
//   {
////    int x = Serial.readString().toInt();
//      String y = Serial.readString();
//      Serial.println(y);
//        if (y == "1"){
//        loopPlc();
//        mesin1();
//        mesin2();
//        mesin3();
//        mesin4();
//        }
////        Serial.println("ok");
////          } else {
////            Serial.println("not");
////            }
////      Serial.println(buttonState4);
////      if(y == "1"){
//
//        
////        } 
//  }
//loopPlc();

if (Serial.available()>0){
  y = Serial.read();
  Serial.println(y);
  buttonState1 = digitalRead(buttonPin1);
  buttonState2 = digitalRead(buttonPin2);
  buttonState3 = digitalRead(buttonPin3);
  buttonState4 = digitalRead(buttonPin4);
  delay(50);
}
  

  // You can place your code here to run repeatedly, only if you no longer generate C code from LDmicro again.
 if (y == '1'){
  loopPlc();
  if (buttonState1 != lastButtonState1) {
    if (buttonState1 == HIGH) {
      Serial.println("on1");
    } else {
      Serial.println("off1");
    }
    delay(50);
  }
  delay(50);
  lastButtonState1 = buttonState1;

  
  if (buttonState2 != lastButtonState2) {
    if (buttonState2 == HIGH) {
      Serial.println("on2");
    } else {
      Serial.println("off2");
    }
    delay(50);
  }
  delay(50);
  lastButtonState2 = buttonState2;

  
  if (buttonState3 != lastButtonState3) {
    if (buttonState3 == HIGH) {
      Serial.println("on3");
    } else {
      Serial.println("off3");
    }
    delay(50);
  }
  delay(50);
  lastButtonState3 = buttonState3;

  
  if (buttonState4 != lastButtonState4) {
    if (buttonState4 == HIGH) {
      Serial.println("on4");
    } else {
      Serial.println("off4");
    }
    delay(50);
  }
  delay(50);
  lastButtonState4 = buttonState4;
 }
}
