#include "dashdb.h"
#include <QSqlQuery>
#include <QSqlError>
#include <QSqlRecord>
#include <QDebug>

dashdb::dashdb(const QString &path)
{
    d = QSqlDatabase::addDatabase("QSQLITE");
    d.setDatabaseName(path);

    if (!d.open())
    {
        qDebug() << "Error: connection with database fail";
    }
    else
    {
        qDebug() << "Database: connection ok";
    }
    createTable();
}

dashdb::dashdb(){}
dashdb::~dashdb()
{
    if (d.isOpen())
    {
        d.close();
    }
}

bool dashdb::isOpen() const
{
    return d.isOpen();
}
/********************************************Create Db Table************************************************/
bool dashdb::createTable()
{
    bool success = false;
    QSqlQuery query;
    query.prepare("CREATE TABLE DashBoard(id INTEGER PRIMARY KEY,Hour TEXT,Minute Text,Second TEXT);");
    query.prepare("CREATE TABLE DashDB(id INTEGER PRIMARY KEY, Person TEXT,Color TEXT,Niddle TEXT,Wallpaper TEXT,Dialog TEXT);");
    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'DashDB': one might already exist.";
        success = false;
    }
    return success;
}
/********************************************Create Db Table************************************************/

/********************************************Update Db Table************************************************/
void dashdb::update(QString Person, QString Color, QString Niddle, QString Wallpaper, QString Dialog)
{
    QSqlQuery query;
     query.prepare("UPDATE  DashDB SET Person = :Person, Color = :Color, Niddle = :Niddle, Wallpaper = :Wallpaper, Dialog = :Dialog WHERE  Person = :Person");
     query.bindValue(":Person",Person);
     query.bindValue(":Color",Color);
     query.bindValue(":Niddle",Niddle);
     query.bindValue(":Wallpaper",Wallpaper);
     query.bindValue(":Dialog",Dialog);
       if(!query.exec()){
           qDebug()<<query.lastError();
       }
       else {
           qDebug()<<"Update";
       }
}
/********************************************Update Db Table************************************************/


bool dashdb::dataExist(QString Person)
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT Person FROM DashDB WHERE Person = (:Person)");
    checkQuery.bindValue(":Person", Person);

    if (checkQuery.exec())
    {
        if (checkQuery.next())
        {
            exists = true;
        }
    }
    else
    {
        qDebug() << "DashDB exists failed: " << checkQuery.lastError();
    }
     qDebug()<<exists;
    return exists;
}

/********************************************Data add in Db Table************************************************/
void dashdb::addPerson( QString Person,QString Color,QString Niddle,QString Wallpaper,QString Dialog)
{
    bool success = false;
 if(dataExist(Person)==true)
 {
   update(Person,Color,Niddle,Wallpaper,Dialog);
 }
 else
 {
    if (!Person.isEmpty())
    {
        QSqlQuery queryAdd;
        queryAdd.prepare("INSERT INTO DashDB (Person,Color,Niddle,Wallpaper,Dialog) VALUES (:Person,:Color,:Niddle,:Wallpaper,:Dialog)");
        queryAdd.bindValue(":Person", Person);
        queryAdd.bindValue(":Color", Color);
        queryAdd.bindValue(":Niddle", Niddle);
        queryAdd.bindValue(":Wallpaper", Wallpaper);
        queryAdd.bindValue(":Dialog", Dialog);
        if(queryAdd.exec()){
            success = true;
        }
        else{
            qDebug() << "add DashDB failed: " << queryAdd.lastError();
        }
    }
    else{
        qDebug() << "add DashDB failed: name cannot be empty";
       }
    }
}
/********************************************Data Add in Db Table************************************************/

/********************************************Add Person Name in Db Table************************************************/
QList<QString> dashdb::accessPerson() const
{
    QList<QString>list;
    qDebug() << "DashDB in db:";
    QSqlQuery query("SELECT * FROM DashDB");
    int idName = query.record().indexOf("Person");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        list.append(name);
    }
    for(auto i:list)
        qDebug()<<i;
    return list;
  }
