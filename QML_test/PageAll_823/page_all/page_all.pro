TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp \
    organismhdl.cpp \
    clusterhdl.cpp \
    maincontroller.cpp \
    ogcontroller.cpp \
    serverconnector.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    organismhdl.h \
    clusterhdl.h \
    maincontroller.h \
    ogcontroller.h \
    serverconnector.h
