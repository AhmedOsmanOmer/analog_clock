import QtQuick 2.0

Item {
    id:clockNeedles

    ////// hour needle
    Rectangle {
            id: hourNeedle
            width: 12
            height: rootClock.height * 0.28
            color: "black"
            antialiasing: true
            visible: showHourNeedle
            transformOrigin: Item.Top
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
                    var minutes = (deg % 30) * 2;
                    var currentDate = new Date(rootClock.currentDate);
                    currentDate.setHours(hours);
                    currentDate.setMinutes(minutes);
                    rootClock.currentDate = currentDate;
                    minuteNeedle.rotation = 6 * currentDate.getMinutes() + currentDate.getSeconds() / 10 + 180;
                }
            }

            x: rootClock.width * 0.48
            y: rootClock.height * 0.495

            Component.onCompleted: {
                   updateRotation();
                   rootClock.currentDateChanged.connect(updateRotation);
               }

               function updateRotation() {
                   var hours = rootClock.currentDate.getHours() % 12;
                   var minutes = rootClock.currentDate.getMinutes();
                   hourNeedle.rotation = 30 * hours + minutes / 2 + 180;
               }
        }


    ////// minutes needle
      Rectangle {
        id: minuteNeedle
        width: 12
        height: rootClock.height * 0.4
        color: clockBorderColor
        rotation: 6 * rootClock.currentDate.getMinutes() + rootClock.currentDate.getSeconds() / 10 + 180
        antialiasing: true
        visible: showMinuteNeedle
        transformOrigin: Item.Top

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
                           if (minutes === 0 && prevMinutes === 59) {
                               currentDate.setHours(currentDate.getHours() + 1);
                           } else if (minutes === 59 && prevMinutes === 0) {
                               currentDate.setHours(currentDate.getHours() - 1);
                           }

                           rootClock.currentDate = currentDate;
                           var hours = currentDate.getHours() % 12;
                         hourNeedle.rotation = 30 * hours + currentDate.getMinutes() / 2 + 180;
                       }
                   }


        x: rootClock.width * 0.48
        y: rootClock.height * 0.495




    Component.onCompleted: {
            updateRotation();
            rootClock.currentDateChanged.connect(updateRotation);
        }

        function updateRotation() {
            var minutes = rootClock.currentDate.getMinutes()
            minuteNeedle.rotation = 6 * minutes + rootClock.currentDate.getSeconds() / 10 + 180
        }
}


      ////// second needle
    Rectangle {
            id: secondNeedle
            width: 3
            height: plate.height * 0.42
            color: "red"
            rotation: 6 * rootClock.currentDate.getSeconds()
            antialiasing: true
            transformOrigin: Item.Bottom
            x: (rootClock.width - width) / 2
            y: rootClock.height * 0.495 - height
            z: -1
        }

}
