//main file
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include "hw2_functions.h"
using namespace std;


struct course{
	string name,code;
	int year,num,ver;
};

int main(){
	genericGreet();
	int catalogSize = countFile();
	ifstream fin;
   	fin.open("course_catalog.txt");
	cout << "generating catalog..." <<endl;
	struct course courses[catalogSize];
	int i = 0;
	while(i<catalogSize){
		string code;
		getline(fin, courses[i].name, '\t');
		getline(fin, code, '\n');
		courses[i].code = code;
		code.erase(0,code.find('.')-1); //erases everything up to the year
		courses[i].year = code[0]-48; //x.x.x is an easy format to parse. no class would have more than 9 levels in a sequence so this works. also needs ascii offset
		courses[i].num = code[2]-48; //i would have preferred not to use string manipulation but its 1:00 am and i want to go to bed
		courses[i].ver = code[4]-48;
		i++;
	}
	
	/*for(int i=0;i<catalogSize;i++){
		cout << courses[i].name << '\t' << courses[i].year << '.' << courses[i].num << '.' << courses[i].ver <<endl;
	}*/
	do{
		int failFlag = true;
		int pl = getPathLength();
		if (pl < 8) {failFlag = false;}
		cout << "Enter path of courses seperated by spaces: ";
		vector<int> order;
		string raw;
		string dummy; //yeah idk why this works... 
		getline(cin, dummy);
		getline(cin, raw);
		int temp = 0;
		while (temp < pl){ //extract order
			if(temp == pl-1){// if the following code executes then its the last member of the order and wont have a space so i have to handle it a little different
				if(raw.length() == 1){//this indicated 1 digit number
					order.push_back(raw[0]-48);
				}
				else{ //if this code is reached, a 2 digit number is detected
					order.push_back((raw[0]-48)*10 + (raw[1]-48)); //this is single jankiest line of code i have ever written
				}
			}
			else if(raw.find(' ') == 1){//this indicated 1 digit number
				order.push_back(raw[0]-48);
				raw.erase(0,2); //delete the first 2 chars (num and space)
			}
			else{ //if this code is reached, a 2 digit number is detected
				string tstr = raw.substr(0,2); //save the first two chars (this is the desired num)
				order.push_back((tstr[0]-48)*10 + tstr[1]-48); //this is single jankiest line of code i have ever written
				raw.erase(0,3); //delete the first 3 chars (num, num,space)
			}
			temp++;
		}
		cout << endl << "order complete. " << endl;
		cout << "validating..." << endl;
	if(failFlag == true){
		for (int i = 0; i < pl-1; i++){
			for (int j = i+1; j < pl; j++){
				if(validate(courses[order[i]].year, courses[order[i]].num, courses[order[i]].ver, courses[order[j]].year, courses[order[j]].num, courses[order[j]].ver) == false){
					//cout << "i detected invalid between codes " << courses[order[i]].code << " and " << courses[order[j]].code << endl;
					failFlag = false;
					break;
				}
			}
		}
	}
	if(failFlag == false){
		cout << "class path INVALID!!" << endl;
	}else{cout << "class path VALID!!" << endl;}
	}while(askBreak());
    return 0;
}

