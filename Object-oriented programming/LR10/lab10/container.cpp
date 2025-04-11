#include "container.h"
#include "mainWindow.h"
#include <QString>

QContainer::~QContainer() {
    while (first != nullptr) {
        current = first->next;
        delete first;
        first = current;
    }
}

void QContainer::AllPrint(QTextEdit * out) {
    current = first;
    while (current != nullptr) {
        current->Print(out);
        current=current->next;
    }
}

int QContainer::AddNew(QElement *e) {
    if (!CheckEl(e)) {
        if (first == nullptr) {
            first = last = e;
        }
        else {
            last->next = e;
            e->prev = last;
            last = e;
        }
        return 0;
    }
    else return 1;
}

int QContainer::CheckEl(QElement *e) {
    bool flag = 0;
    current = first;
    while ((current != nullptr) && (!flag)) {
        if (e->GetNum() == current->GetNum()) {
            flag = 1;
        }
        current = current->next;
    }
    if (!flag)
        return 0;
    return 1;
}

int QContainer::Delete(QElement *e) {
    current = first;
    while ((current != nullptr) && (current->GetNum() != e->GetNum()))
        current = current->next;
    if (current != nullptr) {
        if ((current == first) && (current == last)) {
            delete first;
            first = last = nullptr;
            return 0;
        }
        else if (current == first) {
            current = first->next;
            delete first;
            first = current;
            first->prev = nullptr;
            return 0;
        }
        else if (current == last) {
            current = last->prev;
            delete last;
            last = current;
            last->next = nullptr;
            return 0;
        }
        else {
            QElement *wor;
            wor = current;
            current = current->prev;
            current->next = wor->next;
            wor->next->prev = current;
            delete wor;
            return 0;
        }
    }
    else return 1;
}

float QContainerPlus::ArithmMean() {
    float mean = 0, trash;
    int cnt = 0;
    current = first;
    while (current != nullptr) {
        if (modff(current->GetNum(), &trash) == 0) {
            cnt ++;
            mean += current->GetNum();
        }
        current = current->next;
    }
    if (cnt != 0) {
        mean /= cnt;
        return mean;
    }
    else return 0;
}

float QInt::GetNum() {
    return num;
}

void QInt::Print(QTextEdit * out) {
    QString str;
    str.setNum(num);
    out->append(str + "   ");
}

float QFloat::GetNum() {
    return num;
}

void QFloat::Print(QTextEdit * out) {
    QString str;
    str.setNum(num);
    out->append(str + "   ");
}
