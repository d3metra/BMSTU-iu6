#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QDialog>
#include "ui_mainWindow.h"
#include "container.h"

class mainWin: public QDialog, public Ui::mainWindow {
    Q_OBJECT
public:
        QContainer * con;
        QContainerPlus * conp;
        mainWin(QWidget * parent = 0);
private slots:
        void Print();
        void ArithmMean();
        void CheckEl();
        void AddNewEl();
        void DeleteEl();
};

#endif // MAINWINDOW_H
