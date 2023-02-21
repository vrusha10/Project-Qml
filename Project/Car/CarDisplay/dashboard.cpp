#include "dashboard.h"
#include <QDebug>
#include <QTimer>
#include"dashdb.h"

QTimer s,r,t,f,b,et,eri;
int park=0;
dashdb obj;

dashboard::dashboard(QObject *parent)
    : QObject{parent}
{
    connect(&s,&QTimer::timeout,this,dashboard::emitspeed);
    connect(&r,&QTimer::timeout,this,dashboard::emitrpm);
    connect(&t,&QTimer::timeout,this,dashboard::emittemp);
    connect(&f,&QTimer::timeout,this,dashboard::emitfuel);
    connect(&b,&QTimer::timeout,this,dashboard::emitbattery);
    connect(&et,&QTimer::timeout,this,dashboard::emitEngineTime);
}
/*******************************Set Timer**********************************/
void dashboard::emitspeed()
{
    static int es=84;
    es=es+9;
   emit notifyVehicleSpeed(es);
}

void dashboard::emitrpm()
{
    static int er=82;
    er=er+1;
    emit notifyRpm(er);
}

void dashboard::emittemp()
{
    static int et=122;
    et=et+1;
    emit notifyOutsideTemp(et);
}

void dashboard::emitfuel()
{
    static int ep=122;
    ep=ep+1;
    emit notifyFuelLevel(ep);
}

void dashboard::emitbattery()
{
    static int eb=0;
    eb=eb+1;
    emit notifyBattery(eb);
}

void dashboard::emitEngineTime()
{
    static int ecr=0;
    ecr=ecr+1;
    emit notifyEngineTime(ecr);
}
/*******************************Set Timer**********************************/

/*******************************Stop Timer**********************************/
void dashboard::stopspeed()
{
    s.stop();
}

void dashboard::stoprpm()
{
    r.stop();
}

void dashboard::stoptemp()
{
    t.stop();
}

void dashboard::stopfuel()
{
    f.stop();
}

void dashboard::stopbattery()
{
    b.stop();
}

void dashboard::stopEngineTime()
{
    et.stop();
}
/*******************************Stop Timer**********************************/

void dashboard::parking()
{
    qDebug()<<"Parking";
 }

void dashboard::horn()
{
    qDebug()<<"Horn Test";
}

void dashboard::get(QString p0)
{
    emitColor(p0);
}

void dashboard::get1(QString p1)
{
    emitColor1(p1);
}

void dashboard::get2(QString p2)
{
    emitColor2(p2);
}

void dashboard::get3(QString p3)
{
    emitColor3(p3);
}

void dashboard::get4(QString p4)
{
   emitColor4(p4);
}

void dashboard::niddle1(QString n1)
{
    emitNiddle1(n1);
}

void dashboard::niddle2(QString n2)
{
    emitNiddle2(n2);
}

void dashboard::niddle3(QString n3)
{
    emitNiddle3(n3);
}

void dashboard::niddle4(QString n4)
{
    emitNiddle4(n4);
}

void dashboard::niddle5(QString n5)
{
    emitNiddle5(n5);
}

void dashboard::wallpaper1(QString w1)
{
   emitWallpaper1(w1);
}

void dashboard::wallpaper2(QString w2)
{
   emitWallpaper2(w2);
}
void dashboard::wallpaper3(QString w3)
{
   emitWallpaper3(w3);
}
void dashboard::wallpaper4(QString w4)
{
    emitWallpaper4(w4);
}

void dashboard::wallpaper5(QString w5)
{
    emitWallpaper5(w5);
}

void dashboard::dChange1(QString c1)
{
    emitDailog1(c1);
}

void dashboard::dChange2(QString c2)
{
    emitDailog2(c2);
}

void dashboard::dChange3(QString c3)
{
    emitDailog3(c3);
}

void dashboard::dChange4(QString c4)
{
   emitDailog4(c4);
}

void dashboard::dChange5(QString c5)
{
   emitDailog5(c5);
}

void dashboard::startTimers()
{
    s.start(500);
    r.start(500);
    t.start(2000);
    f.start(10000);
    b.start(1000);
    et.start(1000);
}

void dashboard::stopTimers()
{
    s.stop();
    r.stop();
    t.stop();
    f.stop();
    b.stop();
    et.stop();
}

