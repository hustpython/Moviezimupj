import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Window 2.10
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.0
import QtQuick.Layouts 1.3
Item {
    Item {
        Rectangle
        {
            id:rightback
            radius: 3
            opacity: 0.5
            color: "#74E1FF"
            //color: Material.color(Material.LightGreen)
            width: mainwindowwidth/2 - 30
            height: mainwindowheight-60
        }
        ScrollView{
            id:showconcate
            width: sourcewidth
            height:mainwindowheight-60
            clip: true
            contentWidth :sourcewidth//根据图片大小进行缩放scrollbar
            anchors.fill:rightback
            anchors.centerIn: rightback
            Image {
                anchors.centerIn: parent
                id:concantnateimg
                smooth: true
                width: sourcewidth
                fillMode: Image.PreserveAspectFit
                source: ""
                Connections {
                        target: myshotinfo  // 目标对象
                        onCallQmlRefeshImg: {
                            concantnateimg.source=""
                            concantnateimg.source= "image://diffurls"
                        }
                }
        }
        }
    }
    }


