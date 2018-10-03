import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0
Item {
    property string buttonlabel: ""
    signal buttonClicked
    id:uploadordownload
    Rectangle
    {
        width: 60
        height: 25
        color: "#AEDDE3"
        radius: 3
        opacity: 0.6
        id:backbtn
        Material.accent: Material.Orange

    }
    Text {
        id: buttontext
        opacity: 0.1
        anchors.centerIn: backbtn
        font.pixelSize: 12
        color: "white"
        text: qsTr(buttonlabel)
    }
    MouseArea
    {
        anchors.fill: backbtn
        hoverEnabled: true
        onEntered:
        {
            backbtn.opacity = 1
            buttontext.opacity = 1
        }
        onExited:
        {
            backbtn.opacity = 0.6
            buttontext.opacity = 0.1
        }

        onClicked:
        {
            uploadordownload.buttonClicked()
        }
    }
    DropShadow {
            anchors.fill: buttontext
            horizontalOffset: 1
            verticalOffset: 1
            radius: 8.0
            samples: 30
            color: "#082532"
            source: buttontext
        }
}
