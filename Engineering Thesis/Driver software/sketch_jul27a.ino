
int M1dirpin = 4;
int M1steppin = 5;
String receivedData="";
int steps;

void setup()
{
  pinMode(M1dirpin,OUTPUT);
  pinMode(M1steppin,OUTPUT);
  Serial.begin(9600); //Ustawienie prędkości transmisji
}

void rotation(int step)
{
  int j=0;


if(step>0)
{
  delayMicroseconds(1);
  digitalWrite(M1dirpin,LOW);
  for(j=0;j<step;j++)
  {
    digitalWrite(M1steppin,LOW);
    delayMicroseconds(1);
    digitalWrite(M1steppin,HIGH); //Rising step
    delay(1);
  }
      digitalWrite(M1steppin,LOW); //Rising step
    delay(1);
}
if(step<0)
{
  delayMicroseconds(1);
  digitalWrite(M1dirpin,HIGH);
  step=-step;
 for(j=0;j<step;j++)
  {
    digitalWrite(M1steppin,HIGH);
    delayMicroseconds(1);
    digitalWrite(M1steppin,LOW); //Rising step
    delay(1);
  }
      digitalWrite(M1steppin,LOW); //Rising step
    delay(1);

}

}

void loop() 
{
  if(Serial.available() > 0) 
  { //Czy Arduino odebrano dane
    receivedData = Serial.readStringUntil('\n'); //Jeśli tak, to odczytaj je do znaku końca linii i zapisz w zmiennej receivedData
    steps=receivedData.toInt();
     rotation(steps);
      float degrees=(steps*0.05)/5;
    // Serial.println("Step " + receivedData + " == "+ degrees +" degrees"); //Wyświetl komunikat
    Serial.println("1");
  }
}


