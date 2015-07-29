import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2
import QtQml.Models 2.2

ApplicationWindow {
    id: applicationWindow1
    title: qsTr("Maccap")
    width: 640
    height: 480
    visible: true
    Component{
        id: mycomponent
        Text {
            text:name
        }
    }

    Item{
        id:select
        anchors.fill:parent
        visible:true
        TableView{
            id:unselected_sp
            width: parent.width*0.5
            height:parent.height
            TableViewColumn{
                title :"unselected species"
                role:"name"
            }
            ListModel{
                id:sp
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
            }
            model : sp
            onClicked:  {
                _sp.append(sp.get(currentRow))
                sp.remove(currentRow,1);
            }
        }

        TableView{
            id :selected_sp
            width:parent.width*0.5
            anchors.right: parent.right
            height: parent.height-20
            anchors.leftMargin: 10

            ListModel{
                id:_sp
            }

            model:_sp
            TableViewColumn{
                title:"selected spcies"
                role:"name"
            }
            onClicked:  {
                sp.append(_sp.get(currentRow))
                _sp.remove(currentRow,1);
            }
        }

        Button{
            id :push
            anchors.left: selected_sp.left
            anchors.top: selected_sp.bottom
            width:selected_sp.width
            height: 20
            text:"Push"
            onClicked: {
                select.visible=false
                show_minigeneset.visible=true
            }
        }
    }

    Item{
        id: show_minigeneset
        anchors.fill: parent
        visible: false

        ColumnLayout{
            id:l1
            spacing:0
            anchors.fill: parent
            property int ncount: 1
            Button{
                id:re1
                Layout.preferredWidth:parent.width
                Layout.preferredHeight: 20
                text:"1"

                onClicked: {
                    if(r1.visible==true){
                        l1.ncount--
                        if(!l1.ncount){
                            l1.ncount=1
                        }
                        else{
                            r1.visible=false
                        }
                    }
                    else{
                        l1.ncount++
                        r1.visible=true
                    }
                }
            }

            TableView{
                id:r1
                Layout.preferredWidth:parent.width
                Layout.fillHeight: true
                TableViewColumn{
                    title:"species"
                    role:"name"
                }
                TableViewColumn{
                    title:"Brief Introductioin"
                    role:"data"
                }
                ListModel{
                    id:result1
                }

                model:result1
            }

            Button{
                id:re2
                Layout.preferredWidth:parent.width
                Layout.preferredHeight: 20
                text:"2"
                onClicked: {
                    if(r2.visible==true){
                        l1.ncount--
                        if(!l1.ncount){
                            l1.ncount=1
                            return
                        }
                        else{
                            r2.visible=false
                        }
                    }
                    else{
                        l1.ncount++
                        r2.visible=true
                    }
                }
            }
            TableView{
                id:r2
                Layout.preferredWidth:parent.width
                Layout.fillHeight: true
                visible: false
                TableViewColumn{
                    title:"species"
                    role:"name"
                }
                TableViewColumn{
                    title:"Brief Introductioin"
                    role:"data"
                }
                ListModel{
                    id:result2
                }

                model:result2
            }
            Button{
                id:re3
                Layout.preferredWidth:parent.width
                Layout.preferredHeight: 20
                text:"3"
                onClicked: {
                    if(r3.visible==true){
                        l1.ncount--
                        if(!l1.ncount){
                            l1.ncount=1
                            return
                        }
                        else{
                            r3.visible=false
                        }
                    }
                    else{
                        l1.ncount++
                        r3.visible=true
                    }
                }
            }
            TableView{
                id:r3
                Layout.preferredWidth:parent.width
                Layout.fillHeight: true
                visible: false
                TableViewColumn{
                    title:"species"
                    role:"name"
                }
                TableViewColumn{
                    title:"Brief Introductioin"
                    role:"data"
                }
                ListModel{
                    id:result3
                }

                model:result3
            }
            Button{
                id:re4
                Layout.preferredWidth:parent.width
                Layout.preferredHeight: 20
                text:"4"
                onClicked: {
                    if(r4.visible==true){
                        l1.ncount--
                        if(!l1.ncount){
                            l1.ncount=1
                            return
                        }
                        else{
                            r4.visible=false
                        }
                    }
                    else{
                        l1.ncount++
                        r4.visible=true
                    }
                }
            }
            TableView{
                id:r4
                Layout.preferredWidth:parent.width
                Layout.fillHeight: true
                visible: false
                TableViewColumn{
                    title:"species"
                    role:"name"
                }
                TableViewColumn{
                    title:"Brief Introductioin"
                    role:"data"
                }
                ListModel{
                    id:result4
                }

                model:result4
            }
            Button{
                id:re5
                Layout.preferredWidth:parent.width
                Layout.preferredHeight: 20
                text:"5"
                onClicked: {
                    if(r5.visible==true){
                        l1.ncount--
                        if(!l1.ncount){
                            l1.ncount=1
                            return
                        }
                        else{
                            r5.visible=false
                        }
                    }
                    else{
                        l1.ncount++
                        r5.visible=true
                    }
                }
            }
            TableView{
                id:r5
                Layout.preferredWidth:parent.width
                Layout.fillHeight: true
                visible: false
                TableViewColumn{
                    title:"species"
                    role:"name"
                }
                TableViewColumn{
                    title:"Brief Introductioin"
                    role:"data"
                }
                ListModel{
                    id:result5
                }

                model:result5
            }
        }
        }


}

