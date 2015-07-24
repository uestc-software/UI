#ifndef HA_H
#define HA_H

#include <QStackedWidget>
#include <QPropertyAnimation>
namespace Ui {
class ha;
}

class ha : public QStackedWidget
{
    Q_OBJECT

public:
    explicit ha(QWidget *parent = 0);
    ~ha();

private slots:
    void on_pushButton_clicked();
    void chuxian();
    void xiaoshi();
    void on_pushButton_2_clicked();
    void changeto0();
    void changeto1();
private:
    Ui::ha *ui;
    QPropertyAnimation *a_xiaoshi, *a_chuxian;
};

#endif // HA_H
