#ifndef Chess_h
#define Chess_h

enum class Color {NoColor, White, Black};
struct Coordinate {char letter; int num;};

class TChessPiece {
protected:
	Color clr;
	Coordinate crd;
public:
	TChessPiece();
	void Init(Color aclr, char l, int n);
	void Info();
	void CheckColor();
};

class TBishop:public TChessPiece {
public:
	void CheckPos(char l, int n);
};
#endif 