import QtQuick 2.0

Item {
    id:rootClock
    Rectangle {
        width: 80
        height: 60
        color: Qt.rgba(1, 1, 1, showTimeText ? 0.5 : 0)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: 110
        }

        Text {
            id: timeText
            anchors.centerIn: parent
            text: getTime()
            font.pixelSize: parent.height * 0.5
            color: showTimeText ? "black" : "transparent"
            font.bold: true
        }
    }
}
