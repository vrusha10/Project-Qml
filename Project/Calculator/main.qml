import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.3

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Calculator")
    property int i;
    property int a;
    property int b;
    property int c;
    property int check;
    property int check1;
    property int check2;
    property int check3;


        TextEdit {
            id: label1
            x: 81
            y: 86
            width: 371
            height: 69
            text: qsTr(" ")
            font.bold: true
            font.pointSize: 20
        }


    Grid {
        id: grid
        x: 79
        y: 161
        width: 373
        height: 275
        spacing: 10
        rows: 4
        columns: 4
    }

    Button {
        id: button
        x: 79
        y: 161
        width: 89
        height: 63
        text: qsTr("7")
        font.bold: true
        font.pointSize: 20
        onClicked: {
        i = text
        label1.text = label1.text + i
        }
    }

    Button {
        id: button1
        x: 174
        y: 161
        width: 89
        height: 63
        text: qsTr("8")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button2
        x: 269
        y: 161
        width: 89
        height: 63
        text: qsTr("9")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button3
        x: 364
        y: 161
        width: 88
        height: 63
        text: qsTr("*")
        font.bold: true
        font.pointSize: 20
        onClicked: {
        a=label1.text
       testing.mul(a)
            label1.text=" "
            check1=1
        }
    }

    Button {
        id: button4
        x: 79
        y: 230
        width: 89
        height: 63
        text: qsTr("4")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button5
        x: 364
        y: 230
        width: 88
        height: 63
        text: qsTr("-")
        font.bold: true
        font.pointSize: 20
        onClicked: {
         a=label1.text
            testing.sub(a)
            label1.text=""
         check2=1

        }
    }

    Button {
        id: button6
        x: 269
        y: 230
        width: 89
        height: 63
        text: qsTr("6")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button7
        x: 174
        y: 230
        width: 89
        height: 63
        text: qsTr("5")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button8
        x: 81
        y: 299
        width: 85
        height: 65
        text: qsTr("1")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button9
        x: 172
        y: 299
        width: 91
        height: 65
        text: qsTr("2")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button10
        x: 270
        y: 299
        width: 88
        height: 65
        text: qsTr("3")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button11
        x: 364
        y: 299
        width: 88
        height: 65
        text: qsTr("+")
        font.bold: true
        font.pointSize: 20
        onClicked: {
        a = label1.text
            testing.add(a)
            label1.text=" "
            flags=1
            check=1
        }
    }

    Button {
        id: button12
        x: 81
        y: 370
        width: 87
        height: 66
        text: qsTr("0")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            i = text
            label1.text = label1.text + i
        }
    }

    Button {
        id: button13
        x: 270
        y: 370
        width: 88
        height: 66
        text: qsTr("=")
        font.bold: true
        font.pointSize: 20
        onClicked: {
        b=label1.text
            if(check==1){
                var num=testing.add(b)
                label1.text=num
                check=0
            }
            else if(check1==1){
                var num1=testing.mul(b)
                label1.text=num1
                check1=0
            }
            else if(check2==1){
                var num2=testing.sub(b)
                label1.text=num2
                check2=0
            }
            else {
                var num3=testing.divis(b)
                label1.text=num3
            }
        }
    }

    Button {
        id: button14
        x: 364
        y: 370
        width: 88
        height: 66
        text: qsTr("/")
        font.bold: true
        font.pointSize: 20
        onClicked: {
        a=label1.text
            testing.divis(a)
        label1.text = " "
        }
    }

    Button {
        id: button15
        x: 174
        y: 370
        width: 90
        height: 66
        text: qsTr("C")
        font.bold: true
        font.pointSize: 20
        onClicked: {
            label1.text = " "
            testing.clear()
        }
    }
}
