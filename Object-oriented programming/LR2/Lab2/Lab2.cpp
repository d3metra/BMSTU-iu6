#include <iostream>
#include <locale.h>
#include <math.h>

int main()
{
    float a;
    int x;
    setlocale(0, "russian");
    puts("Введите целое значение: ");
    scanf_s("%d", &x);
    a = sqrt((fabs(sin(8 * x)) + 17) / pow((1 - sin(4 * x) * cos(pow(x, 2) + 18)), 2));
    printf("Результат выражения: a = %-5.3f", a);
    return 0;
}