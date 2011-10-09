#include <stdio.h>
#include <math.h>
#include <LiquidCrystal.h>

LiquidCrystal lcd(7, 8, 9, 10, 11, 12);

void setup() {
  Serial.begin(9600);
  lcd.begin(16, 2);
  lcd.print("Ready");
  
  receive_data();
}

void loop() {
  
}

void receive_data() {
  char echo;
  while (true) {
    if (Serial.available() > 0) {
      echo = Serial.read();
      lcd.clear();
      lcd.print("Got a value: ");
      lcd.print(echo);
      break;
    }
  }
  
  Serial.print(echo);
  
  while (true);
}
