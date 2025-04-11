#include "Words.h"

void TWord::Init(const char* aw) {
	w = new char[strlen(aw) + 1];
	strcpy_s(w, strlen(aw) + 1, aw);
	length = strlen(w);
}

int TWord::VowelCnt() {
	char Vowels[] = "AaEeIiUuYyOo";
	int i, cnt = 0;
	for (i = 0; i < length; i++) {
		if (strchr(Vowels, *(w + i)))
			cnt += 1;
	}
	return cnt;
}

TWord_cnst::TWord_cnst(const char* aw) {
	w = new char[strlen(aw) + 1];
	strcpy_s(w, strlen(aw) + 1, aw);
	length = strlen(w);
};

int TWord_cnst::VowelCnt() {
	char Vowels[] = "AaEeIiUuYyOo";
	int i, cnt = 0;
	for (i = 0; i < length; i++) {
		if (strchr(Vowels, *(w + i)))
			cnt += 1;
	}
	return cnt;
}