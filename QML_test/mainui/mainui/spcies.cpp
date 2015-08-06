#include "spcies.h"
#include <QDebug>
#include <algorithm>

bool com(spcies a,spcies b)
{
    return a.name()<b.name();
}

spcies::spcies(const QString &name, const QString &data)
    : m_name(name), m_data(data)
{
}

QString spcies::name() const
{
    return m_name;
}

QString spcies::data() const
{
    return m_data;
}

spmodel::spmodel(QObject *parent)
    : QAbstractListModel(parent)
{
}

void spmodel::addsp(const spcies &sp)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_sp << sp;
    endInsertRows();
}

int spmodel::rowCount(const QModelIndex & parent) const {
    Q_UNUSED(parent);
    return m_sp.count();
}

QVariant spmodel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_sp.count())
        return QVariant();

    const spcies &sp = m_sp[index.row()];
    if (role == nameRole)
        return sp.name();
    else if (role == dataRole)
        return sp.data();
    return QVariant();
}
QHash<int, QByteArray> spmodel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[nameRole] = "name";
    roles[dataRole] = "data";
    return roles;
}

QString spmodel::getname(int index)
{
    return m_sp[index].name();
}
QString spmodel::getdata(int index)
{
    qDebug()<<index;
    return m_sp[index].data();
}

void spmodel::remove(int index)
{
    //qDebug()<<index;
    beginRemoveRows(QModelIndex(),index,index);
    m_sp.removeAt(index);
    endRemoveRows();
}

void spmodel::add(const QString name, const QString data)
{
    addsp(spcies(name,data));
}

void spmodel::sortitem()
{
    qDebug("sort");
    std::sort(m_sp.begin(),m_sp.end(),com);
    resetInternalData();
}
