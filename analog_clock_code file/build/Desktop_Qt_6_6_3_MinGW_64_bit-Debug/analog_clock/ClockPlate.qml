import QtQuick 2.0

Item {
id:clockPlate
Rectangle {
    id: plate
    anchors.centerIn: parent
    height: Math.min(rootClock.width, rootClock.height)
    width: height+10
    radius: width / 2
    color: "transparent"
    border.color: clockBorderColor
    border.width: 20
    Repeater {
        model: 12
        Item {
            id: numbers
            property int hour: index
            width: 20
            height: width
            x: (plate.width / 2) + (plate.width / 2 - 15 + 7) * Math.cos((270 + index * 30) * Math.PI / 180) - width / 2 // Decrease radius by 2 more units
            y: (plate.height / 2) + (plate.height / 2 - 15 + 7) * Math.sin((270 + index * 30) * Math.PI / 180) - height / 2 // Decrease radius by 2 more units



            Text {
                text: (hour * 5).toString().padStart(2, '0')
                font.pixelSize: plate.height * 0.03
                color: "white"
                anchors.centerIn: parent
                font.bold: true
            }
        }
    }
}
}
