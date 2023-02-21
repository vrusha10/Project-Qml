#ifndef DASHBOARD_H
#define DASHBOARD_H

#include <QObject>
#include<QVariant>
class dashboard: public QObject
{
    Q_OBJECT
     int se;
public:

    explicit dashboard(QObject *parent =nullptr);

signals:
    void notifyVehicleSpeed(int speed);
    void notifyRpm(int RPM);
    void notifyOutsideTemp(int tem);
    void notifyFuelLevel(int level);
    void notifyBattery(int battery);
    void notifyEngineTime(int etime);
    void emitColor(QVariant color1);
    void emitColor1(QVariant color2);
    void emitColor2(QVariant color3);
    void emitColor3(QVariant color4);
    void emitColor4(QVariant color5);
    void emitNiddle1(QVariant path1);
    void emitNiddle2(QVariant path2);
    void emitNiddle3(QVariant path3);
    void emitNiddle4(QVariant path4);
    void emitNiddle5(QVariant path5);
    void emitWallpaper1(QVariant c1);
    void emitWallpaper2(QVariant c2);
    void emitWallpaper3(QVariant c3);
    void emitWallpaper4(QVariant c4);
    void emitWallpaper5(QVariant c5);
    void emitDailog1(QVariant d1);
    void emitDailog2(QVariant d2);
    void emitDailog3(QVariant d3);
    void emitDailog4(QVariant d4);
    void emitDailog5(QVariant d5);



private slots:
    void emitspeed();
    void emitrpm();
    void emittemp();
    void emitfuel();
    void emitbattery();
    void emitEngineTime();

public slots:
    void stopspeed();
    void stoprpm();
    void stoptemp();
    void stopfuel();
    void stopbattery();
    void stopEngineTime();
    void parking();
    void startTimers();
    void stopTimers();
    void horn();
    void get(QString);
    void get1(QString);
    void get2(QString);
    void get3(QString);
    void get4(QString);
    void niddle1(QString);
    void niddle2(QString);
    void niddle3(QString);
    void niddle4(QString);
    void niddle5(QString);
    void wallpaper1(QString);
    void wallpaper2(QString);
    void wallpaper3(QString);
    void wallpaper4(QString);
    void wallpaper5(QString);
    void dChange1(QString);
    void dChange2(QString);
    void dChange3(QString);
    void dChange4(QString);
    void dChange5(QString);
};

#endif //DASHBOARD_H
