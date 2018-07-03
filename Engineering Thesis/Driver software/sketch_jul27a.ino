
int M1dirpin = 4;
int M1steppin = 5;
String odebraneDane="";
int krokk;

void setup()
{
  pinMode(M1dirpin,OUTPUT);
  pinMode(M1steppin,OUTPUT);
  Serial.begin(9600); //Ustawienie prędkości transmisji
}

void obrot(int krok)
{
  int j=0;


if(krok>0)
{
  delayMicroseconds(1);
  digitalWrite(M1dirpin,LOW);
  for(j=0;j<krok;j++)
  {
    digitalWrite(M1steppin,LOW);
    delayMicroseconds(1);
    digitalWrite(M1steppin,HIGH); //Rising step
    delay(1);
  }
      digitalWrite(M1steppin,LOW); //Rising step
    delay(1);
}
if(krok<0)
{
  delayMicroseconds(1);
  digitalWrite(M1dirpin,HIGH);
  krok=-krok;
 for(j=0;j<krok;j++)
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
    odebraneDane = Serial.readStringUntil('\n'); //Jeśli tak, to odczytaj je do znaku końca linii i zapisz w zmiennej odebraneDane
    krokk=odebraneDane.toInt();
     obrot(krokk);
      float stopnie=(krokk*0.05)/5;
    // Serial.println("KROK " + odebraneDane + " == "+ stopnie +" stopna"); //Wyświetl komunikat
    Serial.println("1");
  }
}


