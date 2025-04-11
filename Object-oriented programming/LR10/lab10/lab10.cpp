#include <QApplication>
#include "mainWindow.h"

int main (int argc, char *argv[]){
    QApplication app(argc, argv);
    mainWin *mw = new mainWin();
    mw->show();
    return app.exec();
}
