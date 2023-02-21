import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick 2.0
import QtQuick.Window 2.15
//import QtMultiMedia 5.12

Window {
    id: swindow1
    width: 740
    height: 480
    visible: true
    color: dcolor
    title: qsTr("Icon Window")

    property variant thirdwindow;
    property variant dwindow;
    property string dcolor: "white"

//Audio
//{
//    id:sound
//    source: "qrc:/Sound/klakson-telolet-indonesian-big-bus-custom-horn-31303.wav"
//}
/*************************************Onclicked Dialog Color Change*****************************************/
Connections{
    target: testing
    onEmitDailog1:{
        swindow1.dcolor=d1
    }
}
/*************************************Onclicked Dialog Color Change*****************************************/
/*************************************Onclicked Dialog Color Change*****************************************/
Connections{
    target: testing
    onEmitDailog2:{
        swindow1.dcolor=d2
    }
}
/*************************************Onclicked Dialog Color Change*****************************************/
Connections{
    target: testing
    onEmitDailog3:{
        swindow1.dcolor=d3
    }
}
/*************************************Onclicked Dialog Color Change*****************************************/

/*************************************Onclicked Dialog Color Change*****************************************/
Connections{
    target: testing
    onEmitDailog4:{
        swindow1.dcolor=d4
    }
}
/*************************************Onclicked Dialog Color Change*****************************************/

/*************************************Onclicked Dialog Color Change*****************************************/
Connections{
    target: testing
    onEmitDailog5:{
        swindow1.dcolor=d5
    }
}
/*************************************Onclicked Dialog Color Change*****************************************/

Image {
        source: "qrc:/Image/Car_Wallpaper3.jpg"
        width:710
        height:450
        anchors.centerIn: parent
/*************************************Left Indicator Icon*****************************************/
    Image{
        id:leftindicator
        width: 80
        height: 50
        x:60
        y:100
        source:"qrc:/Image/arrow_Left.png"
        MouseArea {
            id:clickindicatorleft
            anchors.fill: parent
            onClicked: {
                if(r3.color===whitecolor)
                    r3.color=greencolor
                else
                    r3.color=whitecolor
            }
        }
    }
/*************************************Left Indicator Icon*****************************************/

/*************************************Right Indicator Icon*****************************************/
    Image{
        id:righttindicator
        width: 80
        height: 50
        x:240
        y:100
        source:"qrc:/Image/arrow_Right.png"
        MouseArea {
            id:clickindicatorright
            anchors.fill: parent
            onClicked: {
                if(r2.color===whitecolor)
                    r2.color=greencolor
                else
                    r2.color=whitecolor
            }
        }
    }
/*************************************Right Indicator Icon*****************************************/

/*************************************FM Icon*****************************************/
    Image {
        id: fm
        source: "qrc:/Image/Fm.png"
        height:65
        width: 45
        x: 445
        y: 80
    }
/*************************************FM Icon*****************************************/
    Image {
        id: bluetooth
        source: "qrc:/Image/Blutooth.png"
        height: 65
        width: 45
        x:600
        y:80
    }
/*************************************FM Icon*****************************************/

/*************************************CALL Icon*****************************************/
    Image {
        id: call
        source: "qrc:/Image/Call.png"
        height: 55
        width: 45
        x:70
        y:200
    }
/*************************************CALL Icon*****************************************/

/*************************************MUSIC Icon*****************************************/
    Image {
        id: music
        source: "qrc:/Image/Music.png"
        height: 55
        width: 45
        x:250
        y:200
    }
/*************************************MUSIC Icon*****************************************/

/*************************************SETTING Icon*****************************************/
    Image {
        id: setting
        source: "qrc:/Image/Setting.png"
        height: 55
        width: 45
        x:445
        y:200
        MouseArea {
           id:myThird
           anchors.fill: parent
           onClicked:{
               var component =Qt.createComponent("PersonDisplay.qml")       //Onclicked open New window
                thirdwindow =component.createObject(swindow1)
                thirdwindow.show()                                          //display PersonDisplay window
            }
        }
    }
/*************************************SETTING Icon*****************************************/

/*************************************NAVIGATOR Icon*****************************************/
    Image {
        id: navigator
        source: "qrc:/Image/Navigator.png"
        height: 55
        width: 45
        x:600
        y:200
    }
/*************************************NAVIGATOR Icon*****************************************/

/*************************************HORN Icon*****************************************/
    Image {
        id: horn
        source: "qrc:/Image/Horn.png"
        height: 45
        width: 55
        x:365
        y:10
        MouseArea {
            id:hornarea
            anchors.fill: parent
            onClicked: {
                sound.play()
                testing.horn()
            }
        }
    }
/*************************************HORN Icon*****************************************/

/*************************************CAR Icon*****************************************/
    Image {
        id: carImage
        source: "qrc:/Image/Car.png"
        height: 90
        width: 90
        x:363
        y:300
        MouseArea {
           id:mycar
           anchors.fill: parent
           onClicked:{
               var component =Qt.createComponent("MeterDisplay.qml")     //Onclicked open perivous window
                dwindow =component.createObject(swindow1)
                dwindow.show()                                           //display meter dasboard window
                }
            }
        }
    }
}



