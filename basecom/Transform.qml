import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    property string transformbuttoncolor: "yellow"
    property string transformarrowcolor: "#2EC14A"
    property int transformicowidth: 28
    property int  transformradius: 28
    Rectangle
    {
        id:backcircle
        opacity: mainRoot.transformbtnopacity
        width: transformicowidth
        height: transformicowidth
        radius: transformradius
        color:transformbuttoncolor
    }

    Canvas
    {
        anchors.centerIn: backcircle.Center
        id:arrowid
        opacity:mainRoot.transformbtnopacity
        width: transformicowidth
        height: transformicowidth
        onPaint:
        {
            var ctx = getContext("2d")
            var arrowwidth = transformicowidth
            ctx.fillStyle = transformarrowcolor
            ctx.beginPath()
            ctx.moveTo(arrowwidth/6,arrowwidth/3)
            ctx.lineTo(arrowwidth*3/7,arrowwidth/3)
            ctx.lineTo(arrowwidth*3/7,arrowwidth/6)
            ctx.lineTo(arrowwidth*5/6,arrowwidth/2)
            ctx.lineTo(arrowwidth*3/7,arrowwidth*5/6)
            ctx.lineTo(arrowwidth*3/7,arrowwidth*2/3)
            ctx.lineTo(arrowwidth/6,arrowwidth*2/3)
            ctx.closePath()
            ctx.fill()
        }
    }
    DropShadow {
            anchors.fill: arrowid
            horizontalOffset: 2
            verticalOffset: 2
            radius: 8.0
            samples: 40
            color: "#082532"
            source: arrowid
        }
    MouseArea
    {
        anchors.fill: backcircle
        hoverEnabled: true
        onClicked:
        {
            if(mainRoot.picdownloaded && imagemodellist.rowCount()>0)
            {
                //加载图片完毕，并且可用的图片数目大于0
                //mainRoot.transformimgvisiavle = !mainRoot.transformimgvisiavle
                var i = 0
                myshotinfo.imgurls = []
                for(;i<imagemodellist.count;i++)
                {
                   var tempurl = imagemodellist.get(i).shoturl
                   var tempcolor = imagemodellist.get(i).mainrectcolor
                   if(tempcolor === "yellow")
                    {
                        myshotinfo.mainindex = i
                    }
                   myshotinfo.imgurls[i]= tempurl
                }
                myshotinfo.setImage(sourcewidth,position1,position2+9,mainposition)
            }
        }
    }
}
