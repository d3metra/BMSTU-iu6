#include <stdio.h>
#include <locale.h>
#include <cstdlib>
#include <time.h>

int main() {
	//Генерация исходной матрицы
	int A[4][4], i, j, jmax, max;
	setlocale(0, "russian");
	puts("Исходная матрица:");
	srand(time(NULL));
	for (i = 0; i <= 3; i++) {
		for (j = 0; j <= 3; j++) {
			A[i][j] = 50 - rand()%101;
			printf_s("%-5d", A[i][j]);
		}
		printf_s("\n");
	}

	//Обмен местами элементов матрицы, вывод полученное матрицы
	for (i = 0; i <= 3; i++) {
		jmax = 0;
		for (j = 1; j <= 3; j++) {
			if (A[i][j] > A[i][jmax])
				jmax = j;
		}
		max = A[i][jmax];
		A[i][jmax] = A[i][3];
		A[i][3] = max;
	}
	puts("Матрица после обмена местами максимального элемента строки и элемета последнего столбца");
	for (i = 0; i <= 3; i++) {
		for (j = 0; j <= 3; j++) {
			printf_s("%-5d", A[i][j]);
		}
		printf_s("\n");
	}

	//Вывод адресов максимальных элементов
	puts("Адреса максимальных элементов матрицы:");
	for (i = 0; i <= 3; i++)
		printf_s("%p\t", &A[i][3]);
	return 0;
}