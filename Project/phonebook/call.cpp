#include "call.h"
#include<QSqlDatabase>
#include<QSqlQuery>
#include<QSqlRecord>
#include<QSqlError>
#include<QDebug>
#include<QMap>
#include<QVector>
QMap<QString,QString>info;

int j=0,k=0,d=0,count=0;
call::call(QObject *parent)
    : QObject{parent}
{

}
call::call(const QString &path)
{
 db=QSqlDatabase::addDatabase("QSQLITE");
 db.setDatabaseName(path);
 if(!db.open())
 {
     qDebug()<<"error"<<"\n";
 }
 else
 {
     qDebug()<<"ok"<<"\n";
 }
}
call::~call()
{
    if(db.isOpen())
    {
        db.close();
    }
}
bool call::isOpen() const
{
    return db.isOpen();
}
bool call::createTable()
{
    bool success = false;

    QSqlQuery query;
    query.prepare("CREATE TABLE list(id INTEGER PRIMARY KEY, name TEXT,number TEXT);");

    if (!query.exec())
    {
        qDebug() << "Couldn't create the table 'list': one might already exist.";
        success = false;
    }

    return success;
}

bool call::add( QString name, QString number)
{
    bool success = false;
    qDebug()<<name;
   remove(name);
    if (!name.isEmpty()||!number.isEmpty())
    {
        QSqlQuery addQuery;
        addQuery.prepare("INSERT INTO list (name,number) VALUES (:name,:number) ");
        addQuery.bindValue(":name", name);
       addQuery.bindValue(":number",number);

        if(addQuery.exec())
        {
                success = true;
                 qDebug()<<"Added Sucessfully";
        }
        else
        {
            qDebug() << "Add Person failed: " << addQuery.lastError();
            return 0;
        }
    }
    else
    {
        qDebug() << "add person failed: name and number cannot be empty";
    }
    return success;
}


bool call::remove( QString name)
{
    bool success = false;

    if (personExists(name))
    {
        QSqlQuery deleteqQuery;
        deleteqQuery.prepare("DELETE FROM list WHERE name = (:name)");
        deleteqQuery.bindValue(":name", name);

        success = deleteqQuery.exec();

        if(!success)
        {
            qDebug() << "remove person failed: " << deleteqQuery.lastError();
        }
    }
    else
    {
        qDebug() << "remove person failed: person doesnt exist";
        j=1,k=1;
    }
    check(j,k);
    return success;
}

int call::check(int j,int k)
{
    if(j==1 && k==1)
    {
        ++j;
        ++k;
         qDebug()<<" Added";
    }
    else
    {
        qDebug()<<"Not Added ";
         j=0,k=0;
        return 0;
    }
}

int call::pop1()
{
   return j;
}

bool call::deLete1(const QString &name ,const QString &number)
{

    bool success = false;

    if (deLete2(name,number))
    {
        QSqlQuery queryDelete;
         queryDelete.prepare("DELETE FROM list WHERE (name,number) = (:name,:number)");
        queryDelete.bindValue(":name", name);
        queryDelete.bindValue(":number", name);
        success = queryDelete.exec();
        qDebug() << "Remove person";
        d=1;
        if(!success)
        {
            qDebug() << "remove person failed: " << queryDelete.lastError();
        }
    }
    else
    {
        qDebug() << "remove person failed: person doesnt exist";
    }

    return success;
}

bool call::deLete2(const QString &name,const QString &number)
{

    bool success = false;

    if (personExists(name))
    {
        QSqlQuery queryDelete;
         queryDelete.prepare("DELETE FROM list WHERE (name,number) = (:name,:number)");
        queryDelete.bindValue(":name", name);
        queryDelete.bindValue(":number", number);
        success = queryDelete.exec();
        qDebug() << "Remove person";
        d=0;
        if(!success)
        {
            qDebug() << "remove person failed: " << queryDelete.lastError();
        }
    }
    else
    {
        qDebug() << "remove person failed: person doesnt exist";
    }

    return success;
}

int call::pop2()
{
return d;
}

bool call::personExists(QString number)
{
    bool exists = false;

    QSqlQuery checkQuery;
    checkQuery.prepare("SELECT number FROM list WHERE number = (:number)");
    checkQuery.bindValue(":number", number);

    if (checkQuery.exec())
    {
        if (checkQuery.next())
        {
            exists = true;
          //  return 1;
        }
    }
    else
    {
        qDebug() << "person exists failed: " << checkQuery.lastError();
        return 0;
    }
 qDebug()<<exists;
 return exists;
}

int call::check1()
{
    return count;
}

QVector<QString> call::data()
{
    QVector<QString>v1;
    qDebug() << "Persons in db:";
    QSqlQuery print1Query("SELECT * FROM list");
    int idName = print1Query.record().indexOf("name");
    while (print1Query.next())
    {
        QString name = print1Query.value(idName).toString();

         v1.push_back(name);

    }
    for(auto i:v1)
        {
            qDebug()<<i;
        }
    return v1;
}

QVector<QString> call::contact()
{
    QVector<QString>v2;
       QSqlQuery print1Query("SELECT * FROM list");
   int idNumber = print1Query.record().indexOf("number");
   while (print1Query.next())
   {
       QString name = print1Query.value(idNumber).toString();

        v2.push_back(name);

   }
    for(auto i:v2)
        {
            qDebug()<<i;
        }
    return v2;
}

QMap<QString,QString> call::information()
{
    QMap<QString,QString>::iterator i;
   for(i=info.begin();i!=info.end();i++)
   {
   }
return info;
}
