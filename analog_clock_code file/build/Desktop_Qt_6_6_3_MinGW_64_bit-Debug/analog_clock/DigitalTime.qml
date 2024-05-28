import QtQuick 2.0

Item {
    function getTime() {
        var hour = rootClock.currentDate.getHours();
        var suffix = (hour >= 12) ? "\n  PM" : "\n  AM";

        if (!show12HourFormat) {
            hour = hour.toString().padStart(2, '0');
            return hour + ":" + rootClock.currentDate.getMinutes().toString().padStart(2, '0');
        } else {
            hour = (hour % 12 == 0) ? 12 : hour % 12;
            return hour.toString().padStart(2, '0') + ":" + rootClock.currentDate.getMinutes().toString().padStart(2, '0') + " " + suffix;
        }
    }

    Rectangle {
        width: 80
        height: 60
        color: Qt.rgba(1, 1, 1, showTimeText ? 0.5 : 0)
        x:width*2
        y:height*2
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
