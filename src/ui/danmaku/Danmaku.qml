﻿import QtQuick 2.1
import QtQuick.Controls 2.12

Label{
    id: root

    property var info: ({})
    property var speed: 1.0
    readonly property int pixPerSecond: 100
    readonly property int delayTimsMs: 5000
    z:10
    color: "#"+info.color.toString(16)
    text: info.body
    font.pixelSize: info.size
    font.family: "微软雅黑"
    font.weight: Font.Medium

    function togglePause(isPause){
        if(isPause){
            flyAnim.pause()
        }else{
            flyAnim.resume()
        }
        //console.log("danm togglePause:"+isPause)
    }

    function start(){
        switch(info.mode){
        case 4://底部
        case 5://顶部
            hCenter()
            break;
        default://1-滚动
            fly()
            break;
        }
    }

    function hCenter(){
        x = (parent.width-width)/2
        root.destroy(delayTimsMs)
        //console.log("danm hCenter:")
    }

    function fly(){
        x = parent.width
        flyAnim.start()
        //console.log("danm fly:")
    }

    NumberAnimation on x{
        id:flyAnim
        running: false
        from:parent.width
        to:0-root.width
        duration: 1000*(parent.width+width)/(speed*pixPerSecond)
        onStopped:{
            root.destroy()
            //console.log("danm destroyed:"+text)
        }
    }
}
