import QtQuick 2.0
import "../basecom" as Com
import "../left" as Left
import "../right" as Right
Item {
    Row
    {
        Item
        {
            height: mainwindowheight-60
            width: 12
        }

        Left.Leftview
        {
            width: mainwindowwidth/2 - 30
            height: mainwindowheight-60
        }
        Item
        {
            height: mainwindowheight-60
            width: 36
            Com.Transform
            {
                anchors.centerIn: parent
                width: 28
            }

        }

        Right.Rightview
        {
            width: mainwindowwidth/2 - 30
            height: mainwindowheight-60
        }
        Item
        {
            height: mainwindowheight-60
            width: 12
        }
    }
}
