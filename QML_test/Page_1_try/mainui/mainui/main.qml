import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.2
ApplicationWindow {
    title: qsTr("Hello World")
    width: 800
    height: 480
    visible: true

    ListView{
        id: navigation
        width: parent.width*0.15
        height: parent.height
        snapMode: ListView.SnapOneItem
        focus: true
        delegate:Component{
            Item{
                width:parent.width
                height: parent.parent.height*0.25
                Text{
                    text:title
                    anchors.centerIn: parent.anchors.centerIn
                    font.pixelSize: parent.height*0.618
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        navigation.currentIndex=index
                        ui.currentIndex=index
                    }
                    onWheel: {
                        if(wheel.angleDelta.y>90&&navigation.currentIndex>0){
                            navigation.currentIndex=navigation.currentIndex-1
                            ui.currentIndex=navigation.currentIndex
                        }
                        else if(wheel.angleDelta.y<-90&&navigation.currentIndex<3){
                            navigation.currentIndex=navigation.currentIndex+1
                            ui.currentIndex=navigation.currentIndex
                        }
                    }
                }
            }
        }
        highlight: Component{
            Item{
                width:parent.width
                height:parent.height
                Rectangle{
                   anchors.fill:parent
                   color:"lightGreen"
                }
            }
        }

        model: ListModel{
            ListElement{
                title:"1"
            }
            ListElement{
                title:"2"
            }
            ListElement{
                title:"3"
            }
            ListElement{
                title:"4"
            }
        }

    }

    TabView{
        id:ui
        anchors.left: navigation.right
        width:parent.width-navigation.width
        height: parent.height
        tabsVisible: false

        Tab{
            Item{
                Item{
                    id:unselect

                    anchors.left: parent.left
                     width:parent.width*0.5
                    height: 300
                    anchors.top: parent.top

                    Image{
                        anchors.fill: parent
                        source:"image/image/18.png"
                        z:0
                    }

                    ListView{
                        id:unselectlist
                        anchors.fill:parent
                        model: ListModel{
                            ListElement{
                                name:"1"
                            }
                            ListElement{
                                name:"2"
                            }
                            ListElement{
                                name:"3"
                            }
                            ListElement{
                                name:"4"
                            }
                            ListElement{
                                name:"5"
                            }
                            ListElement{
                                name:"6"
                            }
                            ListElement{
                                name:"7"
                            }

                        }

                        delegate: Item{
                            width: parent.width
                            height: 30
                            Rectangle{
                                id:rec
                                anchors.fill: parent
                                color:"transparent"
                                Text{
                                    text:name
                                }
                            }
                            MouseArea{
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: {
                                    rec.color="lightgreen"
                                    unselectlist.currentIndex=index
                                    parent.height=50
                                }
                                onExited: {
                                    parent.height=30
                                    rec.color="transparent"
                                }
                            }
                        }
                        focus:true


                    }

//                    TableView{
//                        id:unselectlist
//                        anchors.fill:parent
//                        model: unselected_sp
//                        backgroundVisible: false
//                        rowDelegate: Rectangle{
//                            color:"transparent"
//                        }

//                        TableViewColumn{
//                            title:"name"
//                            role:"name"
//                            //delegate: itemcomponent
//                        }


//                    }
                }
                Item{
                    id:select
                    width: parent.width*0.5
                    height: unselect.height
                    anchors.top:parent.top
                    anchors.left: unselect.right
                    TableView{
                        id:selectedlist
                        anchors.fill: parent
                        model:selected_sp
                        TableViewColumn{
                            title:"name"
                            role:"name"
                        }
                    }
                }
            }
        }
        Tab{

        }
        Tab{
            title:"3"
            anchors.fill: parent
            Text{
                text:"3"
            }
        }
        Tab{
            title:"4"
            anchors.fill: parent
            Text{
                text:"4"
            }
        }
    }
}
