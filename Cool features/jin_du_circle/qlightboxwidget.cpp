#include "qlightboxwidget.h"
#include "ui_qlightboxwidget.h"
#include "blackwidget.h"
#include <QToolButton>
#include <QMouseEvent>

QLightBoxWidget::QLightBoxWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::QLightBoxWidget)
{
    ui->setupUi(this);
    this->setWindowFlags(Qt::FramelessWindowHint);    //无边框
    this->setWindowOpacity(0.95);                      //透明

    //构建最小化、最大化、关闭按钮
    int width = 400;
    QToolButton *minButton = new QToolButton(this);
    QToolButton *closeButton= new QToolButton(this);
    QPixmap minPix  = style()->standardPixmap(QStyle::SP_TitleBarMinButton);
    QPixmap closePix = style()->standardPixmap(QStyle::SP_TitleBarCloseButton);
    minButton->setIcon(minPix);
    closeButton->setIcon(closePix);
    minButton->setGeometry(width-46,5,20,20);
    closeButton->setGeometry(width-25,5,20,20);
    minButton->setStyleSheet("background-color:transparent;");
    closeButton->setStyleSheet("background-color:transparent;");
    connect(minButton, SIGNAL(clicked()), this, SLOT(showMinimized()));
    connect(closeButton, SIGNAL(clicked()), this, SLOT(close()));
}

QLightBoxWidget::~QLightBoxWidget()
{
    delete ui;
}

void QLightBoxWidget::on_showgif_clicked()
{
    blackwidget *i = new blackwidget(this);          //打开blackwidget
    i->show();
}

void QLightBoxWidget::mousePressEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton)
    {
      mouse_press = true;
      //鼠标相对于窗体的位置（或者使用event->globalPos() - this->pos()）
      move_point = event->pos();;
    }
}

void QLightBoxWidget::mouseMoveEvent(QMouseEvent *event)
{
    //若鼠标左键被按下
    if(mouse_press)
    {
        //鼠标相对于屏幕的位置
        QPoint move_pos = event->globalPos();

       //移动主窗体位置
       this->move(move_pos - move_point);
    }
}

void QLightBoxWidget::mouseReleaseEvent(QMouseEvent *event)
{
    //设置鼠标为未被按下
    mouse_press = false;
}

