#include "test.h"
#include <test.h>
#include <QSqlError>
#include <QSqlRecord>
#include <QSqlQuery>
#include <QDebug>
   int j=0;
Test::Test(QObject *parent) : QObject(parent)
{

}

Test::Test(const QString &path)
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
   Test::~Test()
   {
       if(db.isOpen())
       {
           db.close();
       }
   }
   bool Test::isOpen() const
   {
       return db.isOpen();
   }
   bool Test::createTable()
   {
       bool success = false;

       QSqlQuery query;
       query.prepare("CREATE TABLE phonec(id INTEGER PRIMARY KEY, mobilen TEXT,nam TEXT);");
     //  query.prepare("CREATE TABLE phone(id INTEGER PRIMARY KEY, mobilen TEXT);");

       if (!query.exec())
       {
           qDebug() << "Couldn't create the table 'phonec': one might already exist.";
           success = false;
       }

       return success;
   }

   bool Test::addPerson(QString mobilen,QString nam)
   {
       qDebug()<<nam;
           removePerson(mobilen);

       bool success = false;

           if (!mobilen.isEmpty()||!nam.isEmpty())
       {
           QSqlQuery queryAdd;
           queryAdd.prepare("INSERT INTO phonec (mobilen,nam) VALUES (:mobilen,:nam)");
//            queryAdd.prepare("INSERT INTO phonec (mobilen) VALUES (:mobilen)");
           queryAdd.bindValue(":mobilen", mobilen);
           queryAdd.bindValue(":nam", nam);

           if(queryAdd.exec())
           {
               success = true;
               qDebug()<<"add succefully";

           }
           else
           {
               qDebug() << "add person failed: " << queryAdd.lastError();
           }
       }
       else
       {
           qDebug() << "add person failed: mobilen cannot be empty";
       }

       return success;




   }

   bool Test::personExists(const QString& mobilen) const
   {
       bool exists = false;

       QSqlQuery checkQuery;
       checkQuery.prepare("SELECT mobilen FROM phonec WHERE mobilen = (:mobilen)");
       checkQuery.bindValue(":mobilen", mobilen);

       if (checkQuery.exec())
       {
           if (checkQuery.next())
           {
               exists = true;
           }
       }
       else
       {
           qDebug() << "person exists failed: " << checkQuery.lastError();
       }

       return exists;
   }

   bool Test::removePerson(const QString& mobilen)
   {
       bool success = false;

       if (personExists(mobilen))
       {
           QSqlQuery queryDelete;
           queryDelete.prepare("DELETE FROM phonec WHERE mobilen = (:mobilen)");
           queryDelete.bindValue(":mobilen", mobilen);
           success = queryDelete.exec();

           if(!success)
           {
               qDebug() << "remove person failed: " << queryDelete.lastError();
           }
       }
       else
       {
           qDebug() << "remove person failed: person doesnt exist";
         j=1;
           check(j);

       }
        check(j);
       return success;
   }

   int Test::check(int j)
   {
       if(j==1)
       {
           qDebug()<<"added";
        ++j;
       }
       else
       {
           qDebug()<<"not added";
            j=0;
           return 0;
       }
   }


int Test::poping()
{
   return j;

}

