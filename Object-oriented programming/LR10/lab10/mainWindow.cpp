#include "mainWindow.h"

mainWin::mainWin(QWidget * parent): QDialog(parent) {
    setupUi(this);
    connect(printButton, SIGNAL(clicked()), this, SLOT(Print()));
    connect(armeanButton, SIGNAL(clicked()), this, SLOT(ArithmMean()));
    connect(checkButton, SIGNAL(clicked()), this, SLOT(CheckEl()));
    connect(addButton, SIGNAL(clicked()), this, SLOT(AddNewEl()));
    connect(delButton, SIGNAL(clicked()), this, SLOT(DeleteEl()));
    con = new QContainer();
    conp = new QContainerPlus();
}

void mainWin::Print(){
    output->append("Содержимое множества:");
    con->AllPrint(output);
    output->append("-------------");
}

QString str;

void mainWin::ArithmMean() {
//    *conp = *con;
    str.setNum(conp->ArithmMean());
    output->append("Среднее арифметическое целых чисел: " + str);
}

void mainWin::CheckEl() {
    int res;

    str = inputLine->text();
    if (str != "") {
        if (str.indexOf(".") != -1) {
             QFloat *f = new QFloat(str.toFloat());
             res = con->CheckEl(f);
        }
        else {
            QInt *i = new QInt(str.toInt());
            res = con->CheckEl(i);
        }
        if (res) {
            output->append("Данный элемент входит в множество");
        }
        else output->append("Данный элемент отсутствует в множестве");
    }
    else output->append("Введена пустая строка");
    inputLine->clear();
}

void mainWin::AddNewEl() {
    str = inputLine->text();
    if (str != "") {
        if (str.indexOf(".") != -1) {
             QFloat *f = new QFloat(str.toFloat()), *fp = new QFloat(str.toFloat());
             if (!(con->AddNew(f))) {
                 conp->AddNew(fp);
                 output->append("Элемент успешно добавлен");
             }
             else output->append("Элемент уже входит во множество");
        }
        else {
            QInt *i = new QInt(str.toInt()), *ip = new QInt(str.toInt());
            if (!(con->AddNew(i))) {
                conp->AddNew(ip);
                output->append("Элемент успешно добавлен");
            }
            else output->append("Элемент уже входит во множество");
        }
    }
    else output->append("Введена пустая строка");
    inputLine->clear();
}

void mainWin::DeleteEl() {
    str = inputLine->text();
    if (str != "") {
        if (str.indexOf(".") != -1) {
             QFloat *f = new QFloat(str.toFloat());
             if (!(con->Delete(f))) {
                 conp->Delete(f);
                 output->append("Элемент успешно удалён");
             }
             else output->append("Элемент не найден");
        }
        else {
            QInt *i = new QInt(str.toInt());
            if (!(con->Delete(i))) {
                conp->Delete(i);
                output->append("Элемент успешно удалён");
            }
            else output->append("Элемент не найден");
        }
    }
    else output->append("Введена пустая строка");
    inputLine->clear();
}
