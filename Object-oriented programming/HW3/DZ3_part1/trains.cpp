#include "trains.h"

TTrain::TTrain() {
	int i;
	num = 0;
	for (i = 0; i < 65; i++)
		wagons[i] = nullptr;
}

TTrain::~TTrain() {
	int i;
	for (i = 0; (i < 65); i++) {
		if (wagons[i] == nullptr)
			break;
		delete wagons[i];
	}
}

void TTrain::Attash(int l, int c, const char* t) {
	if (num < 65) {
		wagons[num] = new TWagon(l, c, t);
		num++;
		std::cout << "Wagon is successfully attached...\n";
	}
	else std::cout << "The maximum number of wagons exceeded!\n"; 
}

void TTrain::Unhook() {
	if (num > 0) {
		num--;
		delete wagons[num];
		wagons[num] = nullptr;
		std::cout << "Wagon has been successfully unhooked...\n";
	}
	else std::cout << "There are no wagons on the train.\n";
}

void TTrain::Info() {
	int i;
	if (num > 0) {
		std::cout << "Info about train:\n" << "Total number of wagons: " << num <<
			"\nTotal load capacity: " << TotalLoadCap() << "\nNumber of filled wagons: " <<
			FilledWag() << "\nWagons:\n";
		for (i = 0; (i < 65); i++) {
			if (wagons[i] == nullptr)
				break;
			std::cout << i+1 << ":\n";
			wagons[i]->Info();
		}
	}
	else std::cout << "There are no wagons on the train.";
}

int TTrain::TotalLoadCap() {
	int i, lc = 0;
	for (i = 0; i < 65; i++) {
		if (wagons[i] == nullptr)
			break;
		lc += wagons[i]->GetLoadCap();
	}
	return lc;
}

int TTrain::FilledWag() {
	int i, cnt=0;
	for (i = 0; i < 65; i++) {
		if (wagons[i] == nullptr)
			break;
		if (wagons[i]->WagonLoad() > 50)
			cnt += 1;
	}
	return cnt;
}