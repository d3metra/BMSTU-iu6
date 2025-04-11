#include <iostream>
#include <string.h>
#include <windows.h>
#include <conio.h>

typedef char str[101];
using namespace std;

char * corrector(str astring) {
	char rez[102] = "", buf[25], * con = nullptr;
	int cnt;
	if (*astring != '\0') {
		cnt = 1;
		strcpy_s(buf, strtok_s(astring, " ", &con));
		if (!((*buf == 'Л') || (*buf == 'л')))
			(strcat_s(rez, buf), strcat_s(rez, " "));
		while (*con != '\0') {
			cnt += 1;
			strcpy_s(buf, strtok_s(NULL, " ", &con));
			if ((cnt % 2 == 0) && ((*buf == 'Н') || (*buf == 'н'))) {
				cout << "Введите слово для замены: ";
				cin >> buf;
				(strcat_s(rez, buf), strcat_s(rez, " "));
			}
			else if (!((cnt % 2 == 1) && ((*buf == 'Л') || (*buf == 'л'))))
				(strcat_s(rez, buf), strcat_s(rez, " "));
		}
	}
	else strcpy_s(rez, "*Пустая строка*");
	return rez;
}

int main(void) {
	str* source_mas, * result_mas;
	int n, i;
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);	

	//Ввод исходной последовательности строк
	cout << "//////" << '\n' << "Введите кол-во строк в последовательности: ";
	cin >> n;
	source_mas = new str[n];
	cout << "Введите последовательность строк: " << '\n';
	cin.ignore();
	for (i = 0; i < n; i++) {
		cin.getline (source_mas[i], 100);
	}
	cout << '\n' <<"/////" << '\n' << "Исходная последовательность строк: " << '\n';
	for (i = 0; i < n; i++) {
		cout << *(source_mas + i) << '\n';
	}
	cout << '\n';

	//Корректировка строк
	result_mas = new str[n];
	for (i = 0; i < n; i++) {
		strcpy_s(result_mas[i], corrector(source_mas[i]));
	}
	cout << "//////" << '\n' << "Последовательность откорректированных строк: " << '\n';
	for (i = 0; i < n; i++) {
		cout << result_mas[i] << '\n';
	}

	delete[] source_mas;
	delete[] result_mas;
	_getch();
	return 0;
}