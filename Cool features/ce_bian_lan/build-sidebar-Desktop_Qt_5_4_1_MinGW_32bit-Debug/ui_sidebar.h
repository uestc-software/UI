/********************************************************************************
** Form generated from reading UI file 'sidebar.ui'
**
** Created by: Qt User Interface Compiler version 5.4.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_SIDEBAR_H
#define UI_SIDEBAR_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_sidebar
{
public:

    void setupUi(QWidget *sidebar)
    {
        if (sidebar->objectName().isEmpty())
            sidebar->setObjectName(QStringLiteral("sidebar"));
        sidebar->resize(400, 300);

        retranslateUi(sidebar);

        QMetaObject::connectSlotsByName(sidebar);
    } // setupUi

    void retranslateUi(QWidget *sidebar)
    {
        sidebar->setWindowTitle(QApplication::translate("sidebar", "sidebar", 0));
    } // retranslateUi

};

namespace Ui {
    class sidebar: public Ui_sidebar {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_SIDEBAR_H
