#ifndef BLACKWIDGET_H
#define BLACKWIDGET_H

#include <QWidget>
#include <QMovie>

namespace Ui {
class blackwidget;
}

class blackwidget : public QWidget
{
    Q_OBJECT

public:
    explicit blackwidget(QWidget *parent = 0);
    ~blackwidget();

private slots:
    void on_stopgif_clicked();

private:
    Ui::blackwidget *ui;
    QMovie* progressMovie;
};

#endif // BLACKWIDGET_H
