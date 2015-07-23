#ifndef QLIGHTBOXWIDGET_H
#define QLIGHTBOXWIDGET_H

#include <QWidget>

namespace Ui {
class QLightBoxWidget;
}

class QLightBoxWidget : public QWidget
{
    Q_OBJECT

public:
    explicit QLightBoxWidget(QWidget *parent = 0);
    ~QLightBoxWidget();

private slots:
    void on_showgif_clicked();

private:
    Ui::QLightBoxWidget *ui;

    QPoint move_point; //移动的距离
    bool mouse_press; //鼠标按下
    void mousePressEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
};

#endif // QLIGHTBOXWIDGET_H
