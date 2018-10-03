import QtQuick 2.9
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Material 2.0
import "../basecom" as Com
import "../left" as Left
Item {
    property variant urls: []
    Row
    {
        FileDialog

        {
            id:fds
            title: "选择图片文件"
            folder: shortcuts.desktop
            selectExisting: true
            selectFolder: false
            selectMultiple: true
            nameFilters: ["图片 (*.jpg|*.jpeg|*.png|*.svg)"]
            onAccepted: {
                urls = fds.fileUrls
                //imagemodellist.clear()
                myshotinfo.imgurl = urls[0]
                var widthheigthbili = myshotinfo.imgscaleheight
                var imgheight = (mainwindowwidth/2 - 30) / widthheigthbili
                mainRoot.position1 = imgheight *4/5
                mainRoot.position2 = imgheight - 10
                var i = 0
                for(;i<urls.length;i++)
                {
                    if(i===0 && urlcounts===0)
                    {
                        imagemodellist.append({"shoturl":urls[i],"mainrectcolor":"yellow"})
                    }
                    else
                    {
                    imagemodellist.append({"shoturl":urls[i],"mainrectcolor":"#32373B"})
                    }
                }
                mainRoot.picdownloaded = true
                mainRoot.transformbtnopacity = 1.0
                urlcounts += urls.length
            }
        }
        Item
        {
            height: mainwindowheight-60
            width: 10
        }
        Item
        {
            height:40
            width: mainwindowwidth/2 - 30
        Item
        {
            anchors.centerIn: parent
        Com.Button
        {
            width: 60
            height: 25
            anchors.verticalCenter: parent.verticalCenter
            x:(mainwindowwidth/2 - 30)/8 - 100
            buttonlabel: "本地上传"
            onButtonClicked:
            {
                fds.open()
            }

        }

        Com.Button
        {
            width: 60
            height: 25
            anchors.verticalCenter: parent.verticalCenter
            buttonlabel: "清除列表"
            onButtonClicked:
            {
                imagemodellist.clear()
                mainRoot.transformbtnopacity = 0.5
            }
        }
        }
        }



        Item
        {
            height: mainwindowheight-60
            width: 36
        }

        Item
        {
            height:40
            width: mainwindowwidth/2 - 30
        FileDialog {
            id: folderchoose
            title: "选择保存路径"
            selectFolder : true
            folder: shortcuts.desktop
            selectExisting: false
            selectMultiple: false
            nameFilters: ["图片 (*.jpg|*.jpeg|*.png|*.svg)"]
            onAccepted: {
                myshotinfo.saveImage(folderchoose.fileUrl,sourcewidth);
            }
            onRejected: {
            }
        }
        Com.Button
        {
            width: 60
            height: 25
            anchors.verticalCenter:parent.verticalCenter
            x:mainwindowwidth/4 - 100
            buttonlabel: "本地下载"
            onButtonClicked:
            {
                if(myshotinfo.sourcewidth >0)
                {
                folderchoose.open()
                }
            }

        }
        Com.Scaleslider
        {
            height:12
            width: 10
            anchors.verticalCenter: parent.verticalCenter
            x:mainwindowwidth/4
        }
        }
    }

}
