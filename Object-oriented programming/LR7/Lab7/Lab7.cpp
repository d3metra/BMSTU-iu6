#include <iostream>
#include <conio.h>
#include "Words.h"

int main()
{
	using namespace std;
	char str[30];
	
	//Объект без конструктора
	cout << "Class without constructor" << '\n' << "Enter the word: ";
	cin.getline(str, 30);
	TWord W;
	W.Init(str);
	W.Info();
	cout << '\n' << "--------------" << '\n';
	//Объект с конструктором
	cout << "Class with constructor" << '\n' << "Enter the word: ";
	cin.getline(str, 30);
	TWord_cnst Wc(str);
	Wc.Info();
	cout << '\n' << "--------------" << '\n';
	_getch();
	return 0;
}