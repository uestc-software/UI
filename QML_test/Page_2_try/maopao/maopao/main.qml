import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Window {
    visible: true
    width: 800
    height: 480

    //设置背景图片
    Image {
        id: backgound
        anchors.fill: parent
        source: "qrc:/beijing001.jpg"
        opacity: 0.2
        Button {
            id:startflow
            anchors.centerIn: parent
            text: "start"
            onClicked: {
                flow2center.running = true
                destroy(startflow)
            }
        }
    }

    //创建btn1并设置
    Button {
        id: btn1
        width:  40
        height: 40
        x: 880; y: 240
        Text {
            id: btn1text
            anchors.centerIn: parent
            text: "Transport&\nMetabolism"
            font.family: "Verdana"
            font.pixelSize: 14
            opacity: 0.0
        }
        style: ButtonStyle {
            background: BorderImage {
                source: control.hovered ? (control.pressed ? "qrc:/1.png" : "qrc:/2.png") : "qrc:/3.png"
            }
        }
        onClicked: {
            goto1.start()
            showtanchuang1.start()
            tanchuang1.visible = true
            tanchuang2.visible = false
            tanchuang3.visible = false
            tanchuang4.visible = false
        }
    }

    //创建btn2并设置
    Button {
        id: btn2
        width:  40
        height: 40
        x: 880; y: 240
        Text {
            id: btn2text
            anchors.centerIn: parent
            text: "Translation&\nTranscription"
            font.family: "Verdana"
            font.pixelSize: 14
            opacity: 0.0
        }
        style: ButtonStyle {
            background: BorderImage {
                source: control.hovered ? (control.pressed ? "qrc:/1.png" : "qrc:/2.png") : "qrc:/3.png"
            }
        }
        onClicked: {
            goto2.start()
            showtanchuang2.start()
            tanchuang1.visible = false
            tanchuang2.visible = true
            tanchuang3.visible = false
            tanchuang4.visible = false
        }
    }

    //创建btn3并设置
    Button {
        id: btn3
        width:  40
        height: 40
        x: 880; y: 240
        Text {
            id: btn3text
            anchors.centerIn: parent
            text: "General function\nprediction only"
            font.family: "Verdana"
            font.pixelSize: 14
            opacity: 0.0
        }
        style: ButtonStyle {
            background: BorderImage {
                source: control.hovered ? (control.pressed ? "qrc:/1.png" : "qrc:/2.png") : "qrc:/3.png"
            }
        }
        onClicked: {
            goto3.start()
            showtanchuang3.start()
            tanchuang1.visible = false
            tanchuang2.visible = false
            tanchuang3.visible = true
            tanchuang4.visible = false
        }
    }

    //创建btn4并设置
    Button {
        id: btn4
        width:  40
        height: 40
        x: 880; y: 240
        Text {
            id: btn4text
            anchors.centerIn: parent
            text: "Function unknow"
            font.family: "Verdana"
            font.pixelSize: 14
            opacity: 0.0
        }
        style: ButtonStyle {
            background: BorderImage {
                source: control.hovered ? (control.pressed ? "qrc:/1.png" : "qrc:/2.png") : "qrc:/3.png"
            }
        }
        onClicked: {
            goto4.start()
            showtanchuang4.start()
            tanchuang1.visible = false
            tanchuang2.visible = false
            tanchuang3.visible = false
            tanchuang4.visible = true
        }
    }

    //返回主页按钮
    Button {
        id: back2mainpage
        width:  60
        height: 60
        opacity: 0.0
        x: 730; y: 10
        style: ButtonStyle {
            background: BorderImage {
                source: control.hovered ? "qrc:/sjq1.png" : "qrc:/sjq2.png"
                Text {
                    id: b2mtext
                    anchors.centerIn: parent
                    text: control.hovered ? "Home" : ""
                    font.family: "Verdana"
                    font.pixelSize: 11
                }
            }
        }
        onClicked: {

        }
    }

    //btns入场
    ParallelAnimation{
        id: flow2center
        PropertyAnimation {         //背景图渐变加深
            target:	backgound
            property: "opacity"
            to:	0.6
            duration: 2000
        }
        PropertyAnimation {
            targets:	[btn1, btn2, btn3, btn4]
            properties:	"width,height"
            to:	150
            duration: 1800
            easing.type: Easing.OutSine
        }
        PropertyAnimation {
            targets: [btn1text, btn2text, btn3text, btn4text, back2mainpage]
            property:	"opacity"
            to:	1.0
            duration: 2000
        }
        NumberAnimation	{
            target:	btn1
            property:	"x"
            to:	160
            duration: 1800
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	110
            duration: 1800
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	300
            duration: 1600
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	275
            duration: 1600
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	430
            duration: 1400
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	75
            duration: 1400
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	550
            duration: 1200
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	230
            duration: 1200
            easing.type:	Easing.OutBack
        }
    }

    //btn1滚去左上角
    ParallelAnimation {
        id: goto1
        PropertyAnimation {
            target:	btn1
            properties:	"width,height"
            to:	180
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            targets:	[btn2, btn3, btn4]
            properties:	"width,height"
            to:	100
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            target:	btn1text
            property: "font.pixelSize"
            to: 20
        }
        PropertyAnimation {
            targets: [btn2text, btn3text, btn4text]
            properties: "font.pixelSize"
            to: 9
        }
        ColorAnimation {
            target:	btn1text
            property: "color"
            to: "red"
        }
        ColorAnimation {
            targets: [btn2text, btn3text, btn4text]
            property: "color"
            to: "black"
        }
        NumberAnimation	{
            target:	btn1
            property:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	180
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	280
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	380
            duration: 1000
            easing.type:	Easing.OutBack
        }
    }

    //btn2滚去左上角
    ParallelAnimation {
        id: goto2
        PropertyAnimation {
            target:	btn2
            properties:	"width,height"
            to:	180
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            targets:	[btn1, btn3, btn4]
            properties:	"width,height"
            to:	100
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            target:	btn2text
            property: "font.pixelSize"
            to: 20
        }
        PropertyAnimation {
            targets: [btn1text, btn3text, btn4text]
            properties: "font.pixelSize"
            to: 9
        }
        ColorAnimation {
            target:	btn2text
            property: "color"
            to: "red"
        }
        ColorAnimation {
            targets: [btn1text, btn3text, btn4text]
            property: "color"
            to: "black"
        }
        NumberAnimation	{
            target:	btn1
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	180
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	280
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	380
            duration: 1000
            easing.type:	Easing.OutBack
        }
    }

    //btn3滚去左上角
    ParallelAnimation {
        id: goto3
        PropertyAnimation {
            target:	btn3
            properties:	"width,height"
            to:	180
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            targets:	[btn2, btn1, btn4]
            properties:	"width,height"
            to:	100
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            target:	btn3text
            property: "font.pixelSize"
            to: 20
        }
        PropertyAnimation {
            targets: [btn2text, btn1text, btn4text]
            properties: "font.pixelSize"
            to: 9
        }
        ColorAnimation {
            target:	btn3text
            property: "color"
            to: "red"
        }
        ColorAnimation {
            targets: [btn2text, btn1text, btn4text]
            property: "color"
            to: "black"
        }
        NumberAnimation	{
            target:	btn1
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	180
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	280
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	380
            duration: 1000
            easing.type:	Easing.OutBack
        }
    }

    //btn4滚去左上角
    ParallelAnimation {
        id: goto4
        PropertyAnimation {
            target:	btn4
            properties:	"width,height"
            to:	180
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            targets:	[btn2, btn3, btn1]
            properties:	"width,height"
            to:	100
            duration: 1000
            easing.type: Easing.InOutBack
        }
        PropertyAnimation {
            target:	btn4text
            property: "font.pixelSize"
            to: 20
        }
        PropertyAnimation {
            targets: [btn2text, btn3text, btn1text]
            properties: "font.pixelSize"
            to: 9
        }
        ColorAnimation {
            target:	btn4text
            property: "color"
            to: "red"
        }
        ColorAnimation {
            targets: [btn2text, btn3text, btn1text]
            property: "color"
            to: "black"
        }
        NumberAnimation	{
            target:	btn1
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	180
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	280
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	380
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	0
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	0
            duration: 1000
            easing.type:	Easing.InBack
        }
    }

    //btns回归
    ParallelAnimation {
        id: gotoback
        //所有字号变为最初大小
        PropertyAnimation {
            targets: [btn1text, btn2text, btn3text, btn4text]
            properties: "font.pixelSize"
            to: 14
        }
        //颜色全变黑
        ColorAnimation {
            targets: [btn1text, btn2text, btn3text, btn4text]
            property: "color"
            to: "black"
        }
        //大小回归最初
        PropertyAnimation {
            targets: [btn1, btn2, btn3, btn4]
            properties:	"width,height"
            to:	150
            duration: 1000
            easing.type: Easing.InOutBack
        }
        //以下将4个按钮位置复原
        NumberAnimation	{
            target:	btn1
            properties:	"x"
            to:	160
            duration: 1000
            easing.type:	Easing.OutBack      //缓冲曲线
        }
        NumberAnimation	{
            target:	btn1
            properties:	"y"
            to:	110
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"x"
            to:	300
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn2
            properties:	"y"
            to:	275
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"x"
            to:	430
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn3
            properties:	"y"
            to:	75
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"x"
            to:	550
            duration: 1000
            easing.type:	Easing.OutBack
        }
        NumberAnimation	{
            target:	btn4
            properties:	"y"
            to:	230
            duration: 1000
            easing.type:	Easing.OutBack
        }
    }

    //弹窗1出场
    ParallelAnimation {
        id: showtanchuang1
        PropertyAnimation {
             target: tanchuang1
             property: "opacity"
             to: 0.7
             duration: 800
        }
        PropertyAnimation {
             target: tanchuang2
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang3
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang4
             property: "opacity"
             to: 0.0
             duration: 300
        }
    }

    //弹窗2出场
    ParallelAnimation {
        id: showtanchuang2
        PropertyAnimation {
             target: tanchuang1
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang2
             property: "opacity"
             to: 0.7
             duration: 800
        }
        PropertyAnimation {
             target: tanchuang3
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang4
             property: "opacity"
             to: 0.0
             duration: 300
        }
    }

    //弹窗3出场
    ParallelAnimation {
        id: showtanchuang3
        PropertyAnimation {
             target: tanchuang1
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang2
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang3
             property: "opacity"
             to: 0.7
             duration: 800
        }
        PropertyAnimation {
             target: tanchuang4
             property: "opacity"
             to: 0.0
             duration: 300
        }
    }

    //弹窗4出场
    ParallelAnimation {
        id: showtanchuang4
        PropertyAnimation {
             target: tanchuang1
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang2
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang3
             property: "opacity"
             to: 0.0
             duration: 300
        }
        PropertyAnimation {
             target: tanchuang4
             property: "opacity"
             to: 0.7
             duration: 800
        }
    }

    //所有弹窗消失
    ParallelAnimation {
        id: hidealltanchuang
        PropertyAnimation {
             target: tanchuang1
             property: "opacity"
             to: 0.0
             duration: 500
        }
        PropertyAnimation {
             target: tanchuang2
             property: "opacity"
             to: 0.0
             duration: 500
        }
        PropertyAnimation {
             target: tanchuang3
             property: "opacity"
             to: 0.0
             duration: 500
        }
        PropertyAnimation {
             target: tanchuang4
             property: "opacity"
             to: 0.0
             duration: 500
        }
    }

    //弹窗1
    Item {
        id: tanchuang1
        opacity: 0.0
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        width: 650
        height: 480

        Rectangle {
            id: listsquare1
            anchors.left: tanchuang1.left
            anchors.leftMargin: 200
            anchors.top: tanchuang1.top
            anchors.topMargin: 80
            width:  400
            height: 320
            radius: 40
            color: "gray"
            TableView {
                id: geneview1
                anchors.fill: parent
                anchors.margins: 40
                TableViewColumn{
                    title :"Cluster of Essential Gene       Description"
                    role:"name"
                }
                ListModel{
                    id:list1
                    ListElement {name: "         CEG0005           S-adenosylmethionine synthetase"}
                }
                model: list1
            }
        }

        //返回键设置
        Button {
            id: backbutton1
            width:  65
            height: 65
            anchors.left: tanchuang1.left
            anchors.leftMargin: 130
            anchors.bottom: tanchuang1.bottom
            anchors.bottomMargin: 70
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/back1.png" : "qrc:/back2.png") : "qrc:/back3.png"
                }
            }
            onClicked: {
                tanchuang1.visible = false
                hidealltanchuang.start()
                gotoback.start()
            }
        }
    }

    //弹窗2
    Item {
        id: tanchuang2
        opacity: 0.0
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        width: 650
        height: 480

        Rectangle {
            id: listsquare2
            anchors.left: tanchuang2.left
            anchors.leftMargin: 200
            anchors.top: tanchuang2.top
            anchors.topMargin: 80
            width:  400
            height: 320
            radius: 40
            color: "blue"
            TableView {
                id: geneview2
                anchors.fill: parent
                anchors.margins: 40
                TableViewColumn{
                    title :"Cluster of Essential Gene       Description"
                    role:"name"
                }
                ListModel{
                    id:list2
                    ListElement {name: "         CEG0005           S-adenosylmethionine synthetase"}
                }
                model: list2
            }
        }

        //返回键设置
        Button {
            id: backbutton2
            width:  65
            height: 65
            anchors.left: tanchuang2.left
            anchors.leftMargin: 130
            anchors.bottom: tanchuang2.bottom
            anchors.bottomMargin: 70
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/back1.png" : "qrc:/back2.png") : "qrc:/back3.png"
                }
            }
            onClicked: {
                tanchuang2.visible = false
                gotoback.start()
                hidealltanchuang.start()
            }
        }
    }

    //弹窗3
    Item {
        id: tanchuang3
        opacity: 0.0
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        width: 650
        height: 480

        Rectangle {
            id: listsquare3
            anchors.left: tanchuang3.left
            anchors.leftMargin: 200
            anchors.top: tanchuang3.top
            anchors.topMargin: 80
            width:  400
            height: 320
            radius: 40
            color: "#6d2a56"
            TableView {
                id: geneview3
                anchors.fill: parent
                anchors.margins: 40
                TableViewColumn{
                    title :"Cluster of Essential Gene       Description"
                    role:"name"
                }
                ListModel{
                    id:list3
                    ListElement {name: "         CEG0005           S-adenosylmethionine synthetase"}
                }
                model: list3
            }
        }

        //返回键设置
        Button {
            id: backbutton3
            width:  65
            height: 65
            anchors.left: tanchuang3.left
            anchors.leftMargin: 130
            anchors.bottom: tanchuang3.bottom
            anchors.bottomMargin: 70
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/back1.png" : "qrc:/back2.png") : "qrc:/back3.png"
                }
            }
            onClicked: {
                tanchuang3.visible = false
                gotoback.start()
                hidealltanchuang.start()
            }
        }
    }

    //弹窗4
    Item {
        id: tanchuang4
        opacity: 0.0
        visible: false
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        width: 650
        height: 480

        Rectangle {
            id: listsquare4
            anchors.left: tanchuang4.left
            anchors.leftMargin: 200
            anchors.top: tanchuang4.top
            anchors.topMargin: 80
            width:  400
            height: 320
            radius: 40
            color: "#a6d16e"
            TableView {
                id: geneview4
                anchors.fill: parent
                anchors.margins: 40
                TableViewColumn{
                    title :"Cluster of Essential Gene       Description"
                    role:"name"
                }
                ListModel{
                    id:list4
                    ListElement {name: "         CEG0005           S-adenosylmethionine synthetase"}
                }
                model: list4
            }
        }

        //返回键设置
        Button {
            id: backbutton4
            width:  65
            height: 65
            anchors.left: tanchuang4.left
            anchors.leftMargin: 130
            anchors.bottom: tanchuang4.bottom
            anchors.bottomMargin: 70
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/back1.png" : "qrc:/back2.png") : "qrc:/back3.png"
                }
            }
            onClicked: {
                tanchuang4.visible = false
                gotoback.start()
                hidealltanchuang.start()
            }
        }
    }
}
