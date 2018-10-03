import QtQuick 2.0

Item {
    property string changecolor: "#32373B"
    signal buttonClicked
    id:mainshotbtn
    Rectangle
    {
        id:mainreck
        width: 15
        height: 15
        color: changecolor
        opacity: 0.5
    }
    Text {
        id: maintext
        anchors.centerIn: mainreck
        color: "white"
        font.pixelSize: 12
        text: qsTr("主")
    }
    MouseArea
    {
        anchors.fill:mainreck
        hoverEnabled: true
        onEntered:
        {
            mainreck.opacity = 1
        }
        onExited:
        {
            mainreck.opacity = 0.5
        }
        onClicked:
        {
            mainshotbtn.buttonClicked()
        }
    }

}
