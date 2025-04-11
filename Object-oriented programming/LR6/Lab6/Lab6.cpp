#include <iostream>
#include <locale.h>
#include <string.h>

int main()
{
    struct spisok {
        unsigned short int num;
        spisok * ptr;
    };
    char str[100], * con = str;
    int min, max, x, a;
    spisok * first, * q, *maxptr, *minptr;
    using namespace std;
    setlocale(0, "russian");
    
    //Создание списка
    cout << "Введите строку целых чисел: ";
    cin.getline(str, 100);
    if (strcmp(str, "") != 0) {
        first = new spisok;
        first->num = atoi(strtok_s(str, " ", &con));
        q = first;
        while (*con != '\0') {
            q->ptr = new spisok;
            q = q->ptr;
            q->num = atoi(strtok_s(NULL, " ", &con)); 
        }
        q->ptr = NULL;
        q = first;
        cout << "Полученный список целых чисел: ";
        while (q != NULL) {
            printf_s("%d\t", q->num);
            q = q->ptr;
        }
        cout << '\n';

    //Поиск чисел с минимальной и максимальной  суммой цифр
        max = 0;
        maxptr = first;
        min = abs(first->num);
        minptr = first;
        q = first;
        while (q != NULL) {
            a = abs(q->num);
            x = 0;
            do {
                x += a % 10;
                a /= 10;
            } while (a != 0);
            if (x > max) {
                max = x;
                maxptr = q;
            }
            if (x < min) {
                min = x;
                minptr = q;
            }
            q = q->ptr;
        }
        cout << "Сумма цифр числа " << maxptr->num << " максимальна и равна " << max << '\n';
        cout << "Сумма цифр числа " << minptr->num << " минимальна и равна " << min << '\n';

    //Освобождения памяти
        while (first != NULL) {
            q = first->ptr;
            delete first;
            first = q;
        }
    }
    else cout << "Введена пустая строка.";
    return 0;
}