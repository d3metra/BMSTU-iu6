#include <iostream>
#include "trains.h"

int main()
{
    using namespace std;
    int lc, cw;
    char ct[50];
    //Работа с объектом класса TWagon
    cout << "<< Working with an object of the TWagon class >>\n";
    TWagon w;
    cout << "Enter the wagon's load capacity, weight and type of cargo: ";
    cin >> lc >> cw >> ct;
    w.Init(lc, cw, ct);
    w.Info();

    //Работа с объектом класса TTrain
    cout << "\n<< Working with an object of the TTrain class >>\n";
    TTrain t;
    int choice;
    while (true) {
        cout << "1. Attach wagon to the train\n" <<
            "2. Unhook wagon from the train\n" <<
            "3. Print information about the train\n" <<
            "0. End the program\n" <<
            "\nEnter a number -> ";
        cin >> choice;
        switch (choice) {
        case 1: {
            cout << "Enter the wagon's load capacity, weight and type of cargo: ";
            cin >> lc >> cw >> ct;
            t.Attash(lc, cw, ct);
            break;
        }
        case 2: {
            t.Unhook();
            break;
        }
        case 3: {
            t.Info();
            break;
        }
        case 0: {
            return 0;
        }
        default: cout << "Wrong option!\n\n";
        }
    }
}
