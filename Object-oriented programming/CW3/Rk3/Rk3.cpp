#include "ABC.h"
#include <iostream>

void _Data(TA *pA)
{
	pA->Data();
}

int main()
{
	TB *B;
	B = new TB;
	B->Data();
	TC *C;
	C = new TC;
	C->Data();
	std::cout << '\n';
	_Data(B);
	_Data(C);
	delete B;
	delete C;
	return 0;
}