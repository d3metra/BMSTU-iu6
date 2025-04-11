#ifndef AREA_H
#define AREA_H

#include "letters.h"
#include <QWidget>

class QArea: public QWidget {
private:
    int timer, speed;
public:
    QO_let *O;
    QC_let *C;
    QQ_let *Q;
    QArea(QWidget *parent = 0);
    ~QArea();
    void ChangeSpeed(int s);
protected:
    void paintEvent(QPaintEvent *event);
    void timerEvent(QTimerEvent *event);
    void showEvent(QShowEvent *event);
    void hideEvent(QHideEvent *event);
};

#endif // AREA_H
