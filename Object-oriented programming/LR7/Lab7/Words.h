#ifndef Words_h
#define Words_h
#include <iostream>
#include <string.h>

class TWord {
private:
	char* w;
	int length;
public:
	void Init(const char* aw);
	int VowelCnt();
	void Info() {
		std::cout << "The word in the object: " << w << '\n' << "Word length: " << length << '\n'
			<< "The number of vowels in a word:" << VowelCnt();
	}
	~TWord() {
		delete[] w;
	}
};

class TWord_cnst {
private:
	char* w;
	int length;
public:
	TWord_cnst(const char* aw);
	int VowelCnt();
	void Info() {
		std::cout << "The word in the object: " << w << '\n' << "Word length: " << length << '\n'
			<< "The number of vowels in a word: " << VowelCnt();
	}
	~TWord_cnst() {
		delete[] w;
	}
};
#endif