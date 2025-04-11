TEMPLATE = app
TARGET = DZ3_part2
QT += gui widgets
CONFIG += c++11 debug_and_release
DEFINES += QT_DEPRECATED_WARNINGS

HEADERS += \
    area.h \
    letters.h \
    mainWin.h

SOURCES += \
    DZ3_part2.cpp \
    area.cpp \
    letters.cpp \
    mainWin.cpp
