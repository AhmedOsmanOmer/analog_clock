import QtQuick 2.0

Item {
id:controlButtons

/// show hour needle button
Rectangle {
    id: hourButton
    width: 50
    height: 40
    border.color: "black"
    border.width: 2
    radius: 10
    color: "transparent"
    anchors {
        top: parent.top
        left: parent.left
        topMargin: 400
        leftMargin: -50
    }
    Text {
        text: "Hour Hand"
        font.pixelSize: plate.height * 0.03
        verticalAlignment: Text.AlignVCenter
        x: 60
        y: parent.height / 2 - height / 2
    }

    Text {
        anchors.centerIn: parent
        text: showHourNeedle ? "OFF" : "ON"
        font.pixelSize: plate.height * 0.05
    }

    MouseArea {
        anchors.fill: parent
        onClicked: showHourNeedle = !showHourNeedle
    }
}


///show minutes needle button
Rectangle {
    id: minuteButton
    width: 50
    height: 40
    color: "transparent"
    border.color: "black"
    border.width: 2
    radius: 10
    anchors {
        top: parent.top
        left: parent.left
        topMargin: -20
        leftMargin: -50
    }
    Text {
        text: "Minutes Hand"
        font.pixelSize: plate.height * 0.03
        verticalAlignment: Text.AlignVCenter
        x: 60
        y: parent.height / 2 - height / 2
    }
    Text {
        anchors.centerIn: parent
        text: showMinuteNeedle ? "OFF" : "ON"
        font.pixelSize: plate.height * 0.05
    }

    MouseArea {
        anchors.fill: parent
        onClicked: showMinuteNeedle = !showMinuteNeedle
    }
}

////show dashed lines button
Rectangle {
    id: dashedLine
    width: 50
    height: 40
    color: "transparent"
    border.color: "black"
    border.width: 2
    radius: 10
    anchors {
        top: hourButton.bottom
        left: hourButton.left
        topMargin: -100
        leftMargin: 450
    }
    Text {
        text: "Dash Lines"
        font.pixelSize: plate.height * 0.03
        verticalAlignment: Text.AlignVCenter
        x: -60
        y: parent.height / 2 - height / 2
    }
    Text {
        anchors.centerIn: parent
        text: showDashLine ? "OFF" : "ON"
        font.pixelSize: plate.height * 0.05
    }

    MouseArea {
        anchors.fill: parent
        onClicked: showDashLine = !showDashLine
    }
}


/// show digital hour button
Rectangle {
    id: showDigitalTime
    width: 50
    height: 40
    color: "transparent"
    border.color: "black"
    border.width: 2
    radius: 10
    anchors {
        top: parent.top
        left: parent.left
        topMargin: -20
        leftMargin: 400
    }
    Text {
        text: "Digital"
        font.pixelSize: plate.height * 0.03
        verticalAlignment: Text.AlignVCenter
        x: -50
        y: parent.height / 2 - height / 2
    }

    Text {
        anchors.centerIn: parent
        text: showTimeText ? "OFF" : "ON"
        font.pixelSize: plate.height * 0.05
    }

    MouseArea {
        anchors.fill: parent
        onClicked: showTimeText = !showTimeText
    }
}

//// show 12 hour format button
Rectangle {
    id: formatButton12
    width: 80
    height: 40
    border.color: "black"
    border.width: 2
    radius: 10
    color: "transparent"
    anchors {
        top: hourButton.bottom
        left: hourButton.left
        topMargin: -40
        leftMargin: 350
    }

    Text {
        text: "12"
        font.pixelSize: plate.height * 0.05
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: show12HourFormat = true
    }
}


//// show 24 hour format button
Rectangle {
    id: formatButton24
    width: 80
    height: 40
    border.color: "black"
    border.width: 2
    radius: 10
    color: "transparent"
    anchors {
        top: hourButton.bottom
        left: formatButton12.right
        topMargin: -40
        leftMargin: 10
    }

    Text {
        text: "24"
        font.pixelSize: plate.height * 0.05
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: show12HourFormat = false
    }
}


//// border colors buttons
Rectangle {
        color: "transparent"
        width: 400
        height: 100
        anchors {
            top: parent.top
            left: parent.left
            topMargin: 420
            leftMargin: -50
                }

        //// black color button
        Rectangle {
            width: 25
            height: 25
            radius: 15
            color: "black"
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            MouseArea {
                anchors.fill: parent
                onClicked: rootClock.clockBorderColor = "black"
            }
        }

        //// blue color button
        Rectangle {
            width: 25
            height: 25
            radius: 15
            color: "blue"
            anchors.left: parent.left
            anchors.leftMargin: 50
            anchors.verticalCenter: parent.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: rootClock.clockBorderColor = "blue"
            }
        }

        //// orange color button

        Rectangle {
            width: 25
            height: 25
            radius: 15
            color: "orange"
            anchors.left: parent.left
            anchors.leftMargin: 100
            anchors.verticalCenter: parent.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: rootClock.clockBorderColor = "orange"
            }
        }


        //// green color button
        Rectangle {
            width: 25
            height: 25
            radius: 15
            color: "green"
            anchors.left: parent.left
            anchors.leftMargin: 150
            anchors.verticalCenter: parent.verticalCenter

            MouseArea {
                anchors.fill: parent
                onClicked: rootClock.clockBorderColor = "green"
            }
        }
    }
}
