import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    visible: true
    width:	480
    height:	300

    Item {
        id:	root
        width:	parent.width
        height:	parent.height
        property	int	duration:	3000

        Rectangle	{
            id:	sky
            width:	parent.width
            height:	parent.height * 2/3
            gradient:	Gradient	{
                GradientStop	{	position:	0.0;	color:	"#0080FF"	}
                GradientStop	{	position:	1.0;	color:	"#66CCFF"	}
            }
            MouseArea	{
                anchors.fill:	parent
                onClicked:	{
                anim.resume()
                }
            }
        }
        Rectangle	{
            id:	ground
            anchors.top:	sky.bottom
            anchors.bottom:	root.bottom
            width:	parent.width
            gradient:	Gradient	{
                GradientStop	{	position:	0.0;	color:	"#00FF00"	}
                GradientStop	{	position:	1.0;	color:	"#00803F"	}
            }
            MouseArea	{
                anchors.fill:	parent
                onClicked:	{
                anim.pause()
                }
            }
        }
    }

    Image	{
        id:	ball
        x:	20;	y:	240
        source:	"qrc:/gur-project-20.png"
        MouseArea	{
            anchors.fill:	parent
            onClicked:	{
            anim.start()
            }
        }

        ParallelAnimation	{
            id:	anim
            //设置y方向
            SequentialAnimation	{
                NumberAnimation	{
                    target:	ball
                    properties:	"y"
                    to:	20
                    duration:	root.duration	*	0.4
                    easing.type:	Easing.OutCirc      //缓冲曲线
                }
                NumberAnimation	{
                    target:	ball
                    properties:	"y"
                    to:	240
                    duration:	root.duration	*	0.6
                    easing.type:	Easing.OutBounce
                }
            }
            //设置x方向
            SequentialAnimation	{
                NumberAnimation	{
                    target:	ball
                    properties:	"x"
                    to:	400
                    duration:	root.duration
                }
                NumberAnimation	{
                    target:	ball
                    properties:	"x"
                    to:	20
                    duration:	root.smooth
                }
            }

            RotationAnimation	{   //设置球自转
                target:	ball
                properties:	"rotation"
                to:	720
                duration:	root.duration	*	1.1
            }
        loops: Animation.Infinite   //无限循环
        }
    }
}
