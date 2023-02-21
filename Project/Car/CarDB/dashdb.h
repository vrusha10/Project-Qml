#pragma once

#include<iostream>
#include<QString>
#include<QSqlDatabase>
#include<QObject>
using namespace std;


class dashdb:public QObject
{
    Q_OBJECT
public:
    dashdb(const QString& path);
    dashdb();
    ~dashdb();
    bool isOpen() const;
    bool createTable();
    bool createTable2();
    void update( QString,QString,QString,QString,QString);
    bool dataExist(QString);
//    bool removeAllPersons();


public slots:

   QList<QString>accessColor ()const;
   QList<QString>accessPerson() const;
   QList<QString>accessNiddle() const;
   QList<QString>accessWallPaper()const;
   QList<QString>accessDialog ()const;
   void addPerson( QString,QString,QString,QString,QString);
   void addEngineTime(QString,QString,QString);
   int accessSecond();
   int accessMinute();
   int accessHour();
//   bool personExists(QString,QString) const;

private:

   QSqlDatabase  d;
};

