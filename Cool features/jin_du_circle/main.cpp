#include "qlightboxwidget.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    QLightBoxWidget w;
    w.show();

    return a.exec();
}
