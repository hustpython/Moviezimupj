import QtQuick 2.0
import "../basecom" as Com
//通过listview实现对加载进来的图片显示
Item {
    //图片
    width:mainwindowwidth/2 - 30
    height: shotimage.height
    Image {
        id: shotimage
        width:mainwindowwidth/2 - 30
        smooth: true
        source: shoturl
        fillMode: Image.PreserveAspectFit
        Com.Doublearrowline
        {
            anchors.fill: parent
        }
    }
    //图片左上角的3/2个按钮

    //图片的矩形罩盖1
    //line1 and line2
    Rectangle
    {
        width:mainwindowwidth/2 - 30
        height: position1
        color: "gray"
        opacity: 0.6
    }
    Com.Mainimglinedown
    {
        anchors.fill: parent
        visible: mainRoot.mainshotindex === index ? true:false
    }

    Item
    {
       anchors.fill: shotimage
       Row
       {
           Com.Shotchoose
           {
               width: 15
               height: 15
               shotoperationicourl: "qrc:icon/up.png"
               visible: index ==0 ? false:true
               //向上移动交换
               onButtonClicked:
               {
               if(index > 0)
               {
               var tempurl = imagemodellist.get(index).shoturl
               var tempcolor = imagemodellist.get(index).mainrectcolor
               var oldcolor = imagemodellist.get(index-1).mainrectcolor
               imagemodellist.setProperty(index, "shoturl", imagemodellist.get(index-1).shoturl)
               imagemodellist.setProperty(index-1,"shoturl",tempurl)
               imagemodellist.setProperty(index,"mainrectcolor",oldcolor)
               imagemodellist.setProperty(index-1,"mainrectcolor",tempcolor)
               if(mainRoot.mainshotindex === index)
               {
                   mainRoot.mainshotindex -=1
               }
               else if(mainRoot.mainshotindex === index+1)
               {
                   mainRoot.mainshotindex +=1
               }
               }
               console.log(mainRoot.mainshotindex)
               }
           }
           Com.Shotchoose
           {
               width: 15
               height: 15
               shotoperationicourl: "qrc:icon/down.png"
               //visible: index === imagemodellist.rowCount()-1 ? false:true
               visible: index === urlcounts-1 ? false:true
               //向下移动,交换
               onButtonClicked:
               {
                   if(index < imagemodellist.rowCount())
                   {
                   var tempurl = imagemodellist.get(index).shoturl
                   var tempcolor = imagemodellist.get(index).mainrectcolor
                   var oldcolor = imagemodellist.get(index+1).mainrectcolor
                   imagemodellist.setProperty(index, "shoturl", imagemodellist.get(index+1).shoturl)
                   imagemodellist.setProperty(index+1,"shoturl",tempurl)
                   imagemodellist.setProperty(index,"mainrectcolor",oldcolor)
                   imagemodellist.setProperty(index+1,"mainrectcolor",tempcolor)
                   if(mainRoot.mainshotindex === index)
                   {
                       mainRoot.mainshotindex = mainRoot.mainshotindex+1
                   }
                   else if(mainRoot.mainshotindex === index+1)
                   {
                       mainRoot.mainshotindex -=1

                   }
                   }
                   console.log(mainRoot.mainshotindex)
               }
           }
           Com.Shotchoose
           {
               width: 15
               height: 15
               onButtonClicked:
               {
                  //删除当前图片
                   if(imagemodellist.rowCount()-1===0)
                   {
                       mainRoot.transformbtnopacity = 0.5
                       imagemodellist.remove(index,1)
                       urlcounts -= 1
                   }
                   else if(imagemodellist.rowCount()-1>0)
                   {
                       if(mainRoot.mainshotindex !== index)
                       {
                        //删除的图片的索引小于主图索引
                       if(mainRoot.mainshotindex > index)
                       {
                           imagemodellist.remove(index,1)
                           urlcounts -= 1
                           imagemodellist.setProperty(mainRoot.mainshotindex-1, "mainrectcolor","yellow")
                           mainRoot.mainshotindex -= 1
                       }
                       //删除的图片的索引大于主图索引
                       else
                       {
                           imagemodellist.remove(index,1)
                           urlcounts -= 1
                       }
                       }
                       else
                       {
                           imagemodellist.remove(index,1)
                           urlcounts -= 1
                           imagemodellist.setProperty(0, "mainrectcolor","yellow")
                           mainRoot.mainshotindex = 0
                       }
                   }
                   else
                   {
                       imagemodellist.remove(index,1)
                       urlcounts -= 1
                   }
                   console.log(mainRoot.mainshotindex)
               }
           }
           Com.Mainshotbtn
           {
               width: 15
               height: 15
               changecolor:mainrectcolor
               onButtonClicked:
               {
                   if(mainRoot.mainshotindex !== index)
                   {
                   imagemodellist.setProperty(mainRoot.mainshotindex, "mainrectcolor","#32373B")
                   imagemodellist.setProperty(index, "mainrectcolor","yellow")
                   mainRoot.mainshotindex = index
                   }
                   console.log(mainRoot.mainshotindex)
               }
           }
       }
    }

    //图片的矩形罩盖2
    Rectangle
    {
        width:mainwindowwidth/2 - 30
        y:mainRoot.position2 + 10
        anchors.bottomMargin: 10
        height: shotimage.height - position2 - 9
        color: "gray"
        opacity: 0.6
    }

}
