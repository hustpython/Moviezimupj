import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {
    property string promptstr: "适应"
    Slider {
        anchors.leftMargin: 5
        maximumValue: 2
        minimumValue: 0
        stepSize:1
        style: SliderStyle {
            groove: Rectangle {
                implicitWidth: 50
                implicitHeight: 3
                color: "gray"
                radius: 1
            }
            handle: Rectangle {
                anchors.centerIn: parent
                color: control.pressed ? "purple" : "lightgray"
                border.color: "gray"
                border.width: 2
                implicitWidth: 12
                implicitHeight: 12
                radius: 6
            }
        }
        Text {
            id: promptstrid
            anchors.left: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 8
            font.pixelSize: 11
            text: qsTr(promptstr)
            color:"white"
        }
        onValueChanged:
                {
                    if(value === 0)
                    {
                        promptstr="适应"
                        sourcewidth = mainwindowwidth/2 - 30
                    }
                    else if (value === 1)
                    {
                        promptstr="半倍"
                        if(myshotinfo.sourcewidth !==0)
                        {
                        sourcewidth = myshotinfo.sourcewidth / 2
                        }
                    }
                    else
                    {
                        promptstr="原画"
                        if(myshotinfo.sourcewidth !==0)
                        {
                          sourcewidth = myshotinfo.sourcewidth
                        }
                    }
                }
    }

}
