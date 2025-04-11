#include "mainWin.h"
#include <QApplication>
int main(int argc, char *argv[])
{
    QApplication appl(argc, argv);
    mainWin win;
    win.show();
    return appl.exec();
}
