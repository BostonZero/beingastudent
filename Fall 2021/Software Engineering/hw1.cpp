#include <iostream>
using namespace std;

    int close = 0;
    int op3Chose = 0;
    int op2Chose = 0;
    int userInput,anxiety,day,pills,legs,steps;

void greet(){cout << "Health-o-Matic Options\n";
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
      cout << "error, read the prompt idiot.\n";
    }
  } while(day < 1 || day > 7);
  return day;
}
int askLegs(){
  do{
    cout << "Enter legs (positive): ";
    cin >> legs;
    if(legs < 0){
      cout << "error, read the prompt idiot.\n";
    }
  } while(legs < 0);
    return legs;
}
int askAnxiety(){
  do{
    cout << "Enter anxiety level (1-10): ";
    cin >> anxiety;
    if(anxiety < 1 || anxiety > 10){
      cout << "error, read the prompt idiot.\n";
    }
  } while(anxiety < 1 || anxiety > 10);
  return anxiety;
}
int computePills(int anx, int d){
  
}
int computeSteps(int l){
  for(steps = 1; l > 0; l--){
    steps = steps * l;
  }
  return steps;

}
void walk() {
  cout << "Steps: " << computeSteps(askLegs());
  
}
void meds() {
  cout << "Pills: " << computePills(askAnxiety(), askDay());
}
void nap() {
  //code
}
void calories() {
  // code to be executed
}





int main() {

    while(close == 0){
        
      menu();

      cin >> userInput;
        switch (userInput) {
        case 1:
          cout << "Monday";
            break;
        case 2:
          cout << "Tuesday";
            break;
        case 3:
          cout << "Wednesday";
            break;
        case 4:
          cout << "Thursday";
            break;
        case 5:
          cout << "Friday";
            close = 1;
            break;
        }


    }
}