#include "ha.h"
#include "ui_ha.h"
#include <QPropertyAnimation>
#include <QTimer>
ha::ha(QWidget *parent) :
    QStackedWidget(parent),
    ui(new Ui::ha)
{
    ui->setupUi(this);
    QRect a(0,0,0,this->height());
    QRect b(0,0,this->width(),this->height());
    a_chuxian=new QPropertyAnimation(this,"geometry");
    a_xiaoshi=new QPropertyAnimation(this,"geometry");

    a_chuxian->setDuration(1000);
    a_chuxian->setStartValue(a);
    a_chuxian->setEndValue(b);

    a_xiaoshi->setDuration(1000);
    a_xiaoshi->setStartValue(b);
    a_xiaoshi->setEndValue(a);
}

ha::~ha()
{
    delete ui;
}

void ha::on_pushButton_clicked()
{
    this->xiaoshi();
    //QTimer t;
    //t.singleShot(1100,changeto0);
    //this->chuxian();
}

void ha::on_pushButton_2_clicked()
{
    this->xiaoshi();
    //t.singleShot(1100,changeto1);
    //QTimer::singleShot(1200,changeto1);
    //this->chuxian();
}

void ha::chuxian()
{
    a_chuxian->start();
}
void ha::xiaoshi()
{
    a_xiaoshi->start();
}

void ha::changeto1()
{
    this->setCurrentIndex(1);
}

void ha::changeto0()
{
    this->setCurrentIndex(0);
}

