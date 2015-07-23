#include "sidebar.h"
#include <QApplication>
#include <QtWidgets/QApplication>
#include <QIcon>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    SideBar w;
    w.addAction("Library", QIcon("/icon/example.ong"));
    w.addAction("Actors");
    w.addAction("Directors");
    w.addAction("Genres");
    w.addAction("Countries");
    w.addAction("Tags");
    w.show();

    return a.exec();
}
