#ifndef TEST_H
#define TEST_H


#include <QObject>
#include <QDebug>

class Test : public QObject
{
    Q_OBJECT
public:
    explicit Test(QObject *parent = nullptr);

    //Normal function


signals:

public slots:

   int add(QString);
   int mul(QString);
   int divis(QString);
   int sub(QString);
   void clear();
};
#endif // TEST_H
