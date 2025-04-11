#include "area.h"
#include <QTimerEvent>

QArea::QArea(QWidget *parent): QWidget(parent) {
    setFixedSize(QSize(300,200));
    QPainter painter(this);
    O = new QO_let(10, 50, Up);
    O->Draw(&painter);
    C = new QC_let(110, 50, Down);
    C->Draw(&painter);
    Q = new QQ_let(210, 50, Up);
    Q->Draw(&painter);
    speed = 0;
}

QArea::~QArea() {
    delete O;
    delete C;
    delete Q;
}

void QArea::paintEvent(QPaintEvent *)
{
    QPainter painter(this);
    painter.setPen(QPen(Qt::black, 3));
    O->Move(speed, &painter);
    C->Move(speed, &painter);
    Q->Move(speed, &painter);
}

void QArea::timerEvent(QTimerEvent *event)
{
    if (event->timerId() == timer)
    {
       update();
    }
    else
       QWidget::timerEvent(event);
}

void QArea::showEvent(QShowEvent *)
{
    timer=startTimer(10);
}

void QArea::hideEvent(QHideEvent *)
{
    killTimer(timer);
}

void QArea::ChangeSpeed(int s) {
    speed = s;
}
