import QtQuick 2.0

Item {
    property int arrowlinewidth: 1 //>=1
    property int arrowlinewidth2: 9 //>=1
    Canvas
    {
        id:moveline1
        opacity:0.6
        width: mainwindowwidth/2 - 30
        height: 9
        y:mainRoot.position1
        onPaint:
        {
            var ctx = getContext("2d")
            var arrowwidth = mainwindowwidth/2 - 30
            ctx.fillStyle = "red"
            ctx.beginPath()
            ctx.moveTo(0,arrowlinewidth)
            ctx.lineTo(arrowwidth/2-5,arrowlinewidth)
            ctx.lineTo(arrowwidth/2,arrowlinewidth+9)
            ctx.lineTo(arrowwidth/2+5,arrowlinewidth)
            ctx.lineTo(arrowwidth,arrowlinewidth)
            ctx.lineTo(arrowwidth,arrowlinewidth-1)
            ctx.lineTo(0,arrowlinewidth-1)
            ctx.closePath()
            ctx.fill()
        }
    }

    MouseArea {
                cursorShape: Qt.SizeVerCursor
                anchors.fill: moveline1
                drag.target: moveline1
                drag.axis: Drag.YAxis
                drag.minimumY: 0
                drag.maximumY: moveline2.y+8
                onPositionChanged:
                {
                    mainRoot.position1=moveline1.y
                }
            }
    /////////////////////////////////////////////

    Canvas
    {
        id:moveline2
        opacity:0.6
        width: mainwindowwidth/2 - 30
        height: 10
        y:mainRoot.position2
        onPaint:
        {
            var ctx = getContext("2d")
            var arrowwidth = mainwindowwidth/2 - 30
            ctx.fillStyle = "red"
            ctx.beginPath()
            ctx.moveTo(0,arrowlinewidth2)
            ctx.lineTo(arrowwidth/2-5,arrowlinewidth2)
            ctx.lineTo(arrowwidth/2,arrowlinewidth2-9)
            ctx.lineTo(arrowwidth/2+5,arrowlinewidth2)
            ctx.lineTo(arrowwidth,arrowlinewidth2)
            ctx.lineTo(arrowwidth,arrowlinewidth2+1)
            ctx.lineTo(0,arrowlinewidth2+1)
            ctx.closePath()
            ctx.fill()
        }
    }

    MouseArea {
                cursorShape: Qt.SizeVerCursor
                anchors.fill: moveline2
                drag.target: moveline2
                drag.axis: Drag.YAxis
                drag.minimumY: moveline1.y-8
                drag.maximumY: parent.height-10
                onPositionChanged:
                {
                    mainRoot.position2=moveline2.y
                }
            }
}
