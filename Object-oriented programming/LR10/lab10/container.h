#ifndef CONTAINER_H
#define CONTAINER_H

#include <QTextEdit>

class QElement {
public:
    QElement *prev, *next;
    QElement(){prev = next = nullptr;};
    virtual ~QElement(){};
    virtual float GetNum() = 0;
    virtual void Print(QTextEdit * out) = 0;
};

class QContainer {
protected:
    QElement *first, *current, *last;
public:
    QContainer(){first = current = last = nullptr;};
    ~QContainer();
    void AllPrint(QTextEdit * out);
    int AddNew(QElement *e);
    int CheckEl(QElement *e);
    int Delete(QElement *e);
};

class QContainerPlus: public QContainer {
public:
    QContainerPlus(): QContainer(){};
    ~QContainerPlus(){};
    float ArithmMean();
};

class QInt: public QElement {
private:
    int num;
public:
    QInt(int n): QElement(), num(n){};
    ~QInt(){};
    float GetNum() override;
    void Print(QTextEdit * out) override;
};

class QFloat: public QElement {
private:
    float num;
public:
    QFloat(float n): QElement(), num(n){};
    ~QFloat(){};
    float GetNum() override;
    void Print(QTextEdit * out) override;
};

#endif // CONTAINER_H
