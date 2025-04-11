#include "letters.h"

void QLetter::Move(int u, QPainter *painter) {
    switch (mm) {
    case Down: {
        if (y < 120)
            y += u;
        else mm = Up;
        break;
    }
    case Up: {
        if (y > 5)
            y -= u;
        else mm = Down;
        break;
    }
    }
    Draw(painter);
}

void QO_let::Draw(QPainter *painter) {
    painter->drawEllipse(x, y, 40, 75);
}

void QC_let::Draw(QPainter *painter) {
    painter->drawArc(x, y, 35, 75, 85*16, 200*16);
}

void QQ_let::Draw(QPainter *painter) {
    painter->drawEllipse(x, y, 45, 75);
    painter->drawLine(x+23, y+74, x+33, y+80);
    painter->drawLine(x+33, y+80, x+23, y+77);
    painter->drawLine(x+23, y+77, x+23, y+74);
}
