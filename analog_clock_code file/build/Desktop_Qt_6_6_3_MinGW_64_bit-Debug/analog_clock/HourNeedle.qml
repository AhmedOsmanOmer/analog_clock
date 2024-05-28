import QtQuick 2.0

Item {
id: rootClock

Rectangle {
        id: hourNeedle
        width: 12
        height: rootClock.height * 0.28
        color: "black"
        antialiasing: true
        visible:rootClock.showHourNeedle
        transformOrigin: Item.Top // Set the transform origin to the top of the rectangle

        MouseArea {
            id: hourMouseArea
            anchors.fill: parent
            onPositionChanged: {
                var point = mapToItem(rootClock.plate, mouseX, mouseY);
                var diffX = point.x - rootClock.plate.width / 2;
                var diffY = point.y - rootClock.plate.height / 2;
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
                rootClock.hourCircle.updatePosition(); // Update the hour circle position continuously
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



}
