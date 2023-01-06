#include "timer.h"
#include<QDebug>
#include<QTimer>

//int n=0,n1=1;

Timer::Timer(QObject *parent): QObject(parent)
{
      connect(&time,&QTimer::timeout,this,&Timer::close);
      time.setInterval(5000);
}

void Timer::start()
{
     change="start";
     time.start();
}

void Timer::stop()
{
    change="stop";
        time.stop();
}
void Timer::close()
{

    change="timeout";
    emit final(QVariant(change));

}
