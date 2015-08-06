#include <QAbstractListModel>
#include <QStringList>

class spcies
{
public:
    spcies(const QString &name, const QString &data);
//![0]

    QString name() const;
    QString data() const;

private:
    QString m_name;
    QString m_data;
};

class spmodel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum sproles {
        nameRole = Qt::UserRole + 1,
        dataRole
    };

    spmodel(QObject *parent = 0);



    int rowCount(const QModelIndex & parent = QModelIndex()) const;

    QVariant data(const QModelIndex & index, int role = Qt::DisplayRole) const;


protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<spcies> m_sp;

public slots:
    QString getname(int index);
    QString getdata(int index);
    void addsp(const spcies &sp);
    void add(const QString name,const QString data);
    void remove(int index);
    void sortitem();
};
