#include <getshotinfo.h>
#include<QImage>
#include<QRgb>
#include<QColor>
#include <QDebug>
#include <QImage>
Shotinfo::Shotinfo(QObject *parent) :
    QObject(parent)
{
    m_pImgProvider = new ImageProvider();
}
QString Shotinfo::imgurl()
{
    return myimgurl;
}
int Shotinfo::sourcewidth()
{
    return mysourcewidth;
}
void Shotinfo::saveImage(QString saveurl,int scaled)
{
    QString ressaveurl = saveurl.mid(7)+"/字幕拼图.png";
    QImage scaledimg;
    if(scaled < (m_pImgProvider->img.width())/4)
    {
        scaled = (m_pImgProvider->img.width())/4;
    }
    double scaledwidthbili = scaled*1.0 / (m_pImgProvider->img.width()*1.0);
    scaledimg = m_pImgProvider->img.scaled(scaled,m_pImgProvider->img.height()*scaledwidthbili);
    scaledimg.save(ressaveurl);
}
void Shotinfo::setImage(int scaledwidth,double pos1,double pos2,double mainposition)
{
    if(myimgurls.length()>0)
    {
        QImage tempimg;
        QString tempurl =myimgurls[0].mid(7);
        tempimg.load (tempurl);
        mysourcewidth = tempimg.width();
        int totalheight;
        double scaledbili = (mysourcewidth*1.0) / (scaledwidth*1.0);
        int pos1scaled = pos1*scaledbili;
        int pos2scaled = pos2*scaledbili;
        int mainpositionscaled = mainposition*scaledbili;
        int zimuheight = pos2scaled - pos1scaled;
        int zimucount = myimgurls.length()-1;
        totalheight = pos2scaled - mainpositionscaled + zimucount *zimuheight;
        QImage lastimg(mysourcewidth,totalheight,QImage::Format_RGB32);
        for(int i=0;i<myimgurls.length();i++)
        {
            QImage img;
            int initialy;
            if(i==mymainindex)
            {
                initialy = mainpositionscaled;
            }
            else
            {
                initialy = pos1scaled;
            }
            img.load(myimgurls[i].mid(7));
            for(int x = 0;x<img.width();x++)
            {
                for(int y = initialy;y<pos2scaled;y++)
                {
                    QColor oldColor;
                    int r,g,b;
                    oldColor = QColor(img.pixel(x,y));
                    r = oldColor.red();
                    g = oldColor.green();
                    b = oldColor.blue();
                    if(i<=mymainindex)
                    {
                    lastimg.setPixel(x,i*zimuheight+y-initialy,qRgb(r,g,b));
                    }
                    else
                    {
                     lastimg.setPixel(x,(i-1)*(zimuheight)+pos2scaled - mainpositionscaled + y-initialy,qRgb(r,g,b));
                    }
            }
            }
        }
        m_pImgProvider->img = lastimg;
        emit callQmlRefeshImg();
    }
}
void Shotinfo::setImgurl(QString &imgurl)
{
    if (myimgurl != imgurl)
            {
               myimgurl = imgurl;
               emit setHeight();
            }
}
QVector<QString> Shotinfo::imgurls()
{
    return myimgurls;
}
void Shotinfo::setImgurls(QVector<QString> &imgurls)
{
    if(myimgurls != imgurls)
    {
        myimgurls = imgurls;
    }
}

int Shotinfo::mainindex()
{
    return mymainindex;
}
void Shotinfo::setMainindex(int &mainindex)
{
     mymainindex = mainindex;
}
double Shotinfo::imgscaleheight()
{
   return myimgscaleheight;
}
void Shotinfo::setHeight()
{
    QImage tempimg;
    QString y = myimgurl.mid(7);
    tempimg.load(y);
    double w = tempimg.width();
    double h = tempimg.height();
    myimgscaleheight = w/h;
    //qDebug()<<mymainindex<<endl;
}



