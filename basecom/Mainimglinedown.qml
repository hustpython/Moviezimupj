import QtQuick 2.0

Item {
    property int mainlinewidth: 1 //>=1
    Canvas
    {
        id:mainline
        width: mainwindowwidth/2 - 30
        height: 9
        y:mainRoot.mainposition
        onPaint:
        {
            var ctx = getContext("2d")
            var arrowwidth = mainwindowwidth/2 - 30
            ctx.fillStyle = "green"
            ctx.beginPath()
            ctx.moveTo(0,mainlinewidth)
            ctx.lineTo(arrowwidth/2-5,mainlinewidth)
            ctx.lineTo(arrowwidth/2,mainlinewidth+9)
            ctx.lineTo(arrowwidth/2+5,mainlinewidth)
            ctx.lineTo(arrowwidth,mainlinewidth)
            ctx.lineTo(arrowwidth,mainlinewidth-1)
            ctx.lineTo(0,mainlinewidth-1)
            ctx.closePath()
            ctx.fill()
        }
    }

    MouseArea {
                cursorShape: Qt.SizeVerCursor
                anchors.fill: mainline
                drag.target: mainline
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: mainRoot.position1
                onPositionChanged:
                {
                    mainRoot.mainposition=mainline.y
                }
            }

}
