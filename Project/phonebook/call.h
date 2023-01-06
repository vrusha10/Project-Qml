#ifndef CALL_H
#define CALL_H
#include<QSqlDatabase>
#include<QSettings>
#include<QObject>
#include <QMap>
#include <QDebug>

class call :public QObject
{
    Q_OBJECT
public:
    explicit call(QObject *parent = nullptr);
    call(const QString &path);
    ~call();

signals:
private :
  QSqlDatabase db;
public slots:
    bool createTable();
    bool isOpen() const;
    bool add(QString ,QString );
    bool remove(QString );
    bool personExists(QString );
    int check(int,int);
    int pop1();
    int pop2();

    bool deLete1(const QString & ,const QString &);
    bool deLete2(const QString & ,const QString &);
    QVector<QString> data();
    QVector<QString> contact();
    QMap<QString,QString>information();
    int check1();
};

#endif // CALL_H
