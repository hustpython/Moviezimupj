import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Window 2.2
import "../basecom" as Com
Item {
    FontLoader { id: localFont; source: "qrc:/fonts/迷你简瘦金书.ttf" }
    Text {
        id: log
        font.family: localFont.name
        font.pixelSize: 12
        anchors.left: parent.left
        color: "white"
        anchors.leftMargin: 15
        anchors.top:parent.top
        anchors.topMargin: 3
        text: qsTr("电影台词字幕拼接软件")
    }
    DropShadow {
            anchors.fill: log
            horizontalOffset: 2
            verticalOffset: 2
            radius: 8.0
            samples: 30
            color: "#082532"
            source: log
        }

    Com.Windowbtn
    {
        id: closebtn
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin:4
        anchors.rightMargin: 15
        onButtonClicked: Qt.quit()

    }

    Com.Windowbtn
    {
        id: minbtn
        anchors.right: closebtn.left
        anchors.top: parent.top
        anchors.topMargin:4
        anchors.rightMargin: 30
        btnurl:"qrc:/icon/substract.svg"
        onButtonClicked:
        {
            if (mainRoot.visibility !=Window.Minimized)
            {
                mainRoot.visibility = Window.Minimized
                console.log("最小化")
            }
        }
    }
    Rectangle {
                id: img
                width: 16
                height: 16
                radius: width/2
            anchors.right: minbtn.left
            anchors.rightMargin: 50
            anchors.top: parent.top
            anchors.topMargin:2
            color: "black"


                Image {
                    id: _image
                    smooth: true
                    visible: false
                    anchors.fill: parent
                    source: "qrc:/icon/logo.jpg"
                    sourceSize: Qt.size(parent.size, parent.size)
                    antialiasing: true
                }
                Rectangle {
                    id: _mask
                    color: "black"
                    anchors.fill: parent
                    radius: width/2
                    visible: false
                    antialiasing: true
                    smooth: true
                }
                OpacityMask {
                    id:mask_image
                    anchors.fill: _image
                    source: _image
                    maskSource: _mask
                    visible: true
                    antialiasing: true
                }
        Text {
                anchors.left: parent.right
                anchors.leftMargin: 5
                id: logotext
                color: "white"
                text: qsTr("mxq")
                }
       }
    }



