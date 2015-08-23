#include "organismhdl.h"
#include "qdebug.h"

OrganismHdl::OrganismHdl(QObject *parent) : QObject(parent)
{
    prepareOgMap();
}

bool OrganismHdl::validateId(QString id)
{
    if(ogMap.values().contains(id)) {
        return true;
    }else {
        return false;
    }
}

bool OrganismHdl::validateName(QString name)
{
    if(ogMap.keys().contains(name)) {
        return true;
    }else {
        return false;
    }

}

void OrganismHdl::outputOg()
{
    for(int i = 0; i < selOg.count(); i++) {
        qDebug() << selOg.at(i);
    }
}

QList<QString> OrganismHdl::getSelOg()
{
    return selOg;
}

QString OrganismHdl::tran2Name(QString id)
{
    if(validateId(id)) {
        return ogMap.key(id);
    }else {
        return "null";
    }
}

QString OrganismHdl::tran2ID(QString name)
{
    if(validateName(name)) {
        return ogMap.value(name);
    }else {
        return "null";
    }
}

int OrganismHdl::add2SelOg(QString id)
{
    if(validateId(id) && !selOg.contains(id)) {
        selOg.append(id);
        return 1;
    }else {
        return 0;
    }
}

int OrganismHdl::delFromSelOg(QString id)
{
    if(validateId(id) && selOg.contains(id)) {
        selOg.removeOne(id);
        return 1;
    }else {
        return 0;
    }
}

void OrganismHdl::clear()
{
    selOg.clear();
}

void OrganismHdl::prepareOgMap()
{
    ogMap.clear();
    ogMap.insert(QString("aci"), QString("01"));
    ogMap.insert(QString("bsu"), QString("02"));
    ogMap.insert(QString("eco"), QString("03"));
    ogMap.insert(QString("ftn"), QString("04"));
    ogMap.insert(QString("hin"), QString("05"));
    ogMap.insert(QString("hpy"), QString("06"));
    ogMap.insert(QString("mge"), QString("07"));
    ogMap.insert(QString("mpu"), QString("08"));
    ogMap.insert(QString("mtu"), QString("09"));
    ogMap.insert(QString("pau"), QString("10"));
    ogMap.insert(QString("sao"), QString("11"));
    ogMap.insert(QString("spr"), QString("12"));
    ogMap.insert(QString("spu"), QString("13"));
    ogMap.insert(QString("stm"), QString("14"));
    ogMap.insert(QString("stt"), QString("15"));
    ogMap.insert(QString("vch"), QString("16"));
}
