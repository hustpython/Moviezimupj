import QtQuick 2.0

Item {
        property url btnurl: "qrc:/icon/close.svg"
        property real opacityvalue: 0.8
        signal buttonClicked
        id:windowbtn
        Image
        {
            id:btnico
            opacity:opacityvalue
            width: 10; height: 10
            source: btnurl
            MouseArea
            {
                anchors.fill:parent
                hoverEnabled: true
                onClicked:
                {
                    windowbtn.buttonClicked()

                }

                onEntered:
                {
                  parent.opacity = 1
                  shadowrec.opacity = 0.1
                  //promplabel.visible = true
                }
                onExited: {
                    parent.opacity = opacityvalue
                    shadowrec.opacity = 0
               }

            }

            Rectangle
            {
                radius: 3
                id:shadowrec
                width: 15; height: 15
                anchors.horizontalCenter: btnico.horizontalCenter
                anchors.verticalCenter: btnico.verticalCenter
                opacity:0
            }
        }
}