/********************************************Stored Person Name in Db Table************************************************/

/********************************************Stored Font Color in Db Table************************************************/
QList<QString>dashdb::accessColor ()const
{
    QList<QString>list1;
    qDebug() << "DashDB in db:";
    QSqlQuery query("SELECT * FROM DashDB");
    int idName = query.record().indexOf("Color");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        list1.append(name);
    }
    for(auto i:list1)
        qDebug()<<"--"<<i;
    return list1;
}
/********************************************Stored Font Color in Db Table************************************************/

/********************************************Stored Niddle Path in Db Table************************************************/
QList<QString> dashdb::accessNiddle() const
{
    QList<QString>list2;
    qDebug() << "DashDB in db:";
    QSqlQuery query("SELECT * FROM DashDB");
    int idName = query.record().indexOf("Niddle");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        list2.append(name);
    }
    for(auto i:list2)
        qDebug()<<"--"<<i;
    return list2;
}
/********************************************Stored Niddle Path in Db Table************************************************/

/********************************************Stored Wallpaper Path in Db Table************************************************/
QList<QString>dashdb::accessWallPaper ()const
{
    QList<QString>list3;
    qDebug() << "DashDB in db:";
    QSqlQuery query("SELECT * FROM DashDB");
    int idName = query.record().indexOf("Wallpaper");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        list3.append(name);
    }
    for(auto i:list3)
        qDebug()<<"--"<<i;
    return list3;
}
/********************************************Stored Wallpaper Path in Db Table************************************************/

/********************************************Stored Dialog Color in Db Table************************************************/
QList<QString>dashdb::accessDialog ()const
{
    QList<QString>list4;
    qDebug() << "DashDB in db:";
    QSqlQuery query("SELECT * FROM DashDB");
    int idName = query.record().indexOf("Dialog");
    while (query.next())
    {
        QString name = query.value(idName).toString();
        list4.append(name);
    }
    for(auto i:list4)
        qDebug()<<"--"<<i;
    return list4;
}
/********************************************Stored Dialog Color in Db Table************************************************/

/********************************************Add EngineTime Data in Db Table************************************************/
void dashdb::addEngineTime(QString s, QString m, QString h)
{
      qDebug()<<"hr"<<h<<"min"<<m<<"sec"<<s;

      bool success = false;
          QSqlQuery queryAdd;
          queryAdd.prepare("INSERT INTO DashBoard (Hour,Minute,Second) VALUES (:h,:m,:s)");
          queryAdd.bindValue(":h", h);
          queryAdd.bindValue(":m", m);
          queryAdd.bindValue(":s", s);

          if(queryAdd.exec()){
              success = true;
          }
          else{
              qDebug() << "add DashBoard failed: " << queryAdd.lastError();
          }
      }
/********************************************Add EngineTime Data in Db Table************************************************/

/********************************************Stored Second Data in Db Table************************************************/
int dashdb::accessSecond()
{
    qDebug() << "DashDB in db:";
     QString name;
    QSqlQuery query("SELECT * FROM DashBoard");
    int idName = query.record().indexOf("Second");

    while (query.next())
    {
         name = query.value(idName).toString();

    }
  int s=name.toInt();
    return s;
}
/********************************************Stored Second Data in Db Table************************************************/

/********************************************Stored Minutes Data in Db Table************************************************/
int dashdb::accessMinute()
{
    QString Minute;
   QSqlQuery query("SELECT * FROM DashBoard");

   int idName2=query.record().indexOf("Minute");
   while (query.next())
   {
        Minute = query.value(idName2).toString();
   }
   int m=Minute.toInt();
   return m;
}
/********************************************Stored Minutes Data in Db Table************************************************/

/********************************************Stored Hours Data in Db Table************************************************/
int dashdb::accessHour()
{
    QString Hour;
    QSqlQuery query("SELECT * FROM DashBoard");

    int idName2=query.record().indexOf("Hour");
    while (query.next())
    {
         Hour = query.value(idName2).toString();
    }
    int h=Hour.toInt();
    return h;
}
/********************************************Stored Hours Data in Db Table************************************************/
