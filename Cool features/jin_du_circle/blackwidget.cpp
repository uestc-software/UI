#include "blackwidget.h"
#include "ui_blackwidget.h"
#include <QMovie>

blackwidget::blackwidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::blackwidget)
{
    ui->setupUi(this);

    int width = parent->width();
    this->resize(width, parent->height());              //设置blackwidget大小
    this->setWindowFlags(Qt::FramelessWindowHint);      //设置标题栏隐藏
    QPalette palette;                                   //设置背景色透明
    QColor color(0, 0, 0);
    color.setAlphaF(0.8);
    palette.setBrush(this->backgroundRole(), color);
    this->setPalette(palette);
    this->setAutoFillBackground(true);

    progressMovie = new QMovie(":/loader.gif");         //加载gif图
    ui->lbProgress->setMovie(progressMovie);
    progressMovie->start();
}

blackwidget::~blackwidget()
{
    delete ui;
}

void blackwidget::on_stopgif_clicked()
{
    this->hide();       //隐藏blackwidget
}
