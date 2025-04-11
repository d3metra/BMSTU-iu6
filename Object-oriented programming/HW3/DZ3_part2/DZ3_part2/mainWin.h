#ifndef MAINWIN_H
#define MAINWIN_H

#include "area.h"
#include <QWidget>
#include <QPushButton>
#include <QSpinBox>
#include <QTextCodec>
#include <QLabel>

class mainWin: public QWidget {
    Q_OBJECT
public:
    mainWin(QWidget * parent = 0) ;
private:
    QArea *area;
    QPushButton *closeBtn;
    QSpinBox *speedBtn;
    QTextCodec *codec;
    QLabel *label;
private slots:
    void ChangeSpeed(int);
};

#endif // MAINWIN_H
