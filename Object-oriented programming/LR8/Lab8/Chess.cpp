#include "Chess.h"
#include <stdio.h>

TChessPiece::TChessPiece() 
{
	clr = Color::NoColor;
	crd.num = 0;
	crd.letter = 0;
}

void TChessPiece::Init(Color aclr, char l, int n)
{
	clr = aclr;
	crd.letter = l;
	crd.num = n;
}

void TChessPiece::Info()
{
	puts("Color of the chess piece:");
	switch (clr)
	{
	case Color::White: puts("White"); break;
	case Color::Black: puts("Black");
	}
	puts("Coordinate of the chess piece:");
	printf("%-c%-d\n", crd.letter, crd.num);
}

void TChessPiece::CheckColor()
{
	switch (clr) 
	{
	case Color::White: 
		{
		if (((crd.num + crd.letter) % 2) == 1)
			puts("The colors of the chess piece and the cells of the field match.");
		else
			puts("The colors of the chess piece and the cells of the field are different.");
		break;
	}
	case Color::Black:
		{
			if (((crd.num + crd.letter) % 2) == 0)
				puts("The colors of the chess piece and the cells of the field match.");
			else
				puts("The colors of the chess piece and the cells of the field are different.");
		}
	}
}

void TBishop::CheckPos(char l, int n) 
{
	bool flag = 0;
	int i;
	for (i = 1; ((crd.letter + i <= 'H') && (crd.num + i <= 8) && (!flag)); i++)
		if ((l == crd.letter + i) && (n == crd.num + i))
		{
			flag = true;
			break;
		}
	for (i = 1; ((crd.letter + i <= 'H') && (crd.num - i >= 1) && (!flag)); i++)
		if ((l == crd.letter + i) && (n == crd.num - i))
		{
			flag = true;
			break;
		}
	for (i = 1; ((crd.letter - i >= 'A') && (crd.num - i >= 1) && (!flag)); i++)
		if ((l == crd.letter - i) && (n == crd.num - i))
		{
			flag = true;
			break;
		}
	for (i = 1; ((crd.letter - i >= 'A') && (crd.num + i <= 8) && (!flag)); i++)
		if ((l == crd.letter - i) && (n == crd.num + i))
		{
			flag = true;
			break;
		}
	if (flag)
		puts("The figure is under attack.");
	else
		puts("The figure is not under attack.");
}