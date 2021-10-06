#include <iostream>
using namespace std;

int close, op1Chose, op2Chose = 0;
int userInput,anxiety,day,pills,legs,steps,hours,weight,height;
double temp,cals;

void greet(){cout << "\n\nHealth-o-Matic Options\n";
      cout << "----------------------------\n";
      cout << "1.Taking a Walk!\n";
      cout << "2.Your Medications\n";
      cout << "3.NapTime!!\n";
      cout << "4.Caloric Intake\n";
      cout << "5.Quit\n\n\n";}
int menu(){
  greet();
  cin >> userInput;
  return userInput;
}
int askDay(){
  do{
    cout << "Enter day of week (1-7): ";
    cin >> day;
    if(day < 1 || day > 7){
      cout << "error, unreasonable input.\n";
    }
  } while(day < 1 || day > 7);
  return day;
}
int askLegs(){
  do{
    cout << "Enter legs (positive): ";
    cin >> legs;
    if(legs < 0){
      cout << "error, unreasonable input.\n";
    }
  } while(legs < 0);
    return legs;
}
int askAnxiety(){
  do{
    cout << "Enter anxiety level (1-10): ";
    cin >> anxiety;
    if(anxiety < 1 || anxiety > 10){
      cout << "error, unreasonable input.\n";
    }
  } while(anxiety < 1 || anxiety > 10);
  return anxiety;
}
int askHours(){
    do{
    cout << "Enter hours of sleep (0-24): ";
    cin >> hours;
    if(hours < 1 || hours > 24){
      cout << "error, unreasonable input.\n";
    }
  } while(hours < 1 || hours > 24);
  return hours;
}
int computePills(int d, int anx){
  pills = anx - d;
  if (pills > 0){
    return pills;    
  }
  else{
    pills = 0;
    return pills;
  }
}
int computeSteps(int l){
  for(steps = 1; l > 0; l--){
    steps = steps * l;
  }
  return steps;

}
void walk() {
  int x = computeSteps(askLegs());
  cout << "Steps: " << x;
  op1Chose = 1; 
}
void meds() {
  int p = computePills(askDay(), askAnxiety());
  cout << "Pills: " << p;
  op2Chose = 1;
}
int computeNap(int h, int s, int p){
  if (pills == 0){
    return h+s;
  }else{
    return h+s/p;
  }
}
void nap() {
  if(op1Chose == 0 || op2Chose == 0){
    cout << "error, missing data.\n";
  }else{
    int mins = computeNap(askHours(), steps, pills);
    cout << "Minutes: " << mins;
  }
}
int askWeight(){
    do{
    cout << "Enter weight (50-500): ";
    cin >> weight;
    if(weight < 50 || weight > 500){
      cout << "error, unreasonable input.\n";
    }
  } while(weight < 50 || weight > 500);
  return weight;
}
int askHeight(){
    do{
    cout << "Enter height (20-90): ";
    cin >> height;
    if(height < 20 || height > 90){
      cout << "error, unreasonable input.\n";
    }
  } while(height < 20 || height > 90);
  return height;
}
double askTemp(){
      do{
    cout << "Enter room temperature (40-90): ";
    cin >> temp;
    if(temp < 40 || temp > 90){
      cout << "error, unreasonable input.\n";
    }
  } while(temp < 40 || temp > 90);
  return temp;
}
double computeCal(int s, double t, int h, int w){
  return 6*w*h+1/t+s;
}
void calories() {
  if (op1Chose == 0){
    cout << "error, missing data.\n";
  }else{
    cals = computeCal(steps, askTemp(), askHeight(), askWeight());
    cout << "calories: " << cals;
  }
}
int main() {
    while(close == 0){ 
        switch (menu()) {
        case 1:
          walk();
          break;
        case 2:
          meds();
          break;
        case 3:
          nap();
          break;
        case 4:
          calories();
          break;
        case 5:
          cout << "PROGRAM COMPLETE";
          close = 1;
          break;
        }
    }
}