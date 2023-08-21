#include <ArduinoJson.h>

int a;
StaticJsonDocument<200> pressureJson;

void setup()
{
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(A6,INPUT);
  Serial.begin(9600);
 //initialize the variables we're linked to
//  int raw = analogRead(A6);
//  float voltage = (raw * 5.0) / 1024.0;     // voltage at the pin of the Arduino
//  float pressure_bar = ((3.0*((float)voltage - 0.62))*1000000.0)/10e5; 
// Input = pressure_bar;
// //Input = analogRead(PIN_INPUT);

}

void loop()
{
 int raw = analogRead(A6);
 a = random(0,255);
 float voltage = (((raw * 5.0) / 1024.0));     // voltage at the pin of the Arduino
 float pressure_bar = ((3.0*((float)voltage - 0.59))*1000000.0)/10e5; 
 float Input = pressure_bar+0.2;
 analogWrite(10,255);
 analogWrite(9,0);
// Serial.println(voltage);
// Serial.println(a);
 delay(100);
 //Serial.println(Output);
// Serial.println(Input);
// Serial.println("x");
 pressureJson["pressure"] = 6.5;
 serializeJson(pressureJson, Serial);
 Serial.println();
 delay(2000);
}
