#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <getshotinfo.h>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    //qmlRegisterType<Shotinfo>("com.mxq.myshotinfo",1,0,"Shotinfo");
    QQmlApplicationEngine engine;
    Shotinfo *showmyinfo = new Shotinfo();
    engine.rootContext()->setContextProperty("myshotinfo",showmyinfo);
    engine.addImageProvider(QLatin1String("diffurls"),showmyinfo->m_pImgProvider);
    engine.load(QUrl(QStringLiteral("qrc:/main/Main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
