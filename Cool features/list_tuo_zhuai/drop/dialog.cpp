#include "dialog.h"
#include "ui_dialog.h"

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);
    listA = new ProjectListWidget;
    listB = new ProjectListWidget;

    listA->addItem("zy");
    listA->addItem("xiao min");
    listA->addItem("songsong");


    listB->addItem("akali");
    listB->addItem("teemo");
    listB->addItem("mangun");


//    buttonAToB->setText("->");
//    buttonBToA->setText("<-");

//    QVBoxLayout *buttonLayout = new QVBoxLayout;
//    buttonLayout->addWidget(buttonAToB);
//    buttonLayout->addWidget(buttonBToA);

    QHBoxLayout *hboxLayout = new QHBoxLayout;
    hboxLayout->addWidget(listA);
//    hboxLayout->addLayout(buttonLayout);
    hboxLayout->addWidget(listB);
    setLayout(hboxLayout);

    setFixedHeight( sizeHint().height() );

//    connect(listA, SIGNAL(on_listA_doubleClicked(const QModelIndex &index)),
//            this, SLOT(Move_A2B()));
//    connect(listB, SIGNAL(on_listB_doubleClicked(const QModelIndex &index)),
//            this, SLOT(Move_B2A()));
}

Dialog::~Dialog()
{
    delete ui;
}

//void Dialog::Move_A2B(const QModelIndex &index)
//{
//    this->listA->addItem(this->listB->currentItem()->text());
//    QListWidgetItem * item = this->listB->takeItem(this->listB->currentRow());
//    delete item;
//    this->listA->sortItems();
//}

//void Dialog::Move_B2A(const QModelIndex &index)
//{
//    this->listB->addItem(this->listA->currentItem()->text());
//    QListWidgetItem * item = this->listA->takeItem(this->listA->currentRow());
//    delete item;
//    this->listB->sortItems();
//}

