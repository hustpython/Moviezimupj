import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Window 2.2
//import com.mxq.myshotinfo 1.0
import "../left" as Left
Window {
    id :mainRoot
    visible: true
    modality: Qt.ApplicationModal;//Qt.WindowModal;
    property real mouseXTMP: 0
    property real mouseYTMP: 0
    property int urlcounts: 0
    width: Screen.desktopAvailableWidth*0.6
    height: Screen.desktopAvailableHeight*0.6
    property double mainwindowwidth: width
    property double mainwindowheight: height
    property bool picdownloaded: false
    property double transformbtnopacity: 0.5
    property double position1: 0
    property double position2: 0
    property int sourcewidth: mainwindowwidth/2 - 30
    //用于记录主视图的index
    property int mainshotindex: 0
    flags:Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint     //添加了这一句
    Left.Imagelistmodel
    {
        id:imagemodellist
    }
    MouseArea {
               anchors.fill: parent
               onPressed: {
                   mouseXTMP = mouseX
                   mouseYTMP = mouseY
               }
               onPositionChanged: {
                   mainRoot.x = mouseX + mainRoot.x - mouseXTMP
                   mainRoot.y = mouseY + mainRoot.y - mouseYTMP
               }

           }
    Rectangle
    {
        width: Screen.desktopAvailableWidth*0.6
        height: Screen.desktopAvailableHeight*0.6
        opacity: 0.7
        color: "#082331"
    }

    Column
    {

        Top
        {
            width: mainwindowwidth
            height: 20
        }

        Mid
        {
            width: mainwindowwidth
            height: mainwindowheight-60

        }


        Buttom
        {
            width: mainwindowwidth
            height: 10
        }

    }
}
