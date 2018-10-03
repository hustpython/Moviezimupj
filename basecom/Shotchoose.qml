import QtQuick 2.0

Item {
    property string shotoperationicourl: "qrc:icon/delete.png"
    property real opacityvalue: 0.5
    signal buttonClicked
    id:windowbtn
    Rectangle
    {
        id:icoback
        width: 15
        height: 15
        color: "#32373B"
        opacity: opacityvalue
    }
    Image {
        anchors.centerIn: icoback
        width: 12
        height: 12
        id: shotsoperationico
        source: shotoperationicourl
    }
    MouseArea
    {
        anchors.fill:icoback
        hoverEnabled: true
        onClicked:
        {
            windowbtn.buttonClicked()

        }

        onEntered:
        {
          icoback.opacity = 1
        }
        onExited: {
            icoback.opacity = opacityvalue
       }

    }
}
