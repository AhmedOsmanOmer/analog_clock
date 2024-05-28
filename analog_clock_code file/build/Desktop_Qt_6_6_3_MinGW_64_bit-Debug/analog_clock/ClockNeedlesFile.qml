import QtQuick 2.0

Item {
    id: rootClock


    Rectangle {
        id: hourNeedle
        width: 12
        height: rootClock.height * 0.28
        color: "black"
        antialiasing: true
        visible: showHourNeedle
        transformOrigin: Item.Top // Set the transform origin to the top of the rectangle

        MouseArea {
            id: hourMouseArea
            anchors.fill: parent
            onPositionChanged: {
                var point = mapToItem(plate, mouseX, mouseY);
                var diffX = point.x - plate.width / 2;
                var diffY = point.y - plate.height / 2;
                var rad = Math.atan2(diffY, diffX);
                var deg = rad * 180 / Math.PI;
                if (deg < 0) deg += 360;
                var hourRotation = (deg / 30) * 30;
                hourNeedle.rotation = hourRotation + 180;
                var hours = Math.floor(deg / 30);
                var minutes = (deg % 30) * 2; // Calculate the minutes based on the remaining degrees
                var currentDate = new Date(rootClock.currentDate);
                currentDate.setHours(hours);
                currentDate.setMinutes(minutes); // Set the minutes
                rootClock.currentDate = currentDate;
                minuteNeedle.rotation = 6 * currentDate.getMinutes() + currentDate.getSeconds() / 10 + 180;
                hourCircle.updatePosition(); // Update the hour circle position continuously
            }
        }

        x: rootClock.width * 0.48 // Move left (negative value)
        y: rootClock.height * 0.495 // Adjust this value as needed to position the needle

        Component.onCompleted: {
            updateRotation();
            rootClock.currentDateChanged.connect(updateRotation);
        }

        function updateRotation() {
            var hours = rootClock.currentDate.getHours() % 12;
            var minutes = rootClock.currentDate.getMinutes();
            hourNeedle.rotation = 30 * hours + minutes / 2 + 180; // Adding 180 degrees offset
        }
    }

    Rectangle {
        id: minuteNeedle
        width: 12
        height: rootClock.height * 0.4
        color: clockBorderColor
        rotation: 6 * rootClock.currentDate.getMinutes() + rootClock.currentDate.getSeconds() / 10 + 180 // Adding 180 degrees offset
        antialiasing: true
        visible: showMinuteNeedle
        transformOrigin: Item.Top // Set the transform origin to the top of the rectangle

        MouseArea {
            id: minuteMouseArea
            anchors.fill: parent
            onPositionChanged: {
                var point = mapToItem(plate, mouseX, mouseY);
                var diffX = point.x - plate.width / 2;
                var diffY = point.y - plate.height / 2;
                var rad = Math.atan2(diffY, diffX);
                var deg = rad * 180 / Math.PI;
                if (deg < 0) deg += 360;
                var minuteRotation = (deg / 6) * 6;
                minuteNeedle.rotation = minuteRotation + 180;
                var minutes = Math.floor(deg / 6);
                var currentDate = new Date(rootClock.currentDate);
                var prevMinutes = currentDate.getMinutes();
                currentDate.setMinutes(minutes);

                // Adjust hours based on minute rotation
                if (minutes === 0 && prevMinutes === 59) {
                    currentDate.setHours(currentDate.getHours() + 1);
                } else if (minutes === 59 && prevMinutes === 0) {
                    currentDate.setHours(currentDate.getHours() - 1);
                }

                rootClock.currentDate = currentDate;

                // Update hour needle
                var hours = currentDate.getHours() % 12;
                hourNeedle.rotation = 30 * hours + currentDate.getMinutes() / 2 + 180;
            }
        }

        x: rootClock.width * 0.48 // Move left (negative value)
        y: rootClock.height * 0.495 // Adjust this value as needed to position the needle

        Component.onCompleted: {
            updateRotation();
            rootClock.currentDateChanged.connect(updateRotation);
        }

        function updateRotation() {
            var minutes = rootClock.currentDate.getMinutes();
            minuteNeedle.rotation = 6 * minutes + rootClock.currentDate.getSeconds() / 10 + 180; // Adding 180 degrees offset
        }
    }

    Rectangle {
        id: secondNeedle
        width: 3
        height: plate.height * 0.42
        color: "red"
        rotation: 6 * rootClock.currentDate.getSeconds()
        antialiasing: true
        anchors.horizontalCenter: parent.horizontalCenter // Center horizontally
        transformOrigin: Item.Bottom // Set the transform origin to the bottom of the rectangle
        x: -width / 2 // Adjust x position to center horizontally
        y: height / 5.5 // from the center vertically and move up by 20 units
        z: -1
    }
}
