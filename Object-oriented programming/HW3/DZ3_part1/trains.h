#ifndef TRAINS_h
#define TRAINS_h

#include <string>
#include <iostream>

class TWagon {
private:
	int load_capacity, cargo_weight;
	char* cargotype;
public:
	TWagon() {
		load_capacity = 0;
		cargo_weight = 0;
		cargotype = nullptr;
	}
	TWagon(int l, int c, const char* t) {
		Init(l, c, t);
	}
	~TWagon() { delete [] cargotype; }
	void Init(int l, int c, const char* t) {
		load_capacity = l;
		cargo_weight = c;
		if (cargotype != nullptr)
			delete[] cargotype;
		cargotype = new char[sizeof(t) + 1];
		strcpy_s(cargotype, sizeof(t)+1, t);
	}
	int GetLoadCap() {
		return load_capacity;
	}
	int GetCargoWeight() {
		return cargo_weight;
	}
	char* GetCargoType() {
		return cargotype;
	}
	float WagonLoad() {
		return (float)cargo_weight / (float)load_capacity * 100;
	}
	void Info() {
		std::cout << "Info about wagon:\n" << "Cargo type: " << cargotype << "\nLoad capacity: " << load_capacity <<
			"\nCargo weight: " << cargo_weight << "\nWagon load(%):" << WagonLoad() << "\n-------\n";
	}
};

class TTrain {
private:
	int num;
	TWagon* wagons[65];
public:
	TTrain();
	~TTrain();
	void Attash(int l, int c, const char* t);
	void Unhook();
	void Info();
	int TotalLoadCap();
	int FilledWag();
};

#endif
