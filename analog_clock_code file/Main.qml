import QtQuick 2.0

Window{
    width: 740
    height:660
    visible: true
    title: "Analog Clock"

    Clock {
        anchors.centerIn: parent
        id: clock
        width:  400
        height: 400
    }

}



