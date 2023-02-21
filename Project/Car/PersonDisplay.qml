import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
//import QtMultimedia 5.15

Window {
    id:pwindow
    height:480
    width: 740
    visible: true
    color: "white"
    title: qsTr("User Information Window")
/*************************************PROPERTY*****************************************/
    property variant back;
    property string  wallPath:"qrc:/Image/Car_Wallpaper1.jpg"
    property string  fcolor     //Here stored db color
    property string  ecolor     //Here stored db color
    property string  dcolor     //Here stored db color
    property string  ccolor     //Here stored db color
    property string  bcolor     //Here stored db color

    property string  lcolor     //Here stored db niddle path
    property string  mcolor     //Here stored db niddle path
    property string  ncolor     //Here stored db niddle path
    property string  ocolor     //Here stored db niddle path
    property string  tcolor     //Here stored db niddle path

    property string  pcolor     //Here stored db wallpaper
    property string  qcolor     //Here stored db wallpaper
    property string  rcolor     //Here stored db wallpaper
    property string  scolor     //Here stored db wallpaper
    property string  ucolor     //Here stored db wallpaper

    property string  vcolor     //Here stored db dialog color
    property string  wcolor     //Here stored db dialog color
    property string  xcolor     //Here stored db dialog color
    property string  ycolor     //Here stored db dialog color
    property string  zcolor     //Here stored db dialog color

/*************************************PROPERTY*****************************************/

/************************************CONNECTION DEFAULT WALLPAPER*****************************************/
Connections {
    target: testing
       onEmitWallpaper5:{
        pwindow.wallPath=c5
        }
    }
/*************************************CONNECTION DEFAULT WALLPAPER****************************************
/*************************************CONNECTION YELLOW WALLPAPER*****************************************/
Connections {
    target: testing
    onEmitWallpaper1:{
        pwindow.wallPath=c1
    }
}
/*************************************CONNECTION YELLOW WALLPAPER*****************************************/
/*************************************CONNECTION GREEN WALLPAPER*****************************************/
Connections {
    target: testing
    onEmitWallpaper2:{
        pwindow.wallPath=c2
    }
}
/*************************************CONNECTION GREEN WALLPAPER*****************************************/
/*************************************CONNECTION RED WALLPAPER*****************************************/
Connections {
    target: testing
    onEmitWallpaper3:{
        pwindow.wallPath=c3
    }
}
/*************************************CONNECTION RED WALLPAPER*****************************************/
/*************************************CONNECTION ORANGE WALLPAPER*****************************************/
Connections {
    target: testing
    onEmitWallpaper4:{
        pwindow.wallPath=c4
    }
}
/*************************************CONNECTION ORANGE WALLPAPER*****************************************/
/*************************************USER INFORMATION SECTION*****************************************/
   Image {
        id: car
        width:710
        height:450
        anchors.centerIn:  parent
        source:wallPath

        Rectangle {
            id: user
            width: 100
            height: 100
            radius: width
            x:180
            y:330
            color: "red"
            border.color: "white"
            border.width: 2

            Text {
                id: name
                text: qsTr("USER")
                color: "white"
                font.bold: true
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: pop1.open()
            }
        }

        Rectangle {
            id: back
            width: 100
            height: 100
            radius: width
            x:420
            y:330
            color: "orange"
            border.color: "white"
            border.width: 2
            Text {
                id: b1
                text: qsTr("BACK")
                color: "white"
                font.bold: true
                font.pixelSize: 20
                anchors.centerIn: parent
            }
            MouseArea {
                id:ma2
                anchors.fill: parent
                onClicked: {
                   var component =Qt.createComponent("SecondWindow.qml")   //Onclicked open perivous window
                    back = component.createObject(pwindow)
                    back.show()                                            //display SecondWindow window
                }
            }
        }
    }
/*************************************POPUP1*****************************************/
   Popup {
       id:pop1
       width: 200
       height: 80
       anchors.centerIn: parent
       Button {
           id:o
           width: 60
           height: 30
           text: "User"
           x:10
           y:20
           onClicked: {
                   var data=[]
                   var data1=[]
                   var data2=[]
                   var data3=[]
                   var data4=[]

                   data= database.accessPerson()           //Here accesse db person name
                   data1=database.accessColor()            //Here accesse db color
                   data2=database.accessNiddle()           //Here accesse db niddle path
                   data3=database.accessWallPaper()        //Here accesse db wallpaper path
                   data4=database.accessDialog()           //Here accesse db Dialog color

                   console.log(data)
                   fcolor=data1[0];                        //Here stored accesse db color
                   ecolor=data1[1];                        //Here stored accesse db color
                   dcolor=data1[2];                        //Here stored accesse db color
                   ccolor=data1[3];                        //Here stored accesse db color
                   bcolor=data1[4];                        //Here stored accesse db color


                   lcolor=data2[0];                        //Here stored accesse db niddle path
                   mcolor=data2[1];                        //Here stored accesse db niddle path
                   ncolor=data2[2];                        //Here stored accesse db niddle path
                   ocolor=data2[3];                        //Here stored accesse db niddle path
                   tcolor=data2[4];                        //Here stored accesse db niddle path

                   pcolor=data3[0];                        //Here stored accesse db wallpaper path
                   qcolor=data3[1];                        //Here stored accesse db wallpaper path
                   rcolor=data3[2];                        //Here stored accesse db wallpaper path
                   scolor=data3[3];                        //Here stored accesse db wallpaper path
                   ucolor=data3[4];                        //Here stored accesse db wallpaper path

                   vcolor=data4[0];                        //Here stored accesse db Dialog color
                   wcolor=data4[1];                        //Here stored accesse db Dialog color
                   xcolor=data4[2];                        //Here stored accesse db Dialog color
                   ycolor=data4[3];                        //Here stored accesse db Dialog color
                   zcolor=data4[4];                        //Here stored accesse db Dialog color


                   l1.text=data[0]// + "  --  " + data1[0] + "  --  " + data2[0]      //Here pass the name to access in db
                   l2.text=data[1] //+ "  --  " + data1[1] + "  --  " + data2[1]      //Here pass the name to access in db
                   l3.text=data[2]// + "  --  " + data1[2] + "  --  " + data2[2]      //Here pass the name to access in db
                   l4.text=data[3]// + "  --  " + data1[3] + "  --  " + data2[3]      //Here pass the name to access in db
                   l5.text=data[4]
                   pop2.open()                            //Here Display name list
               }
        }
           Button {
               id:p
               width: 60
               height:30
               text: "Add User"
               x:90
               y:20
               onClicked:pop3.open()
            }
           Button {
               id:q
               width: 25
               height:25
               text: "X"
               font.bold: true
               font.pixelSize: 15
               x:167
               y:0
               onClicked: pop1.close()
            }
        }
/*************************************POPUP1*****************************************/
/*************************************POPUP2*****************************************/
   Popup {
       id:pop2
       anchors.centerIn: parent
       width: 150
       height: 100
       Label {
           id:l1
           text: ""
           font.pixelSize: 10
           font.bold: true
           color: "Black"
           x:12
           y:30
           MouseArea{
               anchors.fill: parent
               onClicked: {
                    testing.get(fcolor)
                    testing.niddle1(lcolor)
                    testing.wallpaper1(pcolor)
                    testing.dChange1(vcolor)
               }
           }
        }

       Label {
           id:l2
           text: ""
           font.pixelSize: 10
           font.bold: true
           color: "Black"
           x:12
           y:45
           MouseArea{
               anchors.fill: parent
               onClicked: {
                    testing.get1(ecolor)
                   testing.niddle2(mcolor)
                   testing.wallpaper2(qcolor)
                   testing.dChange2(wcolor)
               }
           }
       }

       Label {
           id:l3
           text: ""
           font.pixelSize: 10
           font.bold: true
           color: "Black"
           x:12
           y:60
           MouseArea{
               anchors.fill: parent
               onClicked: {
                    testing.get2(dcolor)
                   testing.niddle3(ncolor)
                   testing.wallpaper3(rcolor)
                   testing.dChange3(xcolor)
               }
           }
       }

       Label {
           id:l4
           text: ""
           font.pixelSize: 10
           font.bold: true
           color: "Black"
           x:12
           y:75
           MouseArea{
               anchors.fill: parent
               onClicked: {
                    testing.get3(ccolor)
                   testing.niddle4(ocolor)
                   testing.wallpaper4(scolor)
                   testing.dChange4(ycolor)
               }
           }
       }

       Label {
           id:l5
           text: ""
           font.pixelSize: 10
           font.bold: true
           color: "Black"
           x:12
           y:15
           MouseArea{
               anchors.fill: parent
               onClicked: {
                    testing.get4(bcolor)
                   testing.niddle5(tcolor)
                   testing.wallpaper5(ucolor)
                   testing.dChange5(zcolor)
               }
           }
       }

       Button {
           width: 30
           height: 30
           text: "X"
           font.bold: true
           x:100
           y:0
           font.pixelSize: 15
           onClicked: pop2.close()
       }
   }
/*************************************POPUP2*****************************************/
/*************************************POPUP3*****************************************/
       Popup {
           id:pop3
           width: 250
           height: 200
           anchors.centerIn: parent
           Label {
               id:ll1
               font.pixelSize: 10
               font.italic:  true
               text:"Name:- "
               x: 10
               y: 10
            }
            TextField {
                id:t1
                placeholderText: "Enter Name"
                color: "black"
                font.bold: true
                font.pixelSize: 10
                x:60
                y:10
            }
            ComboBox{
                id:combo1
                model: ['Choose Color','yellow','green','red','orange','white']
                x:10
                y:40
            }

            ComboBox{
                id:combo2
                model: ['Choose Niddle','qrc:/Image/NYellow.png','qrc:/Image/NGreen.png','qrc:/Image/NRed.png','qrc:/Image/NOrange.png','qrc:/Image/Needle.png']
                x:130
                y:40
                width: 100
            }
            ComboBox{
                id:combo3
                model: ['Choose Wallpaper','qrc:/Image/YellowW.jpg','qrc:/Image/GreenW.jpg','qrc:/Image/RedW.jpg','qrc:/Image/OrangeW.jpg','qrc:/Image/DefaultW.jpg']
                x:10
                y:80
                width: 100
            }
            ComboBox{
                id:combo4
                model: ['Choose Color','Yellow','Green','Red','Orange','skyblue']
                x: 130
                y: 80
                width: 100
            }

            Button {
                id:e
                width: 60
                height: 30
                text: "Save"
                x:20
                y:110
                onClicked: {
                    console.log(t1.text+combo1.currentText+combo2.currentText+combo3.currentText+combo4.currentText)           //Here Save the all detail
                    database.addPerson(t1.text,combo1.currentText,combo2.currentText,combo3.currentText,combo4.currentText)    //All the detail are passing db
                }
            }
            Button {
                width: 60
                height: 30
                text: "Close"
                x:160
                y:110
                onClicked: pop3.close()
                }
        }
    }
