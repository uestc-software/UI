#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include <spcies.h>
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    spmodel data;
    data.add("1","lue");
    data.add("2","lue");
    data.add("3","lue");
    data.add("4","lue");
    data.add("5","lue");
    data.add("6","lue");
    data.add("7","lue");
    data.add("8","lue");
    engine.rootContext()->setContextProperty("unselected_sp",&data);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
