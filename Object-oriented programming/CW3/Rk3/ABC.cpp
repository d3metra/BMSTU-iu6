#include "ABC.h"
#include <iostream>
#include <random>
#include <time.h>

TA::TA()
{
	srand(time(NULL));
	x = rand() %  98 + 1;
	y = rand() % 98 + 101;
}

void TB::Data()
{
	using namespace std;
	cout << "<<Method of TB class>>\n";
	cout << "Value X: " << x << "\nValue Y: " << y << '\n';
}

void TC::Data()
{
	using namespace std;
	cout << "<<Method of TC class>>\n";
	cout << "X and Y values: " << x << '\t' << y << '\n';
}