#ifndef TIMER_H
#define TIMER_H

#include<QObject>
#include<QTimer>
#include<QVariant>
class Timer:public QObject
{
    Q_OBJECT
public:
    explicit Timer(QObject *parent =nullptr);

signals:
     void final(QVariant d);
public slots:
    void start();
    void stop();
    void close();

private:
    QTimer time;
    QString change;
};

#endif // TIMER_H
