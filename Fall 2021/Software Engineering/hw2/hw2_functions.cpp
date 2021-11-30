//definitions. this is the actual function code

#include "hw2_functions.h"

//code below


void testFoo(string thing){
    cout << "testing... " << thing << endl;
}
void genericGreet(){
cout << "UMB COURSE PATH VALIDATOR!";
cout << endl << "standby... loading courses" << endl;
}
int getPathLength(){
cout << "How many classes will you take: ";
int pl;
cin >> pl;
cout << endl;
return pl;
}

int countFile(){
//read in file
	ifstream fin;
   	fin.open("course_catalog.txt");

//count lines in file
	int linesCount = 0;
	string temp;
	while(getline(fin,temp)){
		linesCount++;
	}
	fin.close();

return linesCount;
}
int askBreak(){
    cout << "Type 0 to quit or type 1 to run again: ";
    int temp;
    return temp;
}

int validate(int y1, int n1, int v1, int y2, int n2, int v2){
    if (y2 < y1){
        return 0;
    }else if(v2 < v1){
        return 0;
    }else if(n2 < n1){
        if(n2 <v1 || v2 < n1){
            return 0;
        }
    }else{
        return 1;
    }
}
