TEMPLATE = app
TARGET = lab10
QT += gui widgets
CONFIG += c++11 debug_and_release
DEFINES += QT_DEPRECATED_WARNINGS

#Input
SOURCES += \
    container.cpp \
    lab10.cpp \
    mainWindow.cpp

HEADERS += \
    container.h \
    mainWindow.h

FORMS += \
    mainWindow.ui
