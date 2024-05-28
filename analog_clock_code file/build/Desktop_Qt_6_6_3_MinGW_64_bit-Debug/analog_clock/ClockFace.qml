import QtQuick 2.0

Item {
    id:clockFace
     /// Min hour dashes
        Repeater {
            model: 60
            Item {
                id: minDashes
                height: plate.height / 2
                transformOrigin: Item.Bottom
                rotation: index * 6
                x: plate.width / 2
                y: 0
                z:-1
                Rectangle {
                    height: plate.height * 0.07
                    width: plate.width * 0.004
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                }
            }
        }

        //// hout numbers and dashes
        Repeater {
            model: 12
            Item {
                id: hourContainer
                property int hour: index
                height: plate.height / 2
                transformOrigin: Item.Bottom
                rotation: index * 30
                x: plate.width / 2
                y: 0

                Rectangle {
                    height: plate.height * 0.08
                    width: plate.width * 0.01
                    color: "black"
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    y: plate.height * 0.075
                    rotation: 360 - index * 30
                    text: hourContainer.hour == 0 ? 12 : hourContainer.hour
                    font.pixelSize: plate.height * 0.10
                    font.bold: true
                }
            }
        }



    }


