#include <QVBoxLayout>
#include "task4Win.h"

MainWindow::MainWindow(QWidget * parrent){
    QVBoxLayout *mainLayout = new QVBoxLayout();
    inputLine = new QLineEdit();
    mainLayout->addWidget(inputLine);
    convertBtn = new QPushButton("Convert");
    convertBtn->setFocusPolicy(Qt::NoFocus);
    mainLayout->addWidget(convertBtn);
    output = new QTextEdit();
    output->setReadOnly(true);
    mainLayout->addWidget(output);
    setLayout(mainLayout);
    connect(inputLine, SIGNAL(editingFinished()), this, SLOT(write()));
    connect(convertBtn, SIGNAL(clicked()), this, SLOT(convert()));
    regtype = UP;
}

void MainWindow::write() {
    output->append("Input: " + inputLine->text());
}

void MainWindow::convert() {
    switch (regtype)
    {
    case UP:
    {
        output->append("ALL UPPER: " + inputLine->text().toUpper());
        regtype = DOWN;
        break;
    }
    case DOWN:
    {
        output->append("all lower: " + inputLine->text().toLower());
        regtype = UP;
    }
    }
}
