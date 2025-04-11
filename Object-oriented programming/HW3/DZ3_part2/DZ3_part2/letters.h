#ifndef LETTERS_H
#define LETTERS_H

#include <QPainter>

enum MoveMode {Down, Up};

class QLetter {
protected:
    int x, y;
    MoveMode mm;
public:
    QLetter() {
        x = y = 0;
        mm = Down;
    }
    QLetter(int ax, int ay, MoveMode amm) {
        x = ax;
        y = ay;
        mm = amm;
    }
    virtual ~QLetter(){};
    void Move(int u, QPainter *painter);
    virtual void Draw(QPainter *painter) = 0;
};

class QO_let: public QLetter {
public:
    QO_let(int ax, int ay, MoveMode amm) :
        QLetter(ax, ay, amm) {};
    ~QO_let(){};
    void Draw(QPainter *painter) override;
};

class QC_let: public QLetter {
public:
    QC_let(int ax, int ay, MoveMode amm) :
        QLetter(ax, ay, amm) {};
    ~QC_let(){};
    void Draw(QPainter *painter) override;
};

class QQ_let: public QLetter {
public:
    QQ_let(int ax, int ay, MoveMode amm) :
        QLetter(ax, ay, amm) {};
    ~QQ_let(){};
    void Draw(QPainter *painter) override;
};

#endif // LETTERS_H
