#include <stdio.h>
#include <string.h>

extern void del_characters(char* string, int length);

int main() {
    char string[256] = {};
    puts("Введите строку:");
    fgets(string, 255, stdin);
    string[strlen(string) - 1] = '\0';

    del_characters(string, strlen(string));
    return 0;
}