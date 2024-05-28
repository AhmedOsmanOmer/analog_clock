import QtQuick 2.0

Item {
    id: clockProperties

    property int granularity: 12
    property color color: "white"
    property var currentDate: new Date()
    property bool show12HourFormat: true
    property color clockBorderColor: "black"
    property bool showHourNeedle: true
    property bool showMinuteNeedle: true
    property bool showDashLine: true
    property bool showTimeText: true

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: {
            rootClock.currentDate = new Date(rootClock.currentDate.getTime() + 1000)
        }
    }

}
