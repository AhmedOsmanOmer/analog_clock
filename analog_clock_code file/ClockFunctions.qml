import QtQuick 2.0

Item {
    id: clockFunctions

    function updateRotation(mouseX, mouseY, plate, needle, degreesPerUnit) {
        var point = plate.mapToItem(rootClock, mouseX, mouseY);
        var diffX = point.x - plate.width / 2;
        var diffY = point.y - plate.height / 2;
        var rad = Math.atan2(diffY, diffX);
        var deg = rad * 180 / Math.PI;
        if (deg < 0) deg += 360;
        var rotation = (deg / degreesPerUnit) * degreesPerUnit;
        needle.rotation = rotation + 180;

        var units = Math.floor(deg / degreesPerUnit);
        var currentDate = new Date(rootClock.currentDate);

        switch (needle) {
            case rootClock.hourNeedle:
                currentDate.setHours(units);
                currentDate.setMinutes((deg % degreesPerUnit) * 2);
                rootClock.minuteNeedle.rotation = 6 * currentDate.getMinutes() + currentDate.getSeconds() / 10 + 180;
                rootClock.hourCircle.updatePosition();
                break;
            case rootClock.minuteNeedle:
                var prevMinutes = currentDate.getMinutes();
                currentDate.setMinutes(units);
                if ((units === 0 && prevMinutes === 59) || (units === 59 && prevMinutes === 0)) {
                    currentDate.setHours(currentDate.getHours() + (units === 0 ? 1 : -1));
                }
                rootClock.hourNeedle.rotation = 30 * (currentDate.getHours() % 12) + currentDate.getMinutes() / 2 + 180;
                break;
            case rootClock.secondNeedle:
                currentDate.setSeconds(units);
                break;
        }

        rootClock.currentDate = currentDate;
    }


    ////
    function updateHours(mouseX, mouseY, plate) {
        updateRotation(mouseX, mouseY, plate, rootClock.hourNeedle, 30);
    }

    ////
    function updateMinutes(mouseX, mouseY, plate) {
        updateRotation(mouseX, mouseY, plate, rootClock.minuteNeedle, 6);
    }

     ////
    function updateSeconds(mouseX, mouseY, plate) {
        updateRotation(mouseX, mouseY, plate, rootClock.secondNeedle, 6);
    }
}
