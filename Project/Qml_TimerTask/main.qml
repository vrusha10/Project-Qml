import QtQuick 2.12
import QtQml 2.11
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    id:root
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Connections {
     target: testing
     onFinal: {
         console.log("c++ Integrated")
         if(d==="timeout")
         {
             root.color="green"
         }
     }
 }

        Button {
            id:b1
            y: 114
            width: 100
         height: 50
         text: "Start"
         font.bold: true
         font.pixelSize: 12
         anchors.horizontalCenter: parent.horizontalCenter
         onClicked: {
             testing.start()
             {
                  root.color="red"

             }
         }
     }

        Button {
            id: b2
            x: 270
            y: 327
            width: 100
            height: 50
            text: qsTr("Stop")
            font.bold: true
            font.pointSize: 10
            onClicked: {
             testing.stop()
                {
                    root.color="gold"

                }
            }
        }
}

