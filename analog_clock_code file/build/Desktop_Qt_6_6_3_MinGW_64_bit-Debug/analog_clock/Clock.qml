import QtQuick 2.0

Item {
    anchors.topMargin: 200
    visible: true
    id: rootClock
    width: 400
    height: 400
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


    Rectangle {
        id: plate
        anchors.centerIn: parent
        height: Math.min(rootClock.width, rootClock.height)
        width: height+10
        radius: width / 2
        color: "transparent"
        border.color: clockBorderColor
        border.width: 20
    }

    //// the numbers in the clock black border


    Repeater {
        model: 12
        Item {
            id: numbers
            property int hour: index
            width: 20
            height: width
            x: (plate.width / 2) + (plate.width / 2 - 15 + 7) * Math.cos((270 + index * 30) * Math.PI / 180) - width / 2 - 10 + 3
            y: (plate.height / 2) + (plate.height / 2 - 15 + 7) * Math.sin((270 + index * 30) * Math.PI / 180) - height / 2
            Text {
                text: (hour * 5).toString().padStart(2, '0')
                font.pixelSize: plate.height * 0.03
                color: "white"
                anchors.centerIn: parent
                font.bold: true
            }
        }
    }

    ClockFace{
    z:-1
    }
    ClockNeedles{}
    ControlButtons{}
    DashedCircles{ }
    DigitalTime{}


}
