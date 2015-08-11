import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtMultimedia 5.4
import QtWebKit 3.0

ApplicationWindow {
    id: zy000
    visible: true
    width: 800
    height: 480

    //BGM
    MediaPlayer {
        autoPlay: true
        volume: 0.5
        source: "qrc:/ydgqq5.mp3"
    }

    //整体可拖动
    MouseArea {
        id: dragRegion
        anchors.fill: parent
        property point clickPos: "0,0"
        onPressed: {
            clickPos  = Qt.point(mouse.x,mouse.y)
            }
        onPositionChanged: {
        //鼠标偏移量
        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
        //如果mainwindow继承自QWidget,用setPos
        mainwindow.setX(mainwindow.x+delta.x)
        mainwindow.setY(mainwindow.y+delta.y)
        }
        onEntered: {
            fudong.start()
        }
    }

    //MainPage
    Item {
        id: mainpage
        visible: true
        width: 800
        height: 480

        //背景图
        Image {
            anchors.fill: parent
            opacity: 0.95
            source: "qrc:/DNA1.jpg"
        }

        //MCCAP字样
        Image {
            id: mccap
            source: "qrc:/mccap1.gif"
            anchors.left: parent.left
            anchors.leftMargin: 500
            anchors.top: parent.top
            anchors.topMargin: 20
            MouseArea {
                anchors.fill: parent
                anchors.margins: 26
                hoverEnabled: true
                onEntered: {
                    mccap.source = "qrc:/mccap2.gif"
                    touchmccap.start()
                }
                onExited: {
                    mccap.source = "qrc:/mccap1.gif"
                    leavemccap.start()
                    jianxiepaopao2.start()
                }
            }
        }

        //碰触MCCAP效果
        SequentialAnimation{
            id: touchmccap
            RotationAnimation {
                target:	mccap
                property: "scale"
                to:	0.98
                duration: 150
            }
        }

        //离开MCCAP效果
        SequentialAnimation{
            id: leavemccap
            RotationAnimation {
                target:	mccap
                property: "scale"
                to:	1.0
                duration: 150
            }
        }

        //下方灰色条
        Rectangle {
            width: parent.width
            height: 25
            color: "#555555"
            opacity: 0.7
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            Text {
                id: uestc
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 0
                text: "UESTC Software Team"
                font.pixelSize:16
                font.bold: true
                font.family: "Segoe Script"
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        uestc.font.bold = true
                        uestc.font.pixelSize = 17
                        uestc.anchors.leftMargin = 22
                        uestc.anchors.topMargin = -2
                        jianxiepaopao1.start()
                    }
                    onExited: {
                        uestc.font.bold = false
                        uestc.font.pixelSize = 16
                        uestc.anchors.leftMargin = 25
                        uestc.anchors.topMargin = 0
                    }
                }
            }
        }

        //按钮1
        Button {
            id: go2p1
            width:  165
            height: 165
            opacity: 1.0
            x: 100; y: 170
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b1text
                        anchors.centerIn: parent
                        text: "Ogainsms\nSelector"
                        color: "FloralWhite"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 18 : 15
                    }
                }
            }
            onClicked: {
                mainpage.visible = false
                page_1.visible = true
            }
        }

        //按钮2
        Button {
            id: go2p2
            width:  165
            height: 165
            opacity: 1.0
            x: 250; y: 176
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b2text
                        anchors.centerIn: parent
                        text: "EssantialGene\n Result"
                        color: "FloralWhite"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 18 : 15
                    }
                }
            }
            onClicked: {
                mainpage.visible = false
                page_2.visible = true
                flow2center.running = true
            }
        }

        //按钮3
        Button {
            id: go2p3
            width:  165
            height: 165
            opacity: 1.0
            x: 400; y: 170
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b3text
                        anchors.centerIn: parent
                        text: "Metabolic\nPathway"
                        color: "FloralWhite"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 18 : 15
                    }
                }
            }
            onClicked: {
                mainpage.visible = false
                page_3.visible = true
            }
        }

        //按钮4
        Button {
            id: go2p4
            width:  165
            height: 165
            opacity: 1.0
            x: 550; y: 164
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b4text
                        anchors.centerIn: parent
                        text: "Metabolic\nModule"
                        color: "FloralWhite"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 18 : 15
                    }
                }
            }
            onClicked: {
                mainpage.visible = false
                page_4.visible = true
            }
        }

        //间歇性水泡1
        Image {
            id: paopao1
            width: 40
            height: 40
            x: 100; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡2
        Image {
            id: paopao2
            width: 35
            height: 35
            x: 100; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡3
        Image {
            id: paopao3
            width: 25
            height: 25
            x: 50; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡4
        Image {
            id: paopao4
            width: 40
            height: 40
            x: 725; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡5
        Image {
            id: paopao5
            width: 35
            height: 35
            x: 725; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡6
        Image {
            id: paopao6
            width: 25
            height: 25
            x: 770; y: 510
            source: "qrc:/sjq1.png"
        }

        //间歇性水泡动画效果（左）
        SequentialAnimation	{
            id: jianxiepaopao1
            ParallelAnimation {
                //pp1
                PropertyAnimation {
                    target: paopao1
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: -10
                    duration: 600
                }
                PropertyAnimation {
                    target: paopao1
                    property: "y"
                    to: -100
                    duration: 600
                }
                PropertyAnimation {
                    target: paopao1
                    properties: "width, height"
                    to: 85
                    duration: 600
                }
                //pp2
                PropertyAnimation {
                    target: paopao2
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: 20
                    duration: 750
                }
                PropertyAnimation {
                    target: paopao2
                    property: "y"
                    to: -70
                    duration: 750
                }
                PropertyAnimation {
                    target: paopao2
                    properties: "width, height"
                    to: 80
                    duration: 750
                }
                //pp3
                PropertyAnimation {
                    target: paopao3
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: 80
                    duration: 900
                }
                PropertyAnimation {
                    target: paopao3
                    property: "y"
                    to: -40
                    duration: 900
                }
                PropertyAnimation {
                    target: paopao3
                    properties: "width, height"
                    to: 65
                    duration: 900
                }
            }
            ParallelAnimation {
                PropertyAnimation {
                    target: paopao1
                    property: "x"
                    to: 100
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao1
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao1
                    properties: "width, height"
                    to: 40
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao2
                    property: "x"
                    to: 100
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao2
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao2
                    properties: "width, height"
                    to: 35
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao3
                    property: "x"
                    to: 50
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao3
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao3
                    properties: "width, height"
                    to: 25
                    duration: 0
                }
            }
        }

        //间歇性水泡动画效果（右）
        SequentialAnimation	{
            id: jianxiepaopao2
            ParallelAnimation {
                //pp4
                PropertyAnimation {
                    target: paopao4
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: 770
                    duration: 600
                }
                PropertyAnimation {
                    target: paopao4
                    property: "y"
                    to: -100
                    duration: 600
                }
                PropertyAnimation {
                    target: paopao4
                    properties: "width, height"
                    to: 80
                    duration: 600
                }
                //pp5
                PropertyAnimation {
                    target: paopao5
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: 760
                    duration: 800
                }
                PropertyAnimation {
                    target: paopao5
                    property: "y"
                    to: -80
                    duration: 800
                }
                PropertyAnimation {
                    target: paopao5
                    properties: "width, height"
                    to: 75
                    duration: 800
                }
                //pp6
                PropertyAnimation {
                    target: paopao6
                    property: "x"
                    easing.type: Easing.OutCubic
                    to: 700
                    duration: 900
                }
                PropertyAnimation {
                    target: paopao6
                    property: "y"
                    to: -40
                    duration: 900
                }
                PropertyAnimation {
                    target: paopao6
                    properties: "width, height"
                    to: 60
                    duration: 900
                }
            }
            ParallelAnimation {
                PropertyAnimation {
                    target: paopao4
                    property: "x"
                    to: 725
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao4
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao4
                    properties: "width, height"
                    to: 40
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao5
                    property: "x"
                    to: 725
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao5
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao5
                    properties: "width, height"
                    to: 35
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao6
                    property: "x"
                    to: 770
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao6
                    property: "y"
                    to: 510
                    duration: 0
                }
                PropertyAnimation {
                    target: paopao6
                    properties: "width, height"
                    to: 25
                    duration: 0
                }
            }
        }

        //按钮浮动效果
        ParallelAnimation {
            id: fudong
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p1
                    property: "y"
                    from: 170
                    to: 176
                    duration: 1750
                }
                NumberAnimation {
                    targets: go2p1
                    property: "y"
                    from: 176
                    to: 170
                    duration: 1500
                }
                NumberAnimation {
                    targets: go2p1
                    property: "y"
                    from: 170
                    to: 164
                    duration: 1300
                }
                NumberAnimation {
                    targets: go2p1
                    property: "y"
                    from: 164
                    to: 170
                    duration: 1600
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p2
                    property: "y"
                    from: 176
                    to: 170
                    duration: 1600
                }
                NumberAnimation {
                    targets: go2p2
                    property: "y"
                    from: 170
                    to: 164
                    duration: 1400
                }
                NumberAnimation {
                    targets: go2p2
                    property: "y"
                    from: 164
                    to: 170
                    duration: 1650
                }
                NumberAnimation {
                    targets: go2p2
                    property: "y"
                    from: 170
                    to: 176
                    duration: 1850
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p3
                    property: "y"
                    from: 170
                    to: 164
                    duration: 1800
                }
                NumberAnimation {
                    targets: go2p3
                    property: "y"
                    from: 164
                    to: 170
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p3
                    property: "y"
                    from: 170
                    to: 176
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p3
                    property: "y"
                    from: 176
                    to: 170
                    duration: 1600
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p4
                    property: "y"
                    from: 164
                    to: 170
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p4
                    property: "y"
                    from: 170
                    to: 176
                    duration: 1100
                }
                NumberAnimation {
                    targets: go2p4
                    property: "y"
                    from: 176
                    to: 170
                    duration: 1600
                }
                NumberAnimation {
                    targets: go2p4
                    property: "y"
                    from: 170
                    to: 164
                    duration: 1800
                }
            }
            loops: Animation.Infinite
        }
    }

    //Page_1
    Item {
        id: page_1
        anchors.fill: parent
        visible: false
        opacity: 1.0
        Image {
            anchors.fill: parent
            source: "qrc:/p1_bkgrd.jpg"
        }

        //左侧标题
        Rectangle {
            id: label
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.leftMargin: 20
            width: parent.width*0.45
            height: 50
            color: "transparent"
            Text {
                anchors.centerIn: parent
                wrapMode: Text.Wrap
                text: qsTr("Plese choose the spcies that you want to study!")
                font.family: "Segoe UI"
                font.bold: true
                color: "white"
                font.pixelSize: 15
            }
        }

        //右侧标题
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: 20
            width:parent.width*0.45
            anchors.left: unselect.right
            anchors.leftMargin: 20
            height: 50
            color:"transparent"
            Text {
                anchors.centerIn: parent
                wrapMode: Text.Wrap
                text:qsTr("The spcies that have been selected")
                font.family: "Segoe UI"
                font.bold: true
                color: "white"
                font.pixelSize: 15
            }
        }

        //左侧未选择列表
        Item {
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            id:unselect
            anchors.top:label.bottom
            anchors.left: parent.left
            width:parent.width*0.5
            height: parent.height*0.8

            ListView{
                id:unselectlist
                anchors.centerIn: parent.Center
                width: parent.width*0.9
                height: parent.height*0.9
                clip:true
                cacheBuffer: 0
                model:unselect_sp
                ListModel{
                    id:unselect_sp
                    ListElement{
                        name:"aci"
                    }
                    ListElement{
                        name:"bsu"
                    }
                    ListElement{
                        name:"eco"
                    }
                    ListElement{
                        name:"ftn"
                    }
                    ListElement{
                        name:"hin"
                    }
                    ListElement{
                        name:"hpy"
                    }
                    ListElement{
                        name:"mge"
                    }
                    ListElement{
                        name:"mpu"
                    }
                    ListElement{
                        name:"mtu"
                    }
                    ListElement{
                        name:"pau"
                    }
                    ListElement{
                        name:"sao"
                    }
                    ListElement{
                        name:"spr"
                    }
                    ListElement{
                        name:"spu"
                    }
                    ListElement{
                        name:"stm"
                    }
                    ListElement{
                        name:"stt"
                    }
                    ListElement{
                        name:"vch"
                    }
                }
                //项目属性
                delegate: Item{
                    id:itemdelegate
                    width: parent.width
                    height:
                         index === unselectlist.currentIndex?70:(
                         index === unselectlist.currentIndex-1||index === unselectlist.currentIndex+1?40:(
                         index === unselectlist.currentIndex-2||index === unselectlist.currentIndex-2?30:20))
                    Behavior on height{
                        SmoothedAnimation{velocity:100}
                    }
                    //拖动属性
                    Drag.active:mouseaction.drag.active
                    Drag.dragType: Drag.Automatic
                    Drag.mimeData: {"index":index,"type":"unselect"}
                    Drag.onDragStarted: {
                    }
                    Drag.onDragFinished: {
                    }
                    //外观
                    Rectangle{
                        radius: parent.height*0.2
                        id:rec
                        anchors.fill:parent
                        color:index%2==1?"white":"#66CCFF"
                        Text{
                            height:parent.height
                            text:name
                            elide: Text.ElideMiddle
                            fontSizeMode: Text.VerticalFit
                            verticalAlignment: Text.AlignVCenter
                            color:"black"
                            font.pixelSize: 40
                            minimumPixelSize: 17
                        }
                    }
                    //鼠标
                    MouseArea{
                        id:mouseaction
                        anchors.fill: parent
                        hoverEnabled: true
                        z:10
                        onEntered: {
                            unselectlist.currentIndex=index
                        }
                        onReleased: {
                            parent.x=0
                            unselect_sp.insert(index,unselect_sp.get(index))
                            unselect_sp.remove(index)
                        }
                        onDoubleClicked:{
                            select_sp.append(unselect_sp.get(index))
                            unselect_sp.remove(index)
                        }
                        drag.target:parent
                    }
                }
            }
        }

        //右侧已选择列表
        Item {
            width: parent.width*0.45
            height: unselect.height
            anchors.top:unselect.top
            anchors.left: unselect.right

            ListView{
                id:selectlist
                anchors.fill:parent
                model:select_sp
                ListModel{
                    id:select_sp

                }
                delegate:Item{
                    width:parent.width
                    height: 30
                    Rectangle{
                        anchors.fill: parent
                        radius: parent.height*0.2
                        color:index%2==0?"white":"#66CCFF"
                        Text{
                            text:name
                            color:"black"
                            font.pixelSize: 25
                        }
                    }
                    Drag.active:_mouseaction.drag.active
                    Drag.dragType: Drag.Automatic
                    Drag.mimeData: {"index":index,"type":"select"}

                    MouseArea{
                        id:_mouseaction
                        anchors.fill: parent
                        drag.target: parent
                        onReleased: {
                            parent.x=0
                            select_sp.insert(index,select_sp.get(index))
                            select_sp.remove(index)
                        }
                        onDoubleClicked:{
                            unselect_sp.append(select_sp.get(index))
                            select_sp.remove(index)
                        }
                    }
                }
            }
        }

        //拖动目标释放属性设置
        DropArea {
            anchors.fill: parent
            onEntered: {

            }
            onPositionChanged: {
                drag.accepted=true
                ani.x=drag.x
                ani.y=drag.y
                ani.visible=true
            }

            onExited: {
            }
            onDropped: {
                ani.visible=false
                if(drop.proposedAction==Qt.MoveAction&&drop.x>width*0.5&&drop.getDataAsString("type")==="unselect"){
                    select_sp.append(unselect_sp.get(parseInt(drop.getDataAsString("index"))))
                    unselect_sp.remove(parseInt(drop.getDataAsString("index")),1)
                }
                else if(drop.proposedAction==Qt.MoveAction&&drop.x<width*0.5&&drop.getDataAsString("type")==="select"){
                    unselect_sp.append(select_sp.get(parseInt(drop.getDataAsString("index"))))
                    select_sp.remove(parseInt(drop.getDataAsString("index")),1)
                }
            }
        }

        //拖动时跟随的图片
        Item {
            id: ani
            visible: false
            width: 40
            height: 40
            Image {
                id: ani_image
                source: "qrc:/loader.gif"
            }
            z: 5
        }

        //下一步按钮（进Page2）
        Button {
            width: 40
            height: 40
            x: 680; y:420
            text: "List"
            onClicked: {
                page_1.visible = false
                page_2.visible = true
                flow2center.running = true
            }
        }

        //Home按钮
        Button {
            width: 40
            height: 40
            x: 740; y:420
            text: "Home"
            onClicked: {
                page_1.visible = false
                mainpage.visible = true
            }
        }
    }

    //Page_2
    Item {
        id: page_2
        visible: false
        width: 800
        height: 480

        //设置背景图片
        Image {
            id: backgound
            anchors.fill: parent
            source: "qrc:/beijing001.jpg"
            opacity: 1.0
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
                font.family: "Segoe Script"
                font.pixelSize: 14
                font.bold: true
                color: "white"
                opacity: 0.0
            }
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/sjq1_wuyy.png" : "qrc:/sjq2_wuyy.png") : "qrc:/sjq1_wuyy.png"
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
                font.family: "Segoe Script"
                font.pixelSize: 14
                font.bold: true
                color: "white"
                opacity: 0.0
            }
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/sjq1_wuyy.png" : "qrc:/sjq2_wuyy.png") : "qrc:/sjq1_wuyy.png"
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
                font.family: "Segoe Script"
                font.pixelSize: 14
                font.bold: true
                color: "white"
                opacity: 0.0
            }
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/sjq1_wuyy.png" : "qrc:/sjq2_wuyy.png") : "qrc:/sjq1_wuyy.png"
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
                font.family: "Segoe Script"
                font.pixelSize: 14
                font.bold: true
                color: "white"
                opacity: 0.0
            }
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? (control.pressed ? "qrc:/sjq1_wuyy.png" : "qrc:/sjq2_wuyy.png") : "qrc:/sjq1_wuyy.png"
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

        //Home按钮
        Button {
            id: back2mainpage
            width:  60
            height: 60
            opacity: 0.0
            x: 730; y: 10
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b2mtext
                        anchors.centerIn: parent
                        text: control.hovered ? "Home" : ""
                        font.family: "Segoe Script"
                        font.pixelSize: 11
                        font.bold: true
                        color: "white"
                    }
                }
            }
            onClicked: {
                gotoinit.start()
                page_2.visible = false
                mainpage.visible = true
                hidealltanchuang.start()
                tanchuang1.visible = false
                tanchuang2.visible = false
                tanchuang3.visible = false
                tanchuang4.visible = false
            }
        }

        //btns入场
        ParallelAnimation{
            id: flow2center
            PropertyAnimation {         //背景图渐变加深
                target:	backgound
                property: "opacity"
                to:	1.0
                duration: 1500
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
                to: "lightblue"
            }
            ColorAnimation {
                targets: [btn2text, btn3text, btn4text]
                property: "color"
                to: "white"
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
                to: "lightblue"
            }
            ColorAnimation {
                targets: [btn1text, btn3text, btn4text]
                property: "color"
                to: "white"
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
                to: "lightblue"
            }
            ColorAnimation {
                targets: [btn2text, btn1text, btn4text]
                property: "color"
                to: "white"
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
                to: "lightblue"
            }
            ColorAnimation {
                targets: [btn2text, btn3text, btn1text]
                property: "color"
                to: "white"
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

        //btns回归中央位置
        ParallelAnimation {
            id: gotoback
            //所有字号变为最初大小
            PropertyAnimation {
                targets: [btn1text, btn2text, btn3text, btn4text]
                properties: "font.pixelSize"
                to: 14
            }
            //颜色全变白
            ColorAnimation {
                targets: [btn1text, btn2text, btn3text, btn4text]
                property: "color"
                to: "white"
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

        //btns回归界面右侧初始状态
        ParallelAnimation {
            id: gotoinit
            //背景图变成浅色
            PropertyAnimation {
                target:	backgound
                property: "opacity"
                to:	0.4
            }
            //藏于右侧时的字设为透明
            PropertyAnimation {
                targets: [btn1text, btn2text, btn3text, btn4text, back2mainpage]
                property:	"opacity"
                to:	0.0
            }
            //所有字号变为最初大小
            PropertyAnimation {
                targets: [btn1text, btn2text, btn3text, btn4text]
                properties: "font.pixelSize"
                to: 14
            }
            //颜色全变白
            ColorAnimation {
                targets: [btn1text, btn2text, btn3text, btn4text]
                property: "color"
                to: "white"
            }
            //泡泡大小回归初始值
            PropertyAnimation {
                targets: [btn1, btn2, btn3, btn4]
                properties:	"width,height"
                to:	40
            }
            //以下将4个按钮藏到界面右侧
            NumberAnimation	{
                targets: [btn1, btn2, btn3, btn4]
                property:	"x"
                to:	880
            }
            NumberAnimation	{
                targets: [btn1, btn2, btn3, btn4]
                properties:	"y"
                to:	240
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

        //所有弹窗透明度变为0
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

    //Page_3
    Item {
        id: page_3
        visible: false
        width: 800
        height: 480

        Image {
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.top: parent.top
            source: "qrc:/DNA2.png"
        }

        TableView {
            width: 450
            height: 380
            x: 270; y:50
        }

        Button {
            width: 40
            height: 40
            x: 740; y:380
            onClicked: {
                page_3.visible = false
                mainpage.visible = true
            }
        }
    }

    //Page_4
    Item {
        id: page_4
        visible: false
        anchors.fill: parent
        ScrollView {
            width: 650
            height: 400
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.top: parent.top
            anchors.topMargin: 20
            WebView {
                id: webview
                url: "https://www.taobao.com/"
                onNavigationRequested: {
                    var schemaRE = /^\w+:/;
                    if (schemaRE.test(request.url)) {
                        request.action = WebView.AcceptRequest;
                    } else {
                        request.action = WebView.IgnoreRequest;
                    }
                }
            }
        }
        Button {
            width: 40
            height: 40
            x: 740; y:430
            onClicked: {
                page_4.visible = false
                mainpage.visible = true
            }
        }
    }
}
