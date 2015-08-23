import QtQuick 2.2
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2
import QtMultimedia 5.4
import QtWebKit 3.0
import QtQuick.Dialogs 1.2
ApplicationWindow {
    id: zy000
    objectName: "rootMCCAP"
    visible: true
    width: 800
    height: 480
    
    function on_response_cluster(jsonStr, count) {
        list1.clear();
        list2.clear();
        list3.clear();
        list4.clear();
        var objArr = JSON.parse(jsonStr);
        for(var i = 0;i < count;i++) {
            switch(objArr[i].category) {
            case 1:
                list1.append({"name" : objArr[i].accessNum, "description" : objArr[i].description});
                break;
            case 2:
                list2.append({"name" : objArr[i].accessNum, "description" : objArr[i].description});
                break;
            case 3:
                list3.append({"name" : objArr[i].accessNum, "description" : objArr[i].description});
                break;
            case 4:
                list4.append({"name" : objArr[i].accessNum, "description" : objArr[i].description});
                break;
            case 5:
                break;
            }
        }
    }

    function on_response_web_load(url) {
        webview.url = url;
    }

    //BGM
    MediaPlayer {
        id: ydgqq
        autoPlay: false
        volume: 0.5
        source: "qrc:/ydgqq5.mp3"
    }

    //整体可拖动
    MouseArea {
        id: dragRegion
        anchors.fill: parent
//        property point clickPos: "0,0"
//        onPressed: {
//            clickPos  = Qt.point(mouse.x,mouse.y)
//            }
//        onPositionChanged: {
//        //鼠标偏移量
//        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
//        //如果mainwindow继承自QWidget,用setPos
//        mainwindow.setX(mainwindow.x+delta.x)
//        mainwindow.setY(mainwindow.y+delta.y)
//        }
        onEntered: {
            fudong.start()
        }
    }

    //MainPage
    Item {
        id: mainpage
        visible: true
        anchors.fill:parent

        //背景图
        Image {
            anchors.fill: parent
            opacity: 0.95
            source: "qrc:/mainpage_background.png"
        }

        //MCCAP字样
        Image {
            id: mccap
            source: "qrc:/mccap1.gif"
            anchors.top:parent.top
            anchors.left:parent.left
            anchors.topMargin: parent.height*0.1
            anchors.leftMargin: parent.width*0.618
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
            color: "transparent"
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

        //设置键
        Image {
            id: setting
            width: 23
            height: 23
            anchors.right: parent.right
            anchors.rightMargin: 10
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 1
            source: "qrc:/setting.png"
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    setpage.visible = true
                }
            }
        }

        //按钮1
        Button {
            id: go2p1
            width:  200
            height: 200
            opacity: 1.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.1
            anchors.top: parent.top
            anchors.topMargin: parent.height/3

            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b1text
                        anchors.centerIn: parent
                        text: "Start "
                        color: "#444444"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 30 : 24
                    }
                }
            }
            onClicked: {
                page_1.visible = true
                page_1_ani.start()
                mainpage_close.start()
            }
            Timer{
                id:mainpage_close
                interval: 250
                onTriggered: {
                    mainpage.visible=false
                }
            }
        }

        //按钮2
        Button {
            id: go2p2
            width:  165
            height: 165
            opacity: 1.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.31
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.21
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                    Text {
                        id: b2text
                        anchors.centerIn: parent
                        text: "Help "
                        color: "#7B9977"
                        font.family: "Segoe Script"
                        font.bold: true
                        font.pixelSize: control.hovered ? 26 : 20
                    }
                }
            }
            onClicked: {
                mainpage.visible = false
                page_2.visible = true
                ruchuang.start()
            }
        }

        //按钮3 (饰)
        Button {
            id: go2p3
            width:  125
            height: 125
            opacity: 1.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.45
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.5
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                }
            }
            onClicked: {
            }
        }

        //按钮4 (饰)
        Button {
            id: go2p4
            width:  60
            height: 60
            opacity: 0.8
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.62
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.64
            style: ButtonStyle {
                background: BorderImage {
                    source: control.hovered ? "qrc:/sjq2.png" : "qrc:/sjq1.png"
                }
            }
            onClicked: {
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
                    property: "anchors.topMargin"
                    from: mainpage.height/3
                    to: mainpage.height/3 + 5
                    duration: 1550
                }
                NumberAnimation {
                    targets: go2p1
                    property: "anchors.topMargin"
                    to: mainpage.height/3
                    duration: 1000
                }
                NumberAnimation {
                    targets: go2p1
                    property: "anchors.topMargin"
                    to: mainpage.height/3 - 5
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p1
                    property: "anchors.topMargin"
                    to: mainpage.height/3
                    duration: 1350
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p2
                    property: "anchors.topMargin"
                    from: mainpage.height*0.21
                    to: mainpage.height*0.21 - 4
                    duration: 1000
                }
                NumberAnimation {
                    targets: go2p2
                    property: "anchors.topMargin"
                    to: mainpage.height*0.21 - 8
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p2
                    property: "anchors.topMargin"
                    to: mainpage.height*0.21 - 4
                    duration: 1350
                }
                NumberAnimation {
                    targets: go2p2
                    property: "anchors.topMargin"
                    to: mainpage.height*0.21
                    duration: 1550
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p3
                    property: "anchors.topMargin"
                    from: mainpage.height*0.5
                    to: mainpage.height*0.5 + 3
                    duration: 1200
                }
                NumberAnimation {
                    targets: go2p3
                    property: "anchors.topMargin"
                    to: mainpage.height*0.5 + 6
                    duration: 1350
                }
                NumberAnimation {
                    targets: go2p3
                    property: "anchors.topMargin"
                    to: mainpage.height*0.5 + 3
                    duration: 1550
                }
                NumberAnimation {
                    targets: go2p3
                    property: "anchors.topMargin"
                    to: mainpage.height*0.5
                    duration: 1000
                }
            }
            SequentialAnimation {
                NumberAnimation {
                    targets: go2p4
                    property: "anchors.topMargin"
                    from: mainpage.height*0.64
                    to: mainpage.height*0.64 - 3
                    duration: 1250
                }
                NumberAnimation {
                    targets: go2p4
                    property: "anchors.topMargin"
                    to: mainpage.height*0.64
                    duration: 1450
                }
                NumberAnimation {
                    targets: go2p4
                    property: "anchors.topMargin"
                    to: mainpage.height*0.64 + 3
                    duration: 900
                }
                NumberAnimation {
                    targets: go2p4
                    property: "anchors.topMargin"
                    to: mainpage.height*0.64
                    duration: 1100
                }
            }
            loops: Animation.Infinite
        }
    }

    //SetPage
    Item {
        id: setpage
        visible: false
        x: 620; y: 320
        width: 180
        height: 130

        Image {
            anchors.fill: parent
            //source: "qrc:/settext.png"

            Button {
                id: stopBGM
                width: 130
                height: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.top: parent.top
                anchors.topMargin: 10
                text: "暂停BGM"
                onClicked: {
                    ydgqq.pause()
                }
            }

            Button {
                id: startBGM
                width: 130
                height: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.top: stopBGM.bottom
                anchors.topMargin: 3
                text: "播放BGM"
                onClicked: {
                    ydgqq.play()
                }
            }

            Button {
                id: exitset
                width: 130
                height: 30
                anchors.left: parent.left
                anchors.leftMargin: 25
                anchors.top: startBGM.bottom
                anchors.topMargin: 3
                text: "退出设置"
                onClicked: {
                    setpage.visible = false
                }
            }
        }
    }

    //Page_1
    Item {
        id: page_1
        anchors.centerIn: parent
        width:parent.width
        height: parent.height
        visible: false
        opacity: 1.0

        NumberAnimation on width{
            id:page_1_ani
            from:0
            to:zy000.width
            duration: 250
        }

        Image {
            anchors.fill: parent
            source: "qrc:/background_2.png"
        }

        //左侧标题
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
            anchors.leftMargin: parent.width*0.05
            width: parent.width*0.45
            height: parent.height*0.1
            color: "transparent"
            Text {
                anchors.centerIn: parent
                wrapMode: Text.Wrap
                text: qsTr("Plese choose the spcies that you want to study!")
                font.family: "Segoe UI"
                font.bold: true
                color: "black"
                font.pixelSize: 15
            }
        }

        //右侧标题
        Rectangle {
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.05
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
                color: "black"
                font.pixelSize: 15
            }
        }

        //左侧未选择列表
        Item {
            id:unselect
            anchors.top:parent.top
            anchors.left: parent.left
            anchors.topMargin:parent.height*0.15
            anchors.leftMargin: parent.width*0.05
            width:parent.width*0.38
            height: parent.height*0.7

            Timer{
                id:moveup
                interval: 200
                repeat:true
                onTriggered: {
                    if(unselectlist.currentIndex>0)
                        unselectlist.currentIndex=unselectlist.currentIndex-1
                }
            }
            Timer{
                id:movedown
                interval: 200
                repeat:true
                onTriggered: {
                    if(unselectlist.currentIndex<unselectlist.count-1)
                        unselectlist.currentIndex=unselectlist.currentIndex+1
                }
            }
            ListView{
                id:unselectlist
                width: parent.width
                height: parent.height-60
                anchors.top: parent.top
                anchors.topMargin: 30
                clip:true
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
                         index === unselectlist.currentIndex?60:(
                         index === unselectlist.currentIndex-1||index === unselectlist.currentIndex+1?40:(
                         index === unselectlist.currentIndex-2||index === unselectlist.currentIndex-2?30:20))
                    Image{
                        anchors.fill: parent
                        source:"qrc:/frame.png"
                        visible: unselectlist.currentIndex==index
                    }
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
                        //radius: parent.height*0.2
                        id:rec
                        anchors.fill:parent
                        //color:index%2==1?"white":"#66CCFF"
                        color:"transparent"
                        Text {
                            id:rec_text
                            anchors.centerIn: parent
                            text:name
                            color: "black"
                            font.pixelSize: unselectlist.currentIndex==index?parent.height-12:parent.height-5
                            font.family: "STXinwei"
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
                            slider.value=unselectlist.count-index-1
                        }
                        onReleased: {
                            parent.x=0
                            var i=index
                            unselect_sp.insert(index,unselect_sp.get(index))
                            unselect_sp.remove(index)
                            unselectlist.currentIndex=i
                        }
                        onPressed: {
                            rec_text.color="red"
                        }
                        onDoubleClicked:{
                            ogCtl.delFromSelOg(ogCtl.tran2ID(unselect_sp.get(index).name));
                            select_sp.append(unselect_sp.get(index))
                            unselect_sp.remove(index)
                            //slider.maximumValue=unselectlist.count-1
                        }
                        drag.target:parent
                    }
                }
            }

            Slider{
                id:slider
                width: 10
                height: unselectlist.height
                anchors.left: unselectlist.right
                anchors.top: unselectlist.top
                orientation: Qt.Vertical
                maximumValue: unselectlist.count-1
                minimumValue: 0
                stepSize: 1.0

                onValueChanged: {
                    unselectlist.currentIndex=unselectlist.count-value-1
                }
            }
        }

        //右侧已选择列表
        Item {
            id: rightlist
            width: parent.width*0.42
            height: unselect.height
            anchors.top:unselect.top
            anchors.right: parent.right
            anchors.rightMargin: parent.width*0.05

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
                        color:"transparent"//index%2==0?"white":"#66CCFF"
                        Text{
                            anchors.left: parent.left
                            text:name
                            color: "black"
                            font.pixelSize: 25
                            font.family: "Segoe UI"
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
                            ogCtl.delFromSelOg(ogCtl.tran2ID(select_sp.get(index).name));
                            unselect_sp.append(select_sp.get(index))
                            select_sp.remove(index)
                        }
                    }
                }
            }
        }

        //边框
        Rectangle {
            id: kuangkuang
            width: rightlist.width
            height: rightlist.height
            radius: 5
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.95 - rightlist.width
            anchors.top: unselect.top
            color: "transparent"
            border.color: "transparent"
            border.width: 5
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
                    ogCtl.add2SelOg(ogCtl.tran2ID(unselect_sp.get(parseInt(drop.getDataAsString("index"))).name));
                    unselect_sp.remove(parseInt(drop.getDataAsString("index")),1)
                }
                else if(drop.proposedAction==Qt.MoveAction&&drop.x<width*0.5&&drop.getDataAsString("type")==="select"){
                    unselect_sp.append(select_sp.get(parseInt(drop.getDataAsString("index"))))
                    ogCtl.delFromSelOg(ogCtl.tran2ID(select_sp.get(parseInt(drop.getDataAsString("index"))).name));
                    select_sp.remove(parseInt(drop.getDataAsString("index")),1)
                }
            }
        }

        //拖动时跟随的图片
        Item {
            id: ani
            visible: false
            width: ani_image.width
            height: ani_image.height
            AnimatedImage {
                id: ani_image
                source: "qrc:/loader.gif"
                playing:true
            }
            z: 5
        }

        //排序按钮
        Button {
            id:sort
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.02
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.1-parent.width*0.05
            tooltip: "Sort"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/sort1(1).png":"qrc:/sort(1).png"
                    }
                }
            }
            onClicked: {
                for(var i=0;i<unselect_sp.count;i++){
                    for(var j=i+1;j<unselect_sp.count;j++){
                        if(unselect_sp.get(i).name>unselect_sp.get(j).name){
                            var s=unselect_sp.get(i).name
                            unselect_sp.setProperty(i,"name",unselect_sp.get(j).name)
                            unselect_sp.setProperty(j,"name",s)
                        }
                    }
                }
            }
        }

        //submit
        Button {
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height*0.02
            anchors.left:parent.left
            anchors.leftMargin: parent.width*0.9-width*0.5
            tooltip: "Next"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/next1.png":"qrc:/next.png"
                    }
                }
            }
            onClicked: {
                if(select_sp.count<4){
                    message.show()
                }
                else{
                    ogCtl.submit_cluster()
                    page_1.visible = false
                    page_2.visible = true
                    ruchuang.start()
                    fudong_p2.start()
                }
            }
        }

        //Home按钮
        Button {
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height*0.02
            anchors.left:parent.left
            anchors.leftMargin: parent.width*0.5-width*0.5
            tooltip: "Home"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/home1.png":"qrc:/home.png"
                    }
                }
            }
            onClicked: {
                page_1.visible = false
                mainpage.visible = true
            }
        }

        //存档按钮
        Button{
            id: record
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height*0.02
            anchors.left:parent.left
            anchors.leftMargin: parent.width*0.6-width*0.5
            tooltip: "Save"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/record1.png":"qrc:/record.png"
                    }
                }
            }
            onClicked: {
                if(select_sp.count<4){
                    message.show()
                }
                else{
                    var label =new String
                    label =Qt.formatDateTime(new Date(), "MM-dd-hh-mm-ss")
                    var n=select_sp.count
                    var s=new String
                    for(var i=0;i<n;i++)
                        s=s+ogCtl.tran2ID(select_sp.get(i).name)
                    recordlist.append({"label":label,"source":s,"flag":0})
                    var ok=recordlist.count;
                    for(i=recordlist.count-2;i>=0;i--){
                        if(recordlist.get(i).source===recordlist.get(recordlist.count-1).source){
                            ok=i
                            break
                        }
                    }
                    if(ok!=recordlist.count){
                        cover._open(ok)
                    }
                    else
                        narrow.start()
                }
                nodata.n=recordlist.count

            }
        }

        //历史/读档按钮
        Button{
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom:parent.bottom
            anchors.bottomMargin:parent.height*0.02
            anchors.left:parent.left
            anchors.leftMargin: parent.width*0.7-width*0.5
            tooltip: "History"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/history1.png":"qrc:/history.png"
                    }
                }
            }
            onClicked: {
                recorditem.show()
            }
        }

        //清除选择按钮
        Button{
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.leftMargin: parent.width*0.8-width*0.5
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.02
            tooltip: "Reset"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/clear1.png":"qrc:/clear.png"
                    }
                }
            }
            onClicked: {
                for(var i=select_sp.count-1;i>=0;i--){
                    unselect_sp.append(select_sp.get(i))
                    select_sp.remove(i)
                }
                sort.clicked()
            }
        }

        //提示
        Item{
            id:message
            height: 30
            width: parent.width*0.4
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.14
            x:parent.width
            visible:true
            Rectangle{
                anchors.fill: parent
                color: "lightblue"
                radius: 5
                opacity:0.7
                Text{
                    anchors.centerIn: parent
                    text:"Please choose 4 spcies at least!"
                }
            }
            function show(){
                message_show.start()
                message_ani.start()
            }
        }

        PropertyAnimation{
            id:message_show
            target: message
            duration: 500
            property: "x"
            to:page_1.width-message.width
        }
        PropertyAnimation{
            id:message_hide
            duration: 500
            target: message
            property:"x"
            to:page_1.width
        }
        Timer{
            id:message_ani
            interval: 3000
            onTriggered: {
                message_hide.start()
            }
        }

        //存档时缩小动画
        SequentialAnimation {
            id: narrow
            ParallelAnimation {
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"border.color"
                    to:	"black"
                    duration: 300
                    easing.type: Easing.OutQuad
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"width,height"
                    to:	0
                    duration: 300
                    easing.type: Easing.OutQuad
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"anchors.leftMargin"
                    to: record.x
                    duration: 300
                    easing.type: Easing.OutQuad
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"anchors.topMargin"
                    to:	record.y - record.height
                    duration: 300
                    easing.type: Easing.OutQuad
                }
            }

            ParallelAnimation {
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"border.color"
                    to:	"transparent"
                    duration: 0
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"width"
                    to:	rightlist.width
                    duration: 0
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"height"
                    to:	rightlist.height
                    duration: 0
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"anchors.leftMargin"
                    to:	page_1.width*0.95 - rightlist.width
                    duration: 0
                }
                PropertyAnimation {
                    target:	kuangkuang
                    properties:	"anchors.topMargin"
                    to:	0
                    duration: 0
                }
            }
        }
    }

    //保存覆盖对话框cover
    MessageDialog {
        id:cover
        visible: false
        icon: StandardIcon.Information
        text: "已存在当前项目，是否覆盖？选择否将取消保存"
        standardButtons: StandardButton.Yes|StandardButton.No
        property int n
        function _open(a){
            n=a
            cover.open()
        }
        onYes: {
            recordlist.remove(n)
            narrow.start()
        }
        onNo:{
            recordlist.remove(recordlist.count-1)
        }
        onRejected: {
            recordlist.remove(recordlist.count-1)
        }
    }

    //Page_2
    Item {
        id: page_2
        visible: false
        width: parent.width
        height: parent.height

        //设置背景图片
        Image {
            id: backgound
            anchors.fill: parent
            source: "qrc:/mainpage_background.png"
        }

        //btn1----result
        Image {
            id: resultbtn
            width:  parent.width*0.30625
            height: parent.width*0.30625
            opacity: 0.0
            source: "qrc:/sjq1.png"
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.22
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.2
            Text {
                id: resultbtntext
                anchors.centerIn: parent
                text: "Result "
                font.pixelSize: 24
                font.family: "Segoe Script"
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    resultbtn.source = "qrc:/sjq2.png"
                    resultbtntext.font.pixelSize = 30
                    res1.visible = true
                    res2.visible = true
                    res3.visible = true
                    res4.visible = true
                    closeres.stop()     //让4泡消失的计时暂停
                    closeresvis.stop()
                    showres.start()     //4泡渐变出现
                }
                onExited: {
                    resultbtn.source = "qrc:/sjq1.png"
                    resultbtntext.font.pixelSize = 24
                    closeres.start()
                    closeresvis.start()
                }
                onPressed: {
                    resultbtn.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    resultbtn.source = "qrc:/sjq2.png"
                    shackres.start()
                }
            }
        }

        //btn1_1:
        Image {
            id: res1
            width: parent.width*0.225
            height: parent.width*0.225
            opacity: 0.0
            source: "qrc:/sjq1.png"
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.12
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.55
            Text {
                id: res1text
                anchors.centerIn: parent
                text: " Transport&  \nMetabolism  "
                font.family: "Segoe UI Light"
                font.pixelSize: 16
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    res1.source = "qrc:/sjq2.png"
                    res1text.font.pixelSize = 17
                    closeres.stop()     //让4泡消失的计时暂停
                    closeresvis.stop()
                }
                onExited: {
                    res1.source = "qrc:/sjq1.png"
                    res1text.font.pixelSize = 16
                    closeres.start()
                    closeresvis.start()
                }
                onPressed: {
                    res1.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    res1.source = "qrc:/sjq2.png"
                    tanchuang1.visible = true
                    tanchuang2.visible = false
                    tanchuang3.visible = false
                    tanchuang4.visible = false
                    showtanchuang1.start()
                    hide3pao.start()
                    tanchuang2_leave.start()
                    tanchuang3_leave.start()
                    tanchuang4_leave.start()
                    res1toleft.start()
                }
            }
        }

        //btn1_2:
        Image {
            id: res2
            width: parent.width*0.15625//125
            height: parent.width*0.15625
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.13
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.11
            Text {
                id: res2text
                anchors.centerIn: parent
                text: " Translation&  \nTranscription"
                font.family: "Segoe UI Light"
                font.pixelSize: 13
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    res2.source = "qrc:/sjq2.png"
                    res2text.font.pixelSize = 14
                    closeres.stop()     //让4泡消失的计时暂停
                    closeresvis.stop()
                }
                onExited: {
                    res2.source = "qrc:/sjq1.png"
                    res2text.font.pixelSize = 13
                    closeres.start()
                    closeresvis.start()
                }
                onPressed: {
                    res2.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    res2.source = "qrc:/sjq2.png"
                    tanchuang1.visible = false
                    tanchuang2.visible = true
                    tanchuang3.visible = false
                    tanchuang4.visible = false
                    showtanchuang2.start()
                    hide3pao.start()
                    tanchuang1_leave.start()
                    tanchuang3_leave.start()
                    tanchuang4_leave.start()
                    res2toleft.start()
                }
            }
        }

        //btn1_3:
        Image {
            id: res3
            width: parent.width*0.19375//155
            height: parent.width*0.19375
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.06
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.32
            Text {
                id: res3text
                anchors.centerIn: parent
                text: "General function  \n prediction only"
                font.family: "Segoe UI Light"
                font.pixelSize: 14
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    res3.source = "qrc:/sjq2.png"
                    res3text.font.pixelSize = 15
                    closeres.stop()     //让4泡消失的计时暂停
                    closeresvis.stop()
                }
                onExited: {
                    res3.source = "qrc:/sjq1.png"
                    res3text.font.pixelSize = 14
                    closeres.start()
                    closeresvis.start()
                }
                onPressed: {
                    res3.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    res3.source = "qrc:/sjq2.png"
                    tanchuang1.visible = false
                    tanchuang2.visible = false
                    tanchuang3.visible = true
                    tanchuang4.visible = false
                    showtanchuang3.start()
                    hide3pao.start()
                    tanchuang1_leave.start()
                    tanchuang2_leave.start()
                    tanchuang4_leave.start()
                    res3toleft.start()
                }
            }
        }

        //btn1_4:
        Image {
            id: res4
            width: parent.width*0.125//100
            height: parent.width*0.125
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.26
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.03
            Text {
                id: res4text
                anchors.centerIn: parent
                text: "Function\nunknow"
                font.family: "Segoe UI Light"
                font.pixelSize: 13
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    res4.source = "qrc:/sjq2.png"
                    res4text.font.pixelSize = 14
                    closeres.stop()     //让4泡消失的计时暂停
                    closeresvis.stop()
                }
                onExited: {
                    res4.source = "qrc:/sjq1.png"
                    res4text.font.pixelSize = 13
                    closeres.start()
                    closeresvis.start()
                }
                onPressed: {
                    res4.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    res4.source = "qrc:/sjq2.png"
                    tanchuang1.visible = false
                    tanchuang2.visible = false
                    tanchuang3.visible = false
                    tanchuang4.visible = true
                    showtanchuang4.start()
                    hide3pao.start()
                    tanchuang1_leave.start()
                    tanchuang2_leave.start()
                    tanchuang3_leave.start()
                    res4toleft.start()
                }
            }
        }

        //btn2----pathway
        Image {
            id: pathwaybtn
            width: parent.width*0.2375//190
            height: parent.width*0.2375
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.55
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.1
            Text {
                id: pathwaybtntext
                anchors.centerIn: parent
                text: "Pathway"
                font.family: "Segoe Script"
                font.pixelSize: 20
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    pathwaybtn.source = "qrc:/sjq2.png"
                    pathwaybtntext.font.pixelSize = 26
                    closepath.stop()     ////让p双泡消失的计时暂停
                    closepathvis.stop()
                    showpath.start()     //2泡渐变出现
                    pwg.visible = true
                    pwm.visible = true
                }
                onExited: {
                    pathwaybtn.source = "qrc:/sjq1.png"
                    pathwaybtntext.font.pixelSize = 20
                    closepath.start()
                    closepathvis.start()
                }
                onPressed: {
                    pathwaybtn.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    pathwaybtn.source = "qrc:/sjq2.png"
                    shackpath.start()
                }
            }
        }

        //btn2_1: pathway with whole gene
        Image {
            id: pwg
            visible: true
            width: parent.width*0.10625//85
            height: parent.width*0.10625
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.74
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.06
            Text {
                id: pwgtext
                anchors.centerIn: parent
                text: "Gene"
                font.family: "Segoe UI Light"
                font.pixelSize: 15
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    pwg.source = "qrc:/sjq2.png"
                    pwgtext.font.pixelSize = 17
                    closepath.stop()    //让p双泡消失的计时暂停
                    closepathvis.stop()
                }
                onExited: {
                    pwg.source = "qrc:/sjq1.png"
                    pwgtext.font.pixelSize = 15
                    closepath.start()
                    closepathvis.start()
                }
                onPressed: {
                    pwg.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    pwg.source = "qrc:/sjq2.png"
                    webpage.visible = true
                }
            }
        }

        //btn2_2: pathway with meta
        Image {
            id: pwm
            visible: true
            width:  parent.width*0.125//100
            height: parent.width*0.125
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.76
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.2
            Text {
                id: pwmtext
                anchors.centerIn: parent
                text: "Meta"
                font.family: "Segoe UI Light"
                font.pixelSize: 15
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    pwm.source = "qrc:/sjq2.png"
                    pwmtext.font.pixelSize = 17
                    closepath.stop()    //让p双泡消失的计时暂停
                    closepathvis.stop()
                }
                onExited: {
                    pwm.source = "qrc:/sjq1.png"
                    pwmtext.font.pixelSize = 15
                    closepath.start()
                    closepathvis.start()
                }
                onPressed: {
                    pwm.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    pwm.source = "qrc:/sjq2.png"
                }
            }
        }

        //btn3----module
        Image {
            id: modulebtn
            width: parent.width*0.225//180
            height: parent.width*0.225
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.58
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.47
            Text {
                id: modulebtntext
                anchors.centerIn: parent
                text: "Module"
                font.family: "Segoe Script"
                font.pixelSize: 20
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    modulebtn.source = "qrc:/sjq2.png"
                    modulebtntext.font.pixelSize = 26
                    closemodule.stop()     ////让m双泡消失的计时暂停
                    closemodulevis.stop()
                    showmodule.start()     //2泡渐变出现
                    mwg.visible = true
                    mwm.visible = true
                }
                onExited: {
                    modulebtn.source = "qrc:/sjq1.png"
                    modulebtntext.font.pixelSize = 20
                    closemodule.start()
                    closemodulevis.start()
                }
                onPressed: {
                    modulebtn.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    modulebtn.source = "qrc:/sjq2.png"
                    shackmodule.start()
                }
            }
        }

        //btn3_1: module with whole gene
        Image {
            id: mwg
            visible: true
            width: parent.width*0.10625
            height: parent.width*0.10625
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.77
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.42
            Text {
                id: mwgtext
                anchors.centerIn: parent
                text: "Gene"
                font.family: "Segoe UI Light"
                font.pixelSize: 15
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    mwg.source = "qrc:/sjq2.png"
                    mwgtext.font.pixelSize = 17
                    closemodule.stop()    //让m双泡消失的计时暂停
                    closemodulevis.stop()
                }
                onExited: {
                    mwg.source = "qrc:/sjq1.png"
                    mwgtext.font.pixelSize = 15
                    closemodule.start()
                    closemodulevis.start()
                }
                onPressed: {
                    mwg.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    mwg.source = "qrc:/sjq2.png"
                }
            }
        }

        //btn3_2: module with meta
        Image {
            id: mwm
            visible: true
            width: parent.width*0.125//100
            height: parent.width*0.125
            source: "qrc:/sjq1.png"
            opacity: 0.0
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.79
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.57
            Text {
                id: mwmtext
                anchors.centerIn: parent
                text: "Meta"
                font.family: "Segoe UI Light"
                font.pixelSize: 15
                font.bold: true
                color: "black"
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    mwm.source = "qrc:/sjq2.png"
                    mwmtext.font.pixelSize = 17
                    closemodule.stop()    //让m双泡消失的计时暂停
                    closemodulevis.stop()
                }
                onExited: {
                    mwm.source = "qrc:/sjq1.png"
                    mwmtext.font.pixelSize = 15
                    closemodule.start()
                    closemodulevis.start()
                }
                onPressed: {
                    mwm.source = "qrc:/sjq1.png"
                }
                onReleased: {
                    mwm.source = "qrc:/sjq2.png"
                }
            }
        }

        //下载按钮
        Button {
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.02
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.7
            tooltip: "Download"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/download1.png":"qrc:/download.png"
                    }
                }
            }
            onClicked: {
            }
        }

        //返回page_1按钮
        Button {
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.02
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.8
            tooltip: "Back"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/back1.png":"qrc:/back.png"
                    }
                }
            }
            onClicked: {
                page_2.visible = false
                page_1.visible = true
            }
        }

        //Home按钮
        Button {
            height: 40
            width: 40
            opacity: pressed?0.8:1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height*0.02
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.9
            tooltip: "Home"
            style:ButtonStyle{
                background: Rectangle{
                    anchors.fill: parent
                    color:control.hovered?"#AAAAAA":"transparent"
                    Image {
                        width:30
                        height: 30
                        anchors.centerIn: parent
                        source:control.hovered?"qrc:/home1.png":"qrc:/home.png"
                    }
                }
            }
            onClicked: {
                page_2.visible = false
                mainpage.visible = true
            }
        }

        //btn123入场动画
        SequentialAnimation	{
            id: ruchuang
            ParallelAnimation {
                //btn1
                PropertyAnimation {
                    target:	resultbtn
                    properties: "width,height"
                    from: 20
                    to:	page_2.width*0.30625
                    duration: 500
                }
                PropertyAnimation {
                    target:	resultbtn
                    property: "anchors.leftMargin"
                    from: page_2.width*0.48
                    to:	page_2.width*0.22
                    duration: 500
                }
                PropertyAnimation {
                    target:	resultbtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.2
                    duration: 500
                }
                PropertyAnimation {
                    target:	resultbtn
                    property: "opacity"
                    to:	1.0
                    duration: 500
                }
                //btn2
                PropertyAnimation {
                    target:	pathwaybtn
                    properties: "width,height"
                    from: 20
                    to:	page_2.width*0.2375
                    duration: 500
                }
                PropertyAnimation {
                    target:	pathwaybtn
                    property: "anchors.leftMargin"
                    from: page_2.width*0.48
                    to:	page_2.width*0.55
                    duration: 500
                }
                PropertyAnimation {
                    target:	pathwaybtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.1
                    duration: 500
                }
                PropertyAnimation {
                    target:	pathwaybtn
                    property: "opacity"
                    to:	1.0
                    duration: 500
                }
                //btn3
                PropertyAnimation {
                    target:	modulebtn
                    properties: "width,height"
                    from: 20
                    to:	page_2.width*0.225
                    duration: 500
                }
                PropertyAnimation {
                    target:	modulebtn
                    property: "anchors.leftMargin"
                    from: page_2.width*0.48
                    to:	page_2.width*0.58
                    duration: 500
                }
                PropertyAnimation {
                    target:	modulebtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.47
                    duration: 500
                }
                PropertyAnimation {
                    target:	modulebtn
                    property: "opacity"
                    to:	1.0
                    duration: 500
                }

                //res1
                PropertyAnimation {
                    target:	res1
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.225//180
                    duration: 300
                }
                PropertyAnimation {
                    target:	res1
                    property: "anchors.leftMargin"
                    from: page_2.width*0.35
                    to:	page_2.width*0.12
                    duration: 300
                }
                PropertyAnimation {
                    target:	res1
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.55
                    duration: 300
                }
                PropertyAnimation {
                    target:	res1
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //res2
                PropertyAnimation {
                    target:	res2
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.15625
                    duration: 300
                }
                PropertyAnimation {
                    target:	res2
                    property: "anchors.leftMargin"
                    from: page_2.width*0.35
                    to:	page_2.width*0.13
                    duration: 300
                }
                PropertyAnimation {
                    target:	res2
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.11
                    duration: 300
                }
                PropertyAnimation {
                    target:	res2
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //res3
                PropertyAnimation {
                    target:	res3
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.19375
                    duration: 300
                }
                PropertyAnimation {
                    target:	res3
                    property: "anchors.leftMargin"
                    from: page_2.width*0.35
                    to:	page_2.width*0.06
                    duration: 300
                }
                PropertyAnimation {
                    target:	res3
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.32
                    duration: 300
                }
                PropertyAnimation {
                    target:	res3
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //res4
                PropertyAnimation {
                    target:	res4
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.125
                    duration: 300
                }
                PropertyAnimation {
                    target:	res4
                    property: "anchors.leftMargin"
                    from: page_2.width*0.35
                    to:	page_2.width*0.26
                    duration: 300
                }
                PropertyAnimation {
                    target:	res4
                    property: "anchors.topMargin"
                    from: page_2.height*0.4
                    to:	page_2.height*0.03
                    duration: 300
                }
                PropertyAnimation {
                    target:	res4
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }

                //pwg
                PropertyAnimation {
                    target:	pwg
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.10625
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.leftMargin"
                    from: page_2.width*0.65
                    to:	page_2.width*0.74
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.topMargin"
                    from: page_2.height*0.25
                    to:	page_2.height*0.06
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwg
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //pwm
                PropertyAnimation {
                    target:	pwm
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.125
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.leftMargin"
                    from: page_2.width*0.65
                    to:	page_2.width*0.76
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.topMargin"
                    from: page_2.height*0.25
                    to:	page_2.height*0.2
                    duration: 300
                }
                PropertyAnimation {
                    target:	pwm
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //mwg
                PropertyAnimation {
                    target:	mwg
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.10625
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.leftMargin"
                    from: page_2.width*0.65
                    to:	page_2.width*0.77
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.topMargin"
                    from: page_2.height*0.5
                    to:	page_2.height*0.42
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwg
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
                //mwm
                PropertyAnimation {
                    target:	mwm
                    properties: "width,height"
                    from: 0
                    to:	page_2.width*0.125
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.leftMargin"
                    from: page_2.width*0.65
                    to:	page_2.width*0.79
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.topMargin"
                    from: page_2.height*0.5
                    to:	page_2.height*0.57
                    duration: 300
                }
                PropertyAnimation {
                    target:	mwm
                    property: "opacity"
                    to:	0.6
                    duration: 300
                }
            }

            //所有子btn淡化
            PropertyAnimation {
                id: hidechild
                targets: [res1, res2, res3, res4, pwg, pwm, mwg, mwm]
                property: "opacity"
                to:	0.0
                duration: 300
            }
        }

        //3泡浮动效果
        ParallelAnimation {
            id: fudong_p2
            //btn1
            SequentialAnimation {
                NumberAnimation {
                    target: resultbtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.2
                    to: page_2.height*0.206
                    duration: 800
                }
                NumberAnimation {
                    target: resultbtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.194
                    duration: 1600
                }
                NumberAnimation {
                    target: resultbtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.2
                    duration: 800
                }
            }
            //btn2
            SequentialAnimation {
                NumberAnimation {
                    target: pathwaybtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.1
                    to: page_2.height*0.094
                    duration: 800
                }
                NumberAnimation {
                    target: pathwaybtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.106
                    duration: 1600
                }
                NumberAnimation {
                    target: pathwaybtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.1
                    duration: 800
                }
            }
            //btn3
            SequentialAnimation {
                NumberAnimation {
                    target: modulebtn
                    property: "anchors.topMargin"
                    from: page_2.height*0.47
                    to: page_2.height*0.476
                    duration: 800
                }
                NumberAnimation {
                    target: modulebtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.464
                    duration: 1600
                }
                NumberAnimation {
                    target: modulebtn
                    property: "anchors.topMargin"
                    to: page_2.height*0.47
                    duration: 800
                }
            }
            loops: Animation.Infinite
        }

        //btn123淡化效果
        ParallelAnimation {
            id: hide3pao
            PropertyAnimation {
                targets: [resultbtn, pathwaybtn, modulebtn]
                property: "opacity"
                to:	0.0
                duration: 200
            }
        }

        //btn123强化效果
        ParallelAnimation {
            id: show3pao
            PropertyAnimation {
                targets: [resultbtn, pathwaybtn, modulebtn]
                property: "opacity"
                to:	1.0
                duration: 200
            }
        }

        //btn1子泡泡淡化效果
        ParallelAnimation {
            id: hideres
            PropertyAnimation {
                targets: [res1, res2, res3, res4]
                property: "opacity"
                to:	0.0
                duration: 200
            }
        }

        //btn1子泡泡强化效果
        ParallelAnimation {
            id: showres
            PropertyAnimation {
                targets: [res1, res2, res3, res4]
                property: "opacity"
                to:	1.0
                duration: 200
            }
        }

        //btn1子泡泡颤抖效果
        SequentialAnimation	{
            id: shackres
            ParallelAnimation {
                //res1
                PropertyAnimation {
                    target:	res1
                    property: "anchors.leftMargin"
                    from: page_2.width*0.12
                    to: page_2.width*0.11
                    duration: 200
                }
                PropertyAnimation {
                    target:	res1
                    property: "anchors.topMargin"
                    from: page_2.height*0.55
                    to: page_2.height*0.56
                    duration: 200
                }
                //res2
                PropertyAnimation {
                    target:	res2
                    property: "anchors.leftMargin"
                    from: page_2.width*0.13
                    to: page_2.width*0.12
                    duration: 200
                }
                PropertyAnimation {
                    target:	res2
                    property: "anchors.topMargin"
                    from: page_2.height*0.11
                    to: page_2.height*0.1
                    duration: 200
                }
                //res3
                PropertyAnimation {
                    target:	res3
                    property: "anchors.leftMargin"
                    from: page_2.width*0.06
                    to: page_2.width*0.05
                    duration: 200
                }
                PropertyAnimation {
                    target:	res3
                    property: "anchors.topMargin"
                    from: page_2.height*0.32
                    to: page_2.height*0.325
                    duration: 200
                }
                //res4
                PropertyAnimation {
                    target:	res4
                    property: "anchors.leftMargin"
                    from: page_2.width*0.26
                    to: page_2.width*0.255
                    duration: 200
                }
                PropertyAnimation {
                    target:	res4
                    property: "anchors.topMargin"
                    from: page_2.height*0.03
                    to: page_2.height*0.02
                    duration: 200
                }
            }
            ParallelAnimation {
                //res1
                PropertyAnimation {
                    target:	res1
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.width*0.13
                    duration: 300
                }
                PropertyAnimation {
                    target:	res1
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.height*0.54
                    duration: 300
                }
                //res2
                PropertyAnimation {
                    target:	res2
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.width*0.14
                    duration: 300
                }
                PropertyAnimation {
                    target:	res2
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.height*0.12
                    duration: 300
                }
                //res3
                PropertyAnimation {
                    target:	res3
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.width*0.07
                    duration: 300
                }
                PropertyAnimation {
                    target:	res3
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.height*0.315
                    duration: 300
                }
                //res4
                PropertyAnimation {
                    target:	res4
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.width*0.265
                    duration: 300
                }
                PropertyAnimation {
                    target:	res4
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutCubic
                    to: page_2.height*0.04
                    duration: 300
                }
            }
            ParallelAnimation {
                //res1
                PropertyAnimation {
                    target:	res1
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.width*0.12
                    duration: 150
                }
                PropertyAnimation {
                    target:	res1
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.height*0.55
                    duration: 150
                }
                //res2
                PropertyAnimation {
                    target:	res2
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.width*0.13
                    duration: 150
                }
                PropertyAnimation {
                    target:	res2
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.height*0.11
                    duration: 150
                }
                //res3
                PropertyAnimation {
                    target:	res3
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.width*0.06
                    duration: 150
                }
                PropertyAnimation {
                    target:	res3
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.height*0.32
                    duration: 150
                }
                //res4
                PropertyAnimation {
                    target:	res4
                    property: "anchors.leftMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.width*0.26
                    duration: 150
                }
                PropertyAnimation {
                    target:	res4
                    property: "anchors.topMargin"
                    easing.type: Easing.InOutQuad
                    to: page_2.height*0.03
                    duration: 150
                }
            }
        }

        //btn2子泡泡淡化效果
        ParallelAnimation {
            id: hidepath
            PropertyAnimation {
                targets: [pwg, pwm]
                property: "opacity"
                to:	0.0
                duration: 200
            }
        }

        //btn2子泡泡强化效果
        ParallelAnimation {
            id: showpath
            PropertyAnimation {
                targets: [pwg, pwm]
                property: "opacity"
                to:	1.0
                duration: 200
            }
        }

        //btn2子泡泡颤抖效果
        SequentialAnimation	{
            id: shackpath
            ParallelAnimation {
                //pwg
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.leftMargin"
                    from: page_2.width*0.74
                    to: page_2.width*0.75
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.topMargin"
                    from: page_2.height*0.06
                    to: page_2.height*0.055
                    duration: 200
                }
                //pwm
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.leftMargin"
                    from: page_2.width*0.76
                    to: page_2.width*0.77
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.topMargin"
                    from: page_2.height*0.2
                    to: page_2.height*0.202
                    duration: 200
                }
            }
            ParallelAnimation {
                //pwg
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.leftMargin"
                    to: page_2.width*0.735
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.topMargin"
                    to: page_2.height*0.065
                    duration: 200
                }
                //pwm
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.leftMargin"
                    to: page_2.width*0.755
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.topMargin"
                    to: page_2.height*0.198
                    duration: 200
                }
            }
            ParallelAnimation {
                //pwg
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.leftMargin"
                    to: page_2.width*0.74
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwg
                    property: "anchors.topMargin"
                    to: page_2.height*0.06
                    duration: 200
                }
                //pwm
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.leftMargin"
                    to: page_2.width*0.76
                    duration: 200
                }
                PropertyAnimation {
                    target:	pwm
                    property: "anchors.topMargin"
                    to: page_2.height*0.2
                    duration: 200
                }
            }
        }

        //btn3子泡泡淡化效果
        ParallelAnimation {
            id: hidemodule
            PropertyAnimation {
                targets: [mwg, mwm]
                property: "opacity"
                to:	0.0
                duration: 200
            }
        }

        //btn3子泡泡强化效果
        ParallelAnimation {
            id: showmodule
            PropertyAnimation {
                targets: [mwg, mwm]
                property: "opacity"
                to:	1.0
                duration: 200
            }
        }

        //btn3子泡泡颤抖效果
        SequentialAnimation	{
            id: shackmodule
            ParallelAnimation {
                //mwg
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.leftMargin"
                    from: page_2.width*0.77
                    to: page_2.width*0.78
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.topMargin"
                    from: page_2.height*0.42
                    to: page_2.height*0.415
                    duration: 200
                }
                //mwm
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.leftMargin"
                    from: page_2.width*0.79
                    to: page_2.width*0.8
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.topMargin"
                    from: page_2.height*0.57
                    to: page_2.height*0.574
                    duration: 200
                }
            }
            ParallelAnimation {
                //mwg
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.leftMargin"
                    to: page_2.width*0.765
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.topMargin"
                    to: page_2.height*0.425
                    duration: 200
                }
                //mwm
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.leftMargin"
                    to: page_2.width*0.785
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.topMargin"
                    to: page_2.height*0.568
                    duration: 200
                }
            }
            ParallelAnimation {
                //mwg
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.leftMargin"
                    to: page_2.width*0.77
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwg
                    property: "anchors.topMargin"
                    to: page_2.height*0.42
                    duration: 200
                }
                //mwm
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.leftMargin"
                    to: page_2.width*0.79
                    duration: 200
                }
                PropertyAnimation {
                    target:	mwm
                    property: "anchors.topMargin"
                    to: page_2.height*0.57
                    duration: 200
                }
            }
        }

        //result区按钮计时消失(动画)
        Timer {
            id: closeres
            interval: 800
            onTriggered: {
                hideres.start()
            }
            repeat: false
        }

        //result区按钮计时消失(visiable)
        Timer {
            id: closeresvis
            interval: closeres.interval + 200
            onTriggered: {
                res1.visible = false
                res2.visible = false
                res3.visible = false
                res4.visible = false
            }
            repeat: false
        }

        //pathway区按钮计时消失（动画）
        Timer {
            id: closepath
            interval: 300
            onTriggered: {
                hidepath.start()
            }
            repeat: false
        }

        //pathway区按钮计时消失（visiable）
        Timer {
            id: closepathvis
            interval: closepath.interval + 200
            onTriggered: {
                pwg.visible = false
                pwm.visible = false
            }
            repeat: false
        }

        //module区按钮计时消失(动画)
        Timer {
            id: closemodule
            interval: 300
            onTriggered: {
                hidemodule.start()
            }
            repeat: false
        }

        //module区按钮计时消失(visiable)
        Timer {
            id: closemodulevis
            interval: closemodule.interval + 200
            onTriggered: {
                mwg.visible = false
                mwm.visible = false
            }
            repeat: false
        }

        //btn1_x滚去左侧(res1选中)
        ParallelAnimation {
            id: res1toleft
            //res2-4
            PropertyAnimation {
                targets: [res2, res3, res4]
                properties: "width,height"
                to:	page_2.height*0.3
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res2, res3, res4]
                property: "anchors.leftMargin"
                to:	page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res2text, res3text, res4text]
                properties: "color"
                to:	"black"
            }
            //res1
            PropertyAnimation {
                target: res1
                properties: "width,height"
                to:	page_2.height*0.38
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res1
                property: "anchors.leftMargin"
                to:	-page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target:	res1
                property: "anchors.topMargin"
                to:	page_2.height*0.67
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res1text
                properties: "font.pixelSize"
                to:	20
                duration: 0
            }
            PropertyAnimation {
                target: res1text
                properties: "color"
                to:	"red"
            }
            //res2
            PropertyAnimation {
                target:	res2
                property: "anchors.topMargin"
                to:	page_2.height*0.22
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res3
            PropertyAnimation {
                target:	res3
                property: "anchors.topMargin"
                to:	page_2.height*0.45
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res4
            PropertyAnimation {
                target:	res4
                property: "anchors.topMargin"
                to:	-page_2.height*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
        }

        //btn1_x滚去左侧(res2选中)
        ParallelAnimation {
            id: res2toleft
            //res1,3,4
            PropertyAnimation {
                targets: [res1, res3, res4]
                properties: "width,height"
                to:	page_2.height*0.3
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1, res3, res4]
                property: "anchors.leftMargin"
                to:	page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1text, res3text, res4text]
                properties: "color"
                to:	"black"
            }
            //res1
            PropertyAnimation {
                target:	res1
                property: "anchors.topMargin"
                to:	page_2.height*0.73
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res2
            PropertyAnimation {
                target: res2
                properties: "width,height"
                to:	page_2.height*0.38
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res2
                property: "anchors.leftMargin"
                to:	-page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target:	res2
                property: "anchors.topMargin"
                to:	page_2.height*0.21
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res2text
                properties: "font.pixelSize"
                to:	20
                duration: 0
            }
            PropertyAnimation {
                target: res2text
                properties: "color"
                to:	"red"
            }
            //res3
            PropertyAnimation {
                target:	res3
                property: "anchors.topMargin"
                to:	page_2.height*0.5
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res4
            PropertyAnimation {
                target:	res4
                property: "anchors.topMargin"
                to:	-page_2.height*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
        }

        //btn1_x滚去左侧(res3选中)
        ParallelAnimation {
            id: res3toleft
            //res1,2,4
            PropertyAnimation {
                targets: [res1, res2, res4]
                properties: "width,height"
                to:	page_2.height*0.3
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1, res2, res4]
                property: "anchors.leftMargin"
                to:	page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1text, res2text, res4text]
                properties: "color"
                to:	"black"
            }
            //res1
            PropertyAnimation {
                target:	res1
                property: "anchors.topMargin"
                to:	page_2.height*0.73
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res2
            PropertyAnimation {
                target:	res2
                property: "anchors.topMargin"
                to:	page_2.height*0.22
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res3
            PropertyAnimation {
                target: res3
                properties: "width,height"
                to:	page_2.height*0.38
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res3
                property: "anchors.leftMargin"
                to:	-page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target:	res3
                property: "anchors.topMargin"
                to:	page_2.height*0.44
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res3text
                properties: "font.pixelSize"
                to:	20
                duration: 0
            }
            PropertyAnimation {
                target: res3text
                properties: "color"
                to:	"red"
            }
            //res4
            PropertyAnimation {
                target:	res4
                property: "anchors.topMargin"
                to:	-page_2.height*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
        }

        //btn1_x滚去左侧(res4选中)
        ParallelAnimation {
            id: res4toleft
            //res1,2,3
            PropertyAnimation {
                targets: [res1, res2, res3]
                properties: "width,height"
                to:	page_2.height*0.3
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1, res2, res3]
                property: "anchors.leftMargin"
                to:	page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                targets: [res1text, res2text, res3text]
                properties: "color"
                to:	"black"
            }
            //res1
            PropertyAnimation {
                target:	res1
                property: "anchors.topMargin"
                to:	page_2.height*0.73
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res2
            PropertyAnimation {
                target:	res2
                property: "anchors.topMargin"
                to:	page_2.height*0.27
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res3
            PropertyAnimation {
                target:	res3
                property: "anchors.topMargin"
                to:	page_2.height*0.5
                easing.type: Easing.OutQuad
                duration: 400
            }
            //res4
            PropertyAnimation {
                target: res4
                properties: "width,height"
                to:	page_2.height*0.38
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res4
                property: "anchors.leftMargin"
                to:	-page_2.width*0.01
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target:	res4
                property: "anchors.topMargin"
                to:	-page_2.height*0.015
                easing.type: Easing.OutQuad
                duration: 400
            }
            PropertyAnimation {
                target: res4text
                properties: "font.pixelSize"
                to:	20
                duration: 0
            }
            PropertyAnimation {
                target: res4text
                properties: "color"
                to:	"red"
            }
        }

        //btn1_x由左侧回到原位置
        ParallelAnimation {
            id: resgoback
            //res1-4
            PropertyAnimation {
                targets: [res1, res2, res3, res4]
                property: "opacity"
                to:	0.0
                duration: 0
            }
            PropertyAnimation {
                targets: [res1text, res2text, res3text, res4text]
                properties: "color"
                to:	"black"
            }
            //res1
            PropertyAnimation {
                target:	res1
                properties: "width,height"
                to:	180
                duration: 0
            }
            PropertyAnimation {
                target:	res1
                property: "anchors.leftMargin"
                to:	page_2.width*0.12
                duration: 0
            }
            PropertyAnimation {
                target:	res1
                property: "anchors.topMargin"
                to:	page_2.height*0.55
                duration: 0
            }
            //res2
            PropertyAnimation {
                target:	res2
                properties: "width,height"
                to:	125
                duration: 0
            }
            PropertyAnimation {
                target:	res2
                property: "anchors.leftMargin"
                to:	page_2.width*0.13
                duration: 0
            }
            PropertyAnimation {
                target:	res2
                property: "anchors.topMargin"
                to:	page_2.height*0.11
                duration: 0
            }
            //res3
            PropertyAnimation {
                target:	res3
                properties: "width,height"
                to:	155
                duration: 0
            }
            PropertyAnimation {
                target:	res3
                property: "anchors.leftMargin"
                to:	page_2.width*0.06
                duration: 0
            }
            PropertyAnimation {
                target:	res3
                property: "anchors.topMargin"
                to:	page_2.height*0.32
                duration: 0
            }
            //res4
            PropertyAnimation {
                target:	res4
                properties: "width,height"
                to:	100
                duration: 0
            }
            PropertyAnimation {
                target:	res4
                property: "anchors.leftMargin"
                to:	page_2.width*0.26
                duration: 0
            }
            PropertyAnimation {
                target:	res4
                property: "anchors.topMargin"
                to:	page_2.height*0.03
                duration: 0
            }
        }

        //弹窗1出场
        ParallelAnimation {
            id: showtanchuang1
            PropertyAnimation {
                 target: tanchuang1
                 property: "anchors.leftMargin"
                 easing.type: Easing.OutBack
                 to: page_2.width*0.18
                 duration: 400
            }
        }

        //弹窗2出场
        ParallelAnimation {
            id: showtanchuang2
            PropertyAnimation {
                 target: tanchuang2
                 property: "anchors.leftMargin"
                 easing.type: Easing.OutBack
                 to: page_2.width*0.18
                 duration: 400
            }
        }

        //弹窗3出场
        ParallelAnimation {
            id: showtanchuang3
            PropertyAnimation {
                 target: tanchuang3
                 property: "anchors.leftMargin"
                 easing.type: Easing.OutBack
                 to: page_2.width*0.18
                 duration: 400
            }
        }

        //弹窗4出场
        ParallelAnimation {
            id: showtanchuang4
            PropertyAnimation {
                 target: tanchuang4
                 property: "anchors.leftMargin"
                 easing.type: Easing.OutBack
                 to: page_2.width*0.18
                 duration: 400
            }
        }

        //弹窗1
        Item {
            id: tanchuang1
            visible: false
            opacity: 0.95
            anchors.left: parent.left
            anchors.leftMargin: parent.width
            anchors.top: parent.top
            width: parent.width*0.9
            height: parent.height

            //title + list
            Image {
                id: listsquare1
                anchors.fill: parent
                source: "qrc:/tanchuang.png"

                //左标题 Gene名称
                Rectangle {
                    id: leftgenetitle1
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.035
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.03
                    width: parent.width*0.26
                    height: parent.height*0.1
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("   Cluster of\nEssential Gene")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 25
                    }
                }

                //右标题 Description
                Rectangle {
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.03
                    anchors.left: leftgenetitle1.right
                    anchors.leftMargin: 0
                    width: parent.width*0.83 - leftgenetitle1.width
                    height: parent.height*0.13
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Description")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 29
                    }
                }

                //list表
                ListView {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.08
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.16
                    width: parent.width*0.765
                    height: parent.height*0.66
                    clip: true
                    model: list1

                    ListModel{
                        id: list1
                    }
                    delegate: Item {
                        height: 50
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            Text {
                                anchors.leftMargin: 10
                                anchors.left: parent.left
                                height: parent.height
                                text: name + "         " + description
                                elide: Text.ElideMiddle
                                fontSizeMode: Text.VerticalFit
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.pixelSize: 26
                                font.family: "Segoe UI"
                            }
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        closeres.stop()     //让4泡消失的计时暂停
                        closeresvis.stop()
                    }
                    onClicked: {
                        tanchuang1_leave.start()
                        resgoback.start()
                        closeres.start()
                        closeresvis.start()
                        show3pao.start()
                    }
                }
            }

            //消失于右侧
            PropertyAnimation {
                id: tanchuang1_leave
                target: tanchuang1
                property: "anchors.leftMargin"
                easing.type: Easing.OutCubic
                to: page_2.width
                duration: 500
            }
        }

        //弹窗2
        Item {
            id: tanchuang2
            visible: false
            opacity: 0.95
            anchors.left: parent.left
            anchors.leftMargin: parent.width
            anchors.top: parent.top
            width: parent.width*0.9
            height: parent.height

            //title + list
            Image {
                id: listsquare2
                anchors.fill: parent
                source: "qrc:/tanchuang.png"

                //左标题 Gene名称
                Rectangle {
                    id: leftgenetitle2
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.035
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.03
                    width: parent.width*0.26
                    height: parent.height*0.1
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("   Cluster of\nEssential Gene")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 25
                    }
                }

                //右标题 Description
                Rectangle {
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.03
                    anchors.left: leftgenetitle2.right
                    anchors.leftMargin: 0
                    width: parent.width*0.83 - leftgenetitle2.width
                    height: parent.height*0.13
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Description")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 29
                    }
                }

                //list表
                ListView {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.08
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.15
                    width: parent.width*0.765
                    height: parent.height*0.66
                    clip: true
                    model: list2

                    ListModel{
                        id: list2
                    }
                    delegate: Item {
                        height: 50
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            Text {
                                anchors.leftMargin: 10
                                anchors.left: parent.left
                                height: parent.height
                                text: name + "         " + description
                                elide: Text.ElideMiddle
                                fontSizeMode: Text.VerticalFit
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.pixelSize: 26
                                font.family: "Segoe UI"
                            }
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        closeres.stop()     //让4泡消失的计时暂停
                        closeresvis.stop()
                    }
                    onClicked: {
                        tanchuang2_leave.start()
                        resgoback.start()
                        closeres.start()
                        closeresvis.start()
                        show3pao.start()
                    }
                }
            }

            PropertyAnimation {
                id: tanchuang2_leave
                target: tanchuang2
                property: "anchors.leftMargin"
                easing.type: Easing.OutCubic
                to: page_2.width
                duration: 500
            }
        }

        //弹窗3
        Item {
            id: tanchuang3
            visible: false
            opacity: 0.95
            anchors.left: parent.left
            anchors.leftMargin: parent.width
            anchors.top: parent.top
            width: parent.width*0.9
            height: parent.height

            //title + list
            Image {
                id: listsquare3
                anchors.fill: parent
                source: "qrc:/tanchuang.png"

                //左标题 Gene名称
                Rectangle {
                    id: leftgenetitle3
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.035
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.03
                    width: parent.width*0.26
                    height: parent.height*0.1
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("   Cluster of\nEssential Gene")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 25
                    }
                }

                //右标题 Description
                Rectangle {
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.03
                    anchors.left: leftgenetitle3.right
                    anchors.leftMargin: 0
                    width: parent.width*0.83 - leftgenetitle3.width
                    height: parent.height*0.13
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Description")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 29
                    }
                }

                //list表
                ListView {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.08
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.15
                    width: parent.width*0.765
                    height: parent.height*0.66
                    clip: true
                    model: list3

                    ListModel{
                        id: list3
                    }
                    delegate: Item {
                        height: 50
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            Text {
                                anchors.leftMargin: 10
                                anchors.left: parent.left
                                height: parent.height
                                text: name + "         " + description
                                elide: Text.ElideMiddle
                                fontSizeMode: Text.VerticalFit
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.pixelSize: 26
                                font.family: "Segoe UI"
                            }
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        closeres.stop()     //让4泡消失的计时暂停
                        closeresvis.stop()
                    }
                    onClicked: {
                        tanchuang3_leave.start()
                        resgoback.start()
                        closeres.start()
                        closeresvis.start()
                        show3pao.start()
                    }
                }
            }

            PropertyAnimation {
                id: tanchuang3_leave
                target: tanchuang3
                property: "anchors.leftMargin"
                easing.type: Easing.OutCubic
                to: page_2.width
                duration: 500
            }
        }

        //弹窗4
        Item {
            id: tanchuang4
            visible: false
            opacity: 0.95
            anchors.left: parent.left
            anchors.leftMargin: parent.width
            anchors.top: parent.top
            width: parent.width*0.9
            height: parent.height

            //title + list
            Image {
                id: listsquare4
                anchors.fill: parent
                source: "qrc:/tanchuang.png"

                //左标题 Gene名称
                Rectangle {
                    id: leftgenetitle4
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.035
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.03
                    width: parent.width*0.26
                    height: parent.height*0.1
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("   Cluster of\nEssential Gene")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 25
                    }
                }

                //右标题 Description
                Rectangle {
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.03
                    anchors.left: leftgenetitle4.right
                    anchors.leftMargin: 0
                    width: parent.width*0.83 - leftgenetitle4.width
                    height: parent.height*0.13
                    color: "transparent"
                    Text {
                        anchors.centerIn: parent
                        text: qsTr("Description")
                        font.family: "Segoe UI"
                        font.bold: true
                        color: "black"
                        font.pixelSize: 29
                    }
                }

                //list表
                ListView {
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width*0.08
                    anchors.top: parent.top
                    anchors.topMargin: parent.height*0.15
                    width: parent.width*0.765
                    height: parent.height*0.66
                    clip: true
                    model: list4

                    ListModel{
                        id: list4
                    }
                    delegate: Item {
                        height: 50
                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            Text {
                                anchors.leftMargin: 10
                                anchors.left: parent.left
                                height: parent.height
                                text: name + "         " + description
                                elide: Text.ElideMiddle
                                fontSizeMode: Text.VerticalFit
                                verticalAlignment: Text.AlignVCenter
                                color: "black"
                                font.pixelSize: 26
                                font.family: "Segoe UI"
                            }
                        }
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        closeres.stop()     //让4泡消失的计时暂停
                        closeresvis.stop()
                    }
                    onClicked: {
                        tanchuang4_leave.start()
                        resgoback.start()
                        closeres.start()
                        closeresvis.start()
                        show3pao.start()
                    }
                }
            }

            PropertyAnimation {
                id: tanchuang4_leave
                target: tanchuang4
                property: "anchors.leftMargin"
                easing.type: Easing.OutCubic
                to: page_2.width
                duration: 500
            }
        }
    }

    //Web_Page
    Item {
        id: webpage
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
                url: "https://www.baidu.com/"
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
            text: "1"
            onClicked: {
                webpage.visible = false
            }
        }
    }

    //记录窗口
    Window{
        id:recorditem
        width: 400
        height: 300
        flags: Qt.FramelessWindowHint
        modality: Qt.ApplicationModal
        property int num:0
        Item{
            anchors.fill: parent
            Rectangle{
                anchors.fill: parent
                color:"#DDDDDD"
            }

            //关闭按钮
            Button{
                width:30
                height: 30
                anchors.right:parent.right
                anchors.top: parent.top
                anchors.rightMargin: 5
                anchors.topMargin: 5
                style:ButtonStyle{
                    background: Rectangle{
                        anchors.fill: parent
                        color:control.hovered?"red":"transparent"
                        Image {
                            width:25
                            height: 25
                            anchors.centerIn: parent
                            source:control.hovered?"qrc:/NO1.png":"qrc:/NO.png"
                        }
                    }
                }
                onClicked: {
                    recorditem.close()
                }
            }

            //nodata
            Rectangle{
                id:nodata
                property  int n: 0
                anchors.fill: parent
                visible: n==0?true:false
                color:"transparent"
                Text{
                    anchors.centerIn: parent
                    font.family: "Segoe Script"
                    text:"No Data!"
                    font.pixelSize: 30
                }
            }
            //记录model
            ListModel{
                id:recordlist
            }
            //记录列表
            ListView{
                id:recordlistitem
                anchors.top: parent.top
                anchors.topMargin: 50
                height: parent.height-80
                width: parent.width
                model:recordlist
                delegate: Item{
                    width: parent.width
                    height: 30
                    //假@复选框
                    Button{
                        id:check
                        anchors.right: parent.right
                        anchors.rightMargin: 8
                        height: 30
                        width:30
                        Rectangle{
                            anchors.fill: parent
                            Image{
                                id:checked
                                anchors.fill: parent
                                source:"qrc:/check1.png"
                                visible:false
                            }
                            color:"transparent"
                        }

                        onClicked: {
                            if(checked.visible===true){
                                recorditem.num=recorditem.num-1
                                checked.visible=false
                                recordlist.get(index).flag=0
                            }
                            else{
                                if(recorditem.num===2)
                                    return
                                else{
                                    checked.visible=true
                                    recorditem.num=recorditem.num+1
                                    recordlist.get(index).flag=1
                                }
                            }
                        }
                    }
                    //删除
                    Button{
                        id:del
                        height: parent.height
                        width: 30
                        tooltip: "Delete this item"
                        style:ButtonStyle{
                            background: Rectangle{
                                anchors.fill: parent
                                color:control.hovered?"red":"transparent"
                                Image {
                                    width:25
                                    height: 25
                                    anchors.centerIn: parent
                                    source:control.hovered?"qrc:/delete1.png":"qrc:/delete.png"
                                }
                            }
                        }

                        onClicked: {
                            recordlist.remove(index)
                            nodata.n=recordlist.count
                        }
                    }

                    //
                    Rectangle{
                        height: parent.height-2
                        anchors.left: del.right
                        width: parent.width-check.width-del.width
                        color:"transparent"
                        Text{
                            anchors.centerIn: parent
                            text:label
                            font.family: "Microsoft YaHei"
                        }
                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                record_show_list.clear()
                                for(var i=1;i<recordlist.get(index).source.length;i+=2){
                                    var s=String(recordlist.get(index).source.charAt(i-1)+recordlist.get(index).source.charAt(i))
                                    record_show_list.append({"name":ogCtl.tran2Name(s)})
                                }
                                record_show.x=recorditem.x+recorditem.width
                                record_show.y=recorditem.y+30
                                record_show.height=20*record_show_list.count
                                record_show.show()
                            }
                            onExited: {
                                record_show.close()
                            }
                        }
                    }
                    Rectangle{
                        height: parent.width
                        width:2
                        rotation: 90
                        y:-height*0.5+parent.height
                        x:parent.width*0.5
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#DDDDDD" }
                            GradientStop { position: 0.8; color: "#DDDDDD" }
                            GradientStop { position: 1.0; color: "black" }
                        }
                    }
                }
            }

            Rectangle{
                width: parent.width
                height: 30
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                visible:!nodata.visible
                color:"transparent"
                //color:"#444444"
                Text{
                    anchors.centerIn: parent
                    text:"You can choose two and only two item to compare."
                    font.family: "Segoe Script"
                }
            }

            //提交按钮
            Button{
                //text:"Compare"
                width:50
                height: 30
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.right: parent.right
                anchors.rightMargin:5
                visible: !nodata.visible
                style:ButtonStyle{
                    background: Rectangle{
                        anchors.fill: parent
                        color:control.hovered?"#AAAAAA":"transparent"
                        Image {
                            width:30
                            height: 30
                            anchors.centerIn: parent
                            source:control.hovered?"qrc:/next1.png":"qrc:/next.png"
                        }
                    }
                }
                onClicked: {
                    if(recorditem.num!=2)
                        return
                    var s=new String
                    for(var i=0;i<recordlist.count;i++){
                        if(recordlist.get(i).flag)
                            s=s+recordlist.get(i).source
                    }

                }
            }
        }

        //记录展示窗口
        Window {
            id:record_show
            color: "gray"
            opacity: 0.9
            visible: false
            flags:Qt.FramelessWindowHint
            Item{
                anchors.fill: parent

                ListModel{
                    id:record_show_list
                }
                ListView{
                    anchors.fill: parent
                    model:record_show_list
                    delegate: Rectangle{
                        width: parent.width
                        height: 20
                        color:index%2?"white":"#444444"
                        Text{
                            anchors.centerIn: parent
                            color:index%2?"#444444":"white"
                            text:name
                            font.family: "KaiTi"
                        }
                    }
                }
            }
        }
    }
}

