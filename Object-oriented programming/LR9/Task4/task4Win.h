#ifndef _task_4_h_
#define _task_4_h_

#include <QDialog>
#include <QLineEdit>
#include <QPushButton>
#include <QTextEdit>

enum reg {UP, DOWN};
class MainWindow : public QDialog
{
    Q_OBJECT
public:
    MainWindow(QWidget * parrent = 0);
    virtual ~MainWindow() {};
protected:
   QLineEdit * inputLine;
   QPushButton *convertBtn;
   QTextEdit *output;
   reg regtype;
private slots:
   void write();
   void convert();
};

#endif
