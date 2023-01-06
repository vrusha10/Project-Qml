#ifndef TEST_H
#define TEST_H

#include <QSqlDatabase>
#include <QObject>
#include <QDebug>
#include <QSettings>
class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);

    Test(const QString &path);
    ~Test();
    bool createTable();

    bool isOpen() const;

    //Normal function


signals:

public slots:
    bool addPerson(QString ,QString);
     bool personExists(const QString& ) const;
        bool removePerson(const QString &);
int check(int);
int poping();

private:
       QSqlDatabase db;

};

#endif // TEST_H
