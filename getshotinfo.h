#ifndef GetSHOTINFO_H
#define GetSHOTINFO_H

#endif // GetSHOTINFO_H
#include<QVector>
#include<QObject>
#include<QDebug>
#include<QImage>
#include<imageprovider.h>
class Shotinfo:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imgurl READ imgurl WRITE setImgurl)
    Q_PROPERTY(QVector<QString> imgurls READ imgurls WRITE setImgurls)
    Q_PROPERTY(int mainindex READ mainindex WRITE setMainindex)
    Q_PROPERTY(int sourcewidth READ sourcewidth)
    Q_PROPERTY(double imgscaleheight READ imgscaleheight)

signals:
    void callQmlRefeshImg();

public:
    explicit Shotinfo(QObject *parent = 0);
    QString imgurl();
    int sourcewidth();
    void setImgurl(QString &imgurl);
    QVector<QString> imgurls();
    void setImgurls(QVector<QString> &imgurls);
    int mainindex();
    void setMainindex(int &mainindex);
    double imgscaleheight();
    Q_INVOKABLE void setHeight();
    ImageProvider *m_pImgProvider;

public slots:
    void setImage(int scaledwidth,double pos1,double pos2,double mainposition);
    void saveImage(QString saveurl,int scaled);
private:
    QString myimgurl;
    QVector<QString> myimgurls;
    int mymainindex = -1;
    int mysourcewidth = 0;
    double myimgscaleheight;
};
