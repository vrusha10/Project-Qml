#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
//#include <QtMultimedia>
//#include <QtMultimediaWidgets>
#include"CarDB/dashdb.h"
#include"CarDisplay/dashboard.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    dashdb d("database.db");
    dashboard data;
    QQmlApplicationEngine engine;
engine.rootContext()->setContextProperty("testing", &data);
engine.rootContext()->setContextProperty("database", &d);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
//    QT += multimedia multimediawidgets
    return app.exec();
}
