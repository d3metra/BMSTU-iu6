#include <stdio.h>
#include <string.h>
#include <conio.h>
#include "Chess.h"

int main()
{
    Color clr;
    char str[6];
    int n;
    char c;
    //Родительский класс
    puts("<<Class ChessPiece>>\nEnter the color and coordinates of the chess piece:");
    gets_s(str, 6);
    if (strcmp(str, "White") == 0)
        clr = Color::White;
    else if (strcmp(str, "Black") == 0)
        clr = Color::Black;
        else 
        {
            puts("Incorrect color entered"); 
            return 1;
        }
    scanf_s("%c %d", &c, 1, &n);
    TChessPiece P;
    P.Init(clr, c, n);
    puts("Information about a chess piece:");
    P.Info();
    P.CheckColor();
    putc('\n', stdout);
    
    //Наследуемый класс "Слон"
    puts("<<Class Bishop>>\nEnter the color and coordinates of the bishop:");
    getc(stdin);
    gets_s(str, 6);
    if (strcmp(str, "White") == 0)
        clr = Color::White;
    else if (strcmp(str, "Black") == 0)
        clr = Color::Black;
    else
    {
        puts("Incorrect color entered");
        return 1;
    }
    scanf_s("%c %d", &c, 1, &n);
    TBishop B;
    B.Init(clr, c, n);
    puts("Information about a bishop:");
    B.Info();
    B.CheckColor();
    puts("Enter the coordinates of another chess piece:");
    getc(stdin);
    scanf_s("%c %d", &c, 1, &n);
    B.CheckPos(c, n);
    _getch();
    return 0;
}