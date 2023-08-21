#include <PZEM004Tv30.h>
#include <Wire.h>
#include <ArduinoJson.h>

PZEM004Tv30 pzem(12, 11); // Software Serial pin 11 (RX) & 12 (TX)
int count = 0;
StaticJsonDocument<48> root;

void setup() {
   Serial.begin(115200);
}

void loop() {
  delay(2000);
   float voltage = pzem.voltage();
   float current = pzem.current();
   float power = pzem.power();
   float energy = pzem.energy();
   float frequency = pzem.frequency();
   float pf = pzem.pf();
   
   root["voltage"] = voltage;
   root["current"] = current;
   root["power"] = power;
   root["energy"] = energy;
   root["frequency"] = frequency;
   root["pf"] = pf;

   serializeJson(root, Serial);
   Serial.println();
   
}
