import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("PHONEBOOK")
    Image {
        id: name
        source: "file:///C:/Vrushabh QML/phonebook/address-book-icon-white-vector-16158456.jpg"
        anchors.fill: parent
    }
    property int  check;
    property int  check1;
    property int  click;
    property int  a;
      property int  f;
        Popup {
            id:pop1
            width:200
            height: 100

            Label {
                id:label1
                text: "Saved"
                color: "black"
                anchors.horizontalCenter:  parent.horizontalCenter
                font.bold: true
                font.pixelSize: 10
            }
            Button {
                id:save
                x:75
                y:55
                width: 50
                height: 30
                text: "OK"
                onClicked: {
                    check=1
                    text1.text=""
                    pop1.close()
                   }
                }
            }

        Popup {
            id:pop2
            width:200
            height: 200
            anchors.centerIn: parent

            Label {
                id:label2
                text: "Already ADDED"
                color: "black"
                anchors.horizontalCenter:  parent.horizontalCenter
                font.bold: true
                font.pixelSize: 20
            }
            Button {
                id:exit
                x:60
                y:130
                width: 50
                height: 50
                text: "Exit"
                onClicked: {
                    check=0
                    pop2.close()
                }
            }
        }

    TextField {
        id: text1
        x: 72
        y: 18
        placeholderText: qsTr("Enter Name")
    }
    TextField {
        id: text2
        x: 72
        y: 70
        placeholderText: qsTr("Enter Number ")
    }

    Button {
        id: saVe
        x: 278
        y: 18
        width: 101
        height: 40
        text: qsTr("Save")
        font.bold: true
        font.pointSize: 15
        onClicked: {
            if(testing.personExists(text2.text)===true)
            {
                pop2.open()
            }
            else
            {
                testing.add(text1.text,text2.text)
            }          
            text1.text=""
            text2.text=""
    }
 }

            Popup {
                id:pop3
                width:200
                height: 100
                anchors.centerIn: parent

                Label {
                    id:label5
                    text: "Delete"
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pixelSize: 10
                }
                Button {
                    id:ok
                    x:60
                    y:30
                    width: 50
                    height: 30
                    text: "OK"
                    onClicked: {
                        pop3.close()
                    }
                }
            }

            Popup {
                id:pop4
                width:200
                height: 100
                anchors.centerIn: parent

                Label {
                    id:label6
                    text: "Already Deleted"
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                    font.pixelSize: 10
                }
                Button {
                    id:ok1
                    x:60
                    y:30
                    width: 50
                    height: 30
                    text: "OK"
                    onClicked: {
                        pop4.close()
                        text1.text=""
                         text2.text=""
                    }
                }
            }


    Button {
        id: deLete
        x: 395
        y: 18
        width: 109
        height: 40
        text: qsTr("Delete")
        font.pointSize: 15
        font.bold: true
        onClicked: {
            testing.remove(text1.text,text2.text)
            if(testing.pop2()==0)
            {
                pop3.open()
            }
            if(testing.pop2()==1)
            {
                pop4.open()
            }
            text1.text=""
            text2.text=""
        }
    }

    Button {
        id: conTact
        x: 525
        y: 18
        width: 100
        height: 40
        text: qsTr("Contacts")
        font.bold: true
        font.pointSize: 15
        onClicked: {
       var n1=[]
       var n2=[]
            n1=testing.data()
            n2=testing.contact()
           for(let i=0;i<n1.length;i++)
           {
                        console.log(n2)
                   listView.model.append({val:n1[i] + "\t" + n2[i] })
//               listView.print(n1[i]+n2[i])
               }
            pop5.open()
        }

    }

    Label {
        id: label
        x: 68
        y: 242
        font.bold: true
        font.pointSize: 10
    }

   Label {
        id: namE
        x: 14
        y: 30
        text: qsTr("Name :")
        horizontalAlignment: Text.AlignLeft
        font.bold: true
        font.italic: true
        font.pointSize: 10
    }

  Label {
      id: mobileNumber
      x: 6
      y: 81
      width: 55
      height: 19
      text: qsTr("Mobile No :")
      font.bold: true
      font.pointSize: 9
      font.italic: true
  }

      Popup {
          id:pop5
          width: 200
          height: 300
          anchors.centerIn: parent
          ListView {
              id:listView
              anchors.fill: parent
              model:ListModel{}
              spacing: 5
              delegate: Text {
                  id:d1
                  text: val
               }
            }
          Button {
              id:exitList
              x:60
              y:240
              width: 60
              height: 30
              text: "Exit"
              onClicked: {
                      pop5.close()
                }
             }
         }
     }
