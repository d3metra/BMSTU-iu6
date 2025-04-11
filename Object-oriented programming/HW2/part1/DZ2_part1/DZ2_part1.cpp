#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <time.h>

void sort (int &an, int *amas) 
{
	int i, j, x;
	for (i = 1; i < an; i++) {
		x = *(amas + i);
		j = i - 1;
		while ((*(amas + j) > x) && (j >= 0)) {
			*(amas + j + 1) = *(amas + j);
			j = j - 1;
		}
		if ((j >= 0) && (*(amas + j) == x)) {
			for (j += 1; j < an - 1; j++) {
				*(amas + j) = *(amas + j + 1);
			}				
			i -= 1;
			an -= 1;
		}
		else *(amas + j + 1) = x;
	}
}

int main()
{
	srand((unsigned)time(NULL));
	int n, * mas, i;

// Генерация целых чисел и создание массива
	puts("Enter the number of integers:");
	scanf_s("%d", &n);
	mas = new int[n];
	for (i = 0; i < n; i++) {
		*(mas + i) = rand() % 200 - 100;
	}
	puts("Generated array of integers:");
	for (i = 0; i < n; i++) {
		printf_s("%-d\t", *(mas + i));
	}
	printf_s("\n");

// Сортировка массива
	sort(n, mas);
	puts("Sorted array:");
	for (i = 0; i < n; i++) {
		printf_s("%-d\t", *(mas + i));
	}
	delete[] mas;
	_getch();
	return (0);
}