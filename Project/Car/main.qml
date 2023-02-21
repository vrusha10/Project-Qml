import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick 2.0
//import QtMultimedia

Window {
    id:windoww
    width: 640
    height: 480
    visible: true
    title: qsTr("Start Window")
    color: "black"
    property variant meterwindow;

    Rectangle {
        id:startrect
        anchors.centerIn: parent
        color: "white"
        width:200
        height: 200
        radius: width
        border.width: 3
        border.color: "White"

        Text {
            text: "START"
            font.bold: true
            font.pixelSize: 50
            anchors.centerIn: parent
            color: "White"
           }
        Text {
            id: text1
            x: 80
            y: 127
            color: "#fffefd"
            text: qsTr("POWER")
            font.pixelSize: 12
            font.bold: true
        }
            gradient: Gradient{
                GradientStop{position:0.6 ; color:"Red"}
                GradientStop{position:1.5 ; color:"black"}
            }
            MouseArea {
                id:myArea
                anchors.fill: parent
                onClicked: {
                   var component = Qt.createComponent("MeterDisplay.qml")
                    meterwindow =component.createObject(windoww)
                    meterwindow.show()
                    testing.startTimers()
                }
            }
        }
    }
