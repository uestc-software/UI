#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "ha.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ha *a=new ha(this);
    a->show();
}

MainWindow::~MainWindow()
{
    delete ui;
}
