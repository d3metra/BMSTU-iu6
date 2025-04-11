#include <stdlib.h>
#include <stdio.h>
#include <conio.h>

int main(int argc, char *argv[]) 
{
    FILE * F, * H;
    char sym, x;
    fopen_s(&F, "F.txt", "w+");
    if (F) {
        fputs("Enter a sequence of characters:\n", stdout);
        while ((sym = getc(stdin)) != '.') {
            putc(sym, F);
        }
        fputs("\nFile F:\n", stdout);
        rewind(F);
        while ((sym = getc(F)) != EOF) {
            putc(sym, stdout);
        }
        fputs("\n---------------------------\n", stdout);
    }
    else {
        fputs("Error! Can't open file F.\n", stderr);
        _getch();
        return 1;
    }
    fopen_s(&H, "H.txt", "w+");
    if (H) {
        fseek(F, 1, 0);
        while ((sym = getc(F)) != EOF) {
            fseek(F, -2, 1);
            x = getc(F);
            if ((x == 'a') || (x == 'A')) {
                putc(sym, H);
            }
            fseek(F, 1, 1);
        }
        fputs("\nFile H:\n", stdout);
        rewind(H);
        while ((sym = getc(H)) != EOF) {
            putc(sym, stdout);
        }
        fputs("\n---------------------------", stdout);
    }
    else {
        fputs("Error! Can't open file H.\n", stderr);
        _getch();
        return 2;
    }
    fclose(F);
    fclose(H);
    _getch();
    return 0;
}