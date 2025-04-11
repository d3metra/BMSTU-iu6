#include <iostream>
#include <locale.h>
using namespace std;
int main()
{
	int x = 1, y = 1, z, A;
	setlocale(0, "russian");
	cout << "Введите число A: ";
	cin >> A;
	cout << "Ряд Фибоначи:" << '\n' << "1  1  ";
	while ((z = x + y), z <= A)
	{
		cout << z << "  ";
		x = y;
		y = z;
	}
	cout << z << '\n' << "Первое число ряда Фибоначи, большее числа A: " << z;
	return 0;
}