#include "mainWin.h"
#include <QVBoxLayout>

mainWin::mainWin(QWidget * parent): QWidget(parent) {
    codec = QTextCodec::codecForName("UTF-8");
    this->setWindowTitle("Буквы-Побегуквы");
    label = new QLabel(codec->toUnicode("Скорость"), this);
    area = new QArea(this);
    speedBtn = new QSpinBox;
    speedBtn->setMaximum(3);
    speedBtn->setMinimum(0);
    connect(speedBtn, SIGNAL(valueChanged(int)), this, SLOT(ChangeSpeed(int)));
    closeBtn = new QPushButton(codec->toUnicode("Закрыть приложение"), this);
    connect(closeBtn, SIGNAL(clicked()), this, SLOT(close()));
    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->addWidget(label);
    layout->addWidget(speedBtn);
    layout->addWidget(area);
    layout->addWidget(closeBtn);
}

void mainWin::ChangeSpeed(int i) {
    area->ChangeSpeed(i);
}
