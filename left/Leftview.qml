import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Controls 2.1
import QtQml.Models 2.1
//左侧的显示加载进来的截图的缩放图片，用于操作
Item {
    Rectangle
    {
        id:backrec
        radius: 3
        opacity: 0.5
        color: "#74E1FF"
        width: mainwindowwidth/2 - 30
        height: mainwindowheight-60
    }
    Item
    {
        anchors.fill: backrec
        width: mainwindowwidth/2 - 30
        height:mainwindowheight-60
        clip: true
        ListView
        {
            id:showshotimage
            width: mainwindowwidth/2 - 30
            height:mainwindowheight-60
            model: imagemodellist
            highlightFollowsCurrentItem: true
            focus: true
            delegate: Imagelist
            {
            }
            ScrollBar.vertical: ScrollBar
            {
                    id:hbar
                    parent: showshotimage
                    hoverEnabled: true
                    active: hovered || pressed
                    orientation: Qt.Vertical
                    anchors.top: showshotimage.top
                    anchors.left: showshotimage.right
                    anchors.bottom: showshotimage.bottom
                }
        }
    }
}
