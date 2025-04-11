#include <stdio.h>
#include <locale.h>
#include <string.h>

int main(void) {
	char str[100], word[100], rab[100], * s = str, sym;
	int i;
	setlocale(0, "russian");

	//Работа со строкой: поиск слова, начинающегося на "t", его инверсия
	puts("Введите строку:");
	gets_s(str, 100);
	if (strcmp(str, "") != 0) {
		puts("Введенная строка:");
		puts(str);
		if (str[0] != 'T') {
			do {
				s = strchr(s + 1, ' ');
				if (s == NULL) {
					break;
				}
				s = s + 1;
			} while ((*s != 't') && (*s != 'T'));
		}
		if (s != NULL) {
			for (i = 0; (*(s + i) != ' ') && (*(s + i) != '.'); i++) {
				word[i] = *(s + i);
				word[i + 1] = '\0';
			}
			for (i = 1; i <= strlen(word) / 2; i++) {
				sym = word[i - 1];
				word[i - 1] = word[strlen(word) - i];
				word[strlen(word) - i] = sym;
			}
			strcpy_s(rab, (s + strlen(word)));
			*s = '\0';
			strcat_s(str, word);
			strcat_s(str, rab);
			puts("Редактированая строка:");
			puts(str);
		}
		else puts("В веденной строке нет слов, начинающихся на букву t");

		//Поиск адресов иных вхождений "t"
		if ((strchr(str, 'T') != NULL) && (strchr(str, 'T') != (s + strlen(word) - 1)) ||
			(strchr(str, 't') != NULL) && (strchr(str, 't') != (s + strlen(word) - 1))) {
			puts("Адреса иных вхождений буквы t:");
			for (i = 0; i <= strlen(str); i++) {
				if (((str[i] == 't') || (str[i] == 'T')) && (&str[i] != (s + strlen(word) - 1))) {
					printf_s("%p\t", &str[i]);
				}
			}
		}
		else puts("В данной строке более нет букв t");
	}
	else puts("Введена пустая строка");
	return 0;
}