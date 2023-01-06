#include "call.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QQmlContext>
static const QString path="list.db";

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    call db(path);
    if(db.isOpen())
    {
        db.createTable();
    }

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    call list;
    engine.rootContext()->setContextProperty("testing",&list);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
