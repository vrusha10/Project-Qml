import QtQuick 2.15
import QtQuick.Controls 2.5
import QtQuick 2.0

Window
{
    id: window
    width: 740
    height: 480
    visible: true
    color: "white"
     title: qsTr("Car DashBoard Window")
/*************************************PROPERTY****************************************/
    property string  fontColor:"white"
    property string nColor:"qrc:/Image/Needle.png"
    property variant thirdwindow;
    property int ft:122
    property int t: 122
    property int rp: 82
    property int sm: 84
    property int bt:0
    property int rightindicator: 0
    property color whitecolor: "white"
    property color orangecolor: "orange"
    property color greencolor: "green"
    property color redcolor: "red"
    property color yellowcolor: "yellow"
    property color bluecolor: "Lightblue"
    property int s: database.accessSecond()
    property int m: database.accessMinute()
    property int h: database.accessHour()

/*************************************PROPERTY*****************************************/

/*************************************FUEL CONNECTION*****************************************/

    Connections{
    target: testing
    onNotifyFuelLevel:{
       ft= level
//        console.log(level)
        if(ft<=200) { r7.color=whitecolor }
        else if(ft<=224){ r7.color=yellowcolor }
        else if(ft<=230){ r7.color=redcolor }
//        else if(ft<=176){
//            return ft-1;
//        }
//        else if(ft<=200){
//            return ft-1;
//        }
//        else if(ft<=210){
//            return r7.color=yellowcolor
//        }
//        else if(ft<=230){
//            return r7.color=redcolor
//        }
        else { r7.color=redcolor
               testing.stopfuel
            }
        }
    }
/*************************************FUEL CONNECTION*****************************************/

/*************************************TEMP CONNECTION*****************************************/
    Connections{
    target: testing
    onNotifyOutsideTemp:{
        t= tem
//        console.log(tem)
        if(t<=156)      { r9.color=bluecolor }
        else if(t<=185) { r9.color=orangecolor }
        else if(t<=212) { r9.color=yellowcolor }
        else if(t<=232) { r9.color=redcolor }
        else            { r9.color=redcolor }
        testing.stoptemp
        }
    }
/*************************************TEMP CONNECTION*****************************************/

/*************************************RPM CONNECTION*****************************************/
    Connections{
    target: testing
    onNotifyRpm:{
        rp= RPM
//       console.log(RPM)
        if(rp<=275){
           testing.stoprpm
          }
       }
    }
/*************************************RPM CONNECTION*****************************************/

/*************************************SPEED CONNECTION*****************************************/
    Connections{
    target: testing
    onNotifyVehicleSpeed:{
       sm= speed
//        console.log(speed)
        if(sm<=273){ testing.stopspeed }
        }
    }
/*************************************SPEED CONNECTION*****************************************/

/*************************************BATTERY CONNECTION*****************************************/
    Connections {
        target: testing
        onNotifyBattery:{
            bt=battery
//            console.log(battery)
            if(bt<=35) { r4.color=greencolor }
            else if(bt<=45) { r4.color=yellowcolor }
            else if(bt<=60) { r4.color=redcolor }
        }
    }
/*************************************BATTTERY CONNECTION*****************************************/

/*************************************ENGINE TIME*****************************************/
    Connections {
        target: testing
        onNotifyEngineTime:{
            console.log(s)
          //  s=etime
             s=s+1;
            if(s==60){
                ++m
                s=0
            }
            else if(m==60){
                s=0
                m=0
                ++h
            }
            else if(h==12){
                s=0
                m=0
                h=0
            }
        }
    }
/*************************************ENGINE TIME*****************************************/
/*************************************Font Color Yellow On Clicked*****************************************/
    Connections{
        target: testing
            onEmitColor4:{
                window.fontColor=color5
            }
        }
/*************************************Font Color Yellow On Clicked*****************************************/

/*************************************Font Color Yellow On Clicked*****************************************/
    Connections{
        target: testing
            onEmitColor:{
                window.fontColor=color1
            }
        }
/*************************************Font Color Yellow On Clicked*****************************************/

/*************************************Font Color Green On Clicked*****************************************/
        Connections{
            target: testing
                onEmitColor1:{
                    window.fontColor=color2
                }
            }
/*************************************Font Color Green On Clicked*****************************************/

/*************************************Font Color red On Clicked*****************************************/
    Connections{
        target: testing
            onEmitColor2:{
                window.fontColor=color3
            }
        }
/*************************************Font Color red On Clicked*****************************************/

/*************************************Font Color orange On Clicked*****************************************/
    Connections{
        target: testing
            onEmitColor3:{
                 window.fontColor=color4
                }
            }
/*************************************Font Color orange On Clicked*****************************************/
/*************************************Niddle Color Reset On Clicked*****************************************/
    Connections{
        target: testing
        onEmitNiddle5:{
          window.nColor=path5
        }
    }
/*************************************Niddle Color Reset On Clicked*****************************************/
/*************************************Niddle Color Yellow On Clicked*****************************************/
    Connections{
        target: testing
        onEmitNiddle1:{
          window.nColor=path1
        }
    }
/*************************************Niddle Color Yellow On Clicked*****************************************/

/*************************************Niddle Color Green On Clicked*****************************************/
        Connections{
            target: testing
            onEmitNiddle2:{
                window.nColor=path2
            }
        }
/*************************************Niddle Color Green On Clicked*****************************************/

/*************************************Niddle Color red On Clicked*****************************************/
    Connections{
        target: testing
            onEmitNiddle3:{
            window.nColor=path3

            }
        }
/*************************************Niddle Color red On Clicked*****************************************/

/*************************************Niddle Color orange On Clicked*****************************************/
    Connections{
        target: testing
            onEmitNiddle4:{
              window.nColor=path4

            }
        }
/*************************************Niddle Color orange On Clicked*****************************************/

/*************************************CAR DASHBOARD SECTION*****************************************/
    Image {
        id: cardashboard
        source: "qrc:/Image/car_dasboardp.jpg"
        width:710
        height:450
        anchors.centerIn: parent
            Label {
                id:l1
                text: "time"
                font.bold: true
                color: "white"
                font.pixelSize: 15
                x: 300
                y: 60
            }
               Timer {
                   id:timer1
                   interval: 500
                   repeat: true
                   running: true
                   triggeredOnStart: true
               onTriggered: {
                    l1.text=new Date().toLocaleTimeString(Qt.locale("en_US"),"hh:mm:ss ap")
                    }
               }
/*************************************UPPER BEAM LIGHT CONNECTION*****************************************/
    Rectangle {
            id:r1
            x: 136
            y: 180
            width: 30
            height: 30
            radius: width
            anchors.verticalCenterOffset: -83
            anchors.horizontalCenterOffset: -8
            color: whitecolor
            anchors.centerIn: parent
        Image {
            id: upper
            source: "qrc:/Image/Up Beamlight.png"
            height: 20
            width: 20
            anchors.centerIn: parent
        }
        MouseArea {
            id:myarea2
            anchors.fill: parent
            onClicked: {
                if(r1.color===whitecolor)
                    r1.color=orangecolor
                else
                    r1.color=whitecolor
            }
        }
    }
/*************************************UPPER BEAM LIGHT CONNECTION*****************************************/

/*************************************RIGHT INDICATOR*****************************************/
    Rectangle {
        id:r2
        x: 370
        y: 127
        width: 30
        height: 30
        radius: width
        color: whitecolor

        Image {
            id: rightindicator
            source: "qrc:/Image/arrow_Right.png"
            width: 20
            height: 20
            anchors.centerIn: parent
        }
    }
/*************************************RIGHT INDICATOR*****************************************/

/*************************************LEFT INDICATOR*****************************************/
    Rectangle {
            id:r3
            x: 294
            y: 127
            width: 30
            height: 30
            radius: width
            color: whitecolor
        Image {
            id: leftindicator
            source: "qrc:/Image/arrow_Left.png"
            width: 20
            height: 20
            anchors.centerIn: parent
        }
    }
/*************************************LEFT INDICATOR*****************************************/

/*************************************BATTERY*****************************************/
    Rectangle {
            id:r4
            x: 332
            y: 165
            width: 30
            height: 30
            radius: width
            color: whitecolor
        Image {
            id: battery
            source: "qrc:/Image/Battery.png"
            height: 20
            width: 20
            anchors.centerIn: parent
            }
        }
/*************************************BATTERY*****************************************/

/*************************************DEEP BEAM LIGHT*****************************************/
        Rectangle {
            id:r5
            x: 661
            y: 331
            width: 23
            height: 23
            radius: width
            color: whitecolor
            Image {
                id: deep
                source: "qrc:/Image/Deep BeamLight.png"
                height: 18
                width: 18
                anchors.centerIn: parent
            }
            MouseArea {
                id:myarea4
                anchors.fill: parent
                onClicked: {
                        if(r5.color===whitecolor)
                            r5.color=orangecolor
                        else
                            r5.color=whitecolor
                    }
                }
            }
/*************************************DEEP BEAM LIGHT*****************************************/

/*************************************UP&DEEP BEAM LIGHT*****************************************/
        Rectangle {
            id:r6
            x: 332
            y: 203
            width: 30
            height: 30
            radius: width
            color: whitecolor
            Image {
                id: upanddeep
                source: "qrc:/Image/Up&DeepCombination.png"
                width: 20
                height: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id:myarea5
                anchors.fill: parent
                onClicked: {
                        if(r6.color===whitecolor)
                            r6.color=orangecolor
                        else
                            r6.color=whitecolor
                    }
                }
            }
/*************************************UP&DEEP BEAM LIGHT*****************************************/

/*************************************FUEL*****************************************/
    Rectangle {
            id:r7
            x: 620
            y: 331
            width: 23
            height: 23
            radius: width
            color: whitecolor
            Image {
                id: fule
                source: "qrc:/Image/fule (2).png"
                height: 18
                width: 18
                anchors.centerIn: parent
                }
            }
/*************************************FUEL*****************************************/

/*************************************PARKING*****************************************/
        Rectangle {
            id:r8
            x: 332
            y: 331
            width: 30
            height: 30
            radius: width
            color: redcolor
            Image {
                id: park
                source: "qrc:/Image/Parking.png"
                height: 20
                width: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id:myarea6
                anchors.fill: parent
                onClicked: {
                        testing.parking()
                        if(r8.color===redcolor){
                            r3.color=greencolor
                            r2.color=greencolor
                            r8.color=greencolor

                        }
                      else{
                            r8.color=redcolor
                            r2.color=whitecolor
                            r3.color=whitecolor
                        }
                    }
                }
            }
/*************************************PARKING*****************************************/

/*************************************TEMPERATURE NEEDLE*****************************************/
        Rectangle{
             id:tempCount
             x:72
             y:320

          Text {
             id:tempDisp
             color:fontColor
             font.bold: true
             font.pixelSize: 10
             anchors.centerIn: parent
             text: {
                if(t<=123) { "Cool:"+"10C" }
                else if(t<=128) { "Cool:"+"11C" }
                else if(t<=132) { "Cool:"+"12C" }
                else if(t<=136) { "Cool:"+"13C" }
                else if(t<=140) { "Cool:"+"14C" }
                else if(t<=144) { "Cool:"+"15C" }
                else if(t<=148) { "Cool:"+"16C" }
                else if(t<=152) { "Cool:"+"17C" }
                else if(t<=156) { "Cool:"+"18C" }
                else if(t<=160) { "Light Cool:"+"19C" }
                else if(t<=164) { "Light Cool:"+"20C" }
                else if(t<=168) { "Light Cool:"+"21C" }
                else if(t<=172) { "Light Cool:"+"22C" }
                else if(t<=176) { "Light Cool:"+"23C" }
                else if(t<=179) { "Light Cool:"+"24C" }
                else if(t<=183) { "Light Cool:"+"25C" }
                else if(t<=187) { "Medium:"+"26C" }
                else if(t<=191) { "Medium:"+"27C" }
                else if(t<=195) { "Medium:"+"28C" }
                else if(t<=199) { "Medium:"+"29C" }
                else if(t<=203) { "Medium:"+"30C" }
                else if(t<=207) { "Medium:"+"31C" }
                else if(t<=211) { "Medium:"+"32C" }
                else if(t<=215) { "Hot:"+"33C" }
                else if(t<=219) { "Hot:"+"34C" }
                else if(t<=224) { "Hot:"+"35C" }
                else if(t<=228) { "Hot:"+"36C" }
                else if(t<=232) { "Hot:"+"37C" }
                else { "Temp" }
            }
        }
    }
        Rectangle {
            id:r9
            x: 18
            y: 285
            width: 23
            height: 23
            radius: width
            color: bluecolor
            Image {
                id: temprature
                source: "qrc:/Image/Temperature.png"
                height: 18
                width: 18
                anchors.centerIn: parent
            }
        }

        Image {
            id: niddletemp
            source: nColor
            x: 39
            y: 293
            width: 60
            height: 60

        transform: Rotation{
            origin.x:30
            origin.y:15
            angle: Math.min(Math.max(t),232)
            }
        }
/*************************************TEMPERATURE NEEDLE*****************************************/

/*************************************RPM NEEDLE*****************************************/
        Rectangle {
             id:rpmCount
             x:223
             y:280
          Text {
             id:rpmDisp
             color:fontColor
             font.bold: true
             font.pixelSize: 10
             anchors.centerIn: parent
             text:{ if(rp===121) { "2X100 Rpm" }
                    else if(rp===160) { "3X100 Rpm" }
                    else if(rp===199) { "4X100 Rpm" }
                    else if(rp===238) { "5X100 Rpm" }
                    else { "6X100 Rpm" }
                }
            }
        }


        Image {
            id: niddlerpm
            source: nColor
            x: 163
            y: 280
            width: 118
            height: 118

            transform: Rotation{
                origin.x:60
                origin.y:25
                angle: Math.min(Math.max(rp),274)
            }
        }
/*************************************RPM NEEDLE*****************************************/

/*************************************SPEED NEEDLE*****************************************/
        Rectangle {
             id:speedCount
             x:473
             y:280

          Text {
             id:speedDisp
             color:fontColor
             font.bold: true
             font.pixelSize: 10
             anchors.centerIn: parent
             text:{
//               speedDisp.text=sm+i+"Kph"
//               while((j+i)<=181)
//               {
//                   speedDisp.text=i+"Kph"
//                   i=i+9
//               }
//                 sm
                if(sm===111) { "40 Kph" }
                else if(sm===129){ "60 Kph" }
                else if(sm===147){ "80 Kph" }
                else if(sm===165){ "100 Kph" }
                else if(sm===188){ "120 Kph" }
                else if(sm===201){ "140 Kph" }
                else if(sm===219){ "160 Kph" }
                else if(sm===237){ "180 Kph" }
                else if(sm===255){ "200 Kph" }
                else if(sm===273){ "220 Kph" }
                else { "220 Kph" }
            }
        }
    }

        Image {
            id: niddlespeed
            source: nColor
            x: 415
            y: 284
            width: 118
            height: 118

        transform: Rotation{
            origin.x:60
            origin.y:25
            angle: Math.min(Math.max(sm),272)
            }

        }
/*************************************SPEED NEEDLE*****************************************/

/*************************************Fuel NEEDLE*****************************************/
        Rectangle {
             id:fuleCount
             x:653
             y:318

          Text {
             id:fuleDisp
             color:fontColor
             font.bold: true
             font.pixelSize: 10
             anchors.centerIn: parent
             text:{

                 if(ft===200){ "Fuel Level 15%" }
                 else if(ft===215){ "Fuel Level 10%" }
                 else if(ft===224){ "Fuel Level 5%" }
                 else if(ft===230){ "Empty" }
                 else{ "Fuel" }
            }
        }
    }

        Image {
            id: niddlefule
            source: nColor
            x: 618
            y: 289
            width: 60
            height: 60

        transform: Rotation{
            origin.x:30
            origin.y:15
            angle: Math.min(Math.max(ft),231)
            }
        }
/*************************************Fuel NEEDLE*****************************************/

        Image {
            id: fuel
            source: "qrc:/Image/fuel.png.png"
            width: 140
            height: 80
            x:576
            y:255
        }
        Image {
            id: temp1
            source: "qrc:/Image/Temp.png.png"
            width: 140
            height: 80
            x:0
            y:255
        }
/*************************************EngineTime Section*****************************************/
        Rectangle {
            id:enginebackground
            width: 80
            height: 30
            radius: 10
            x:440
            y:340
            color: "grey"
            gradient: Gradient{
                GradientStop{position:0.6 ; color:"grey"}
                GradientStop{position:1.0 ; color:"transparent"}
            }

      Row {
        id:enginetimerow
        anchors.centerIn: parent
        spacing: 5
        Text {
            id: ehr
            width:20
            height: 20
            text:h+"h-"
            color:fontColor
            font.bold: true
            font.pixelSize: 15
        }
        Text {
            id: emin
            width:20
            height: 20
            color: fontColor
            font.bold: true
            font.pixelSize: 15
            text:m+"m-"
        }
        Text {
            id: esec
            width:20
            height: 20
            color: fontColor
            font.bold: true
            font.pixelSize: 15
            text:s+"s"
                }
            }
        }
        Text {
            id: name
            width:20
            height: 20
            text:"Engine:"
            x:390
            y:343
            color: fontColor
            font.italic: true
            font.pixelSize: 15
        }
/*************************************EngineTime Section*****************************************/
/*************************************Onclicked Stering open new dialog*****************************************/
        Image{
            id:steringImage
            width: 90
            height: 60
            x: 305
            y: 380
            source:"qrc:/Image/Sterring.png"
            MouseArea {
                id:mySec
                anchors.fill: parent
                onClicked: {
                   var component = Qt.createComponent("SecondWindow.qml")      //Onclicked open new window
                    thirdwindow =component.createObject(window)
                    thirdwindow.show()                                         //display SecondWindow window
                }
            }
        }
/*************************************Onclicked Stering open new dialog*****************************************/
/*************************************Onclicked Stop rectangle all speedniddle and engine time working stop*****************************************/
    Rectangle {
        id: stop
        width: 30
        height: 30
        radius: width
        color: "red"
        x: 650
        y: 20
        Text {
            text: "Stop"
            color:"black"
            font.bold: true
            font.pixelSize: 10
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
                onClicked:{
                    database.addEngineTime(s,m,h)         //Here when you click stop button then engine time are stored in db.
                    testing.stopTimers()                  //Here stop the all speedometer working
                   }
                }
            }
/*************************************Onclicked Stop rectangle all speedniddle and engine time working stop*****************************************/
    }
}
