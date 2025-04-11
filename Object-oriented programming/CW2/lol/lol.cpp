#include <iostream>
#include <string.h>

int main()
{
	struct spisok {
		char str[35];
		spisok * ptr;
	};
	char s[100], * con;
	spisok * first1, * first2=NULL, * q1, * q2;
	int n = 0, cnt1=0, cnt2=0;
	using namespace std;
	cout << "Input string: ";
	cin.getline(s, 100);
	if (strcmp(s, "") != 0) {

		// Создание списков
		n += 1;
		first1 = new spisok;
		strcpy_s(first1->str, 35, strtok_s(s, " ", &con));
		first1->ptr = NULL;
		if (*con != '\0') {
			n += 1;
			first2 = new spisok;
			strcpy_s(first2->str, 35, strtok_s(NULL, " ", &con));
			first2->ptr = NULL;
		}
		q1 = first1;
		q2 = first2;
		while (*con != '\0') {
			n += 1;
			if (n % 2 == 1) {
				q1->ptr = new spisok;
				q1 = q1->ptr;
				strcpy_s(q1->str, 35, strtok_s(NULL, " ", &con));
			}
			else {
				q2->ptr = new spisok;
				q2 = q2->ptr;
				strcpy_s((q2->str), 35, strtok_s(NULL, " ", &con));
			}
		}
		q1->ptr = NULL;
		q2->ptr = NULL;

		// Вывод списков и одновременный подсчёт слов на букву "а"
		q1 = first1;
		cout << "List of odd words: ";
		while (q1 != NULL) {
			cout << q1->str << "          ";
			if ((*(q1->str) == 'A') || (*(q1->str) == 'a')) { cnt1 += 1; }
			q1 = q1->ptr;
		}
		cout << '\n';
		q2 = first2;
		cout << "List of even words: ";
		while (q2 != NULL) {
			cout << q2->str << "          ";
			if ((*(q2->str) == 'A') || (*(q2->str) == 'a')) { cnt2 += 1; }
			q2 = q2->ptr;
		}
		cout << '\n';

		//Сравнение количества слов на "а" в списках, вывод результата
		if (cnt1 != cnt2) {
			if (cnt1 > cnt2) { cout << "In list 1 there are more words begining with the letter <<a>>"; }
			else { cout << "In list 2 there are more words begining with the letter <<a>>"; }
		}
		else { cout << "The lists have the same number of words beginning with the letter <<a>>"; }

		//Освобождение памяти
		while (first1 != NULL) {
			q1 = first1->ptr;
			delete first1;
			first1 = q1;
		}
		while (first2 != NULL) {
			q2 = first2->ptr;
			delete first2;
			first2 = q2;
		}
	}
	else { cout << "Empty string"; }
}