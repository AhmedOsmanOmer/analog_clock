import QtQuick 2.0

Item {
id:dashedCircles
Canvas {
    visible: showDashLine
    id: hourCircle
    width: 80
    height: 80
    onPaint: {
        var ctx = hourCircle.getContext("2d");
        ctx.clearRect(0, 0, hourCircle.width, hourCircle.height);
        var centerX = hourCircle.width / 2;
        var centerY = hourCircle.height / 2;
        var radius = Math.min(centerX, centerY) - 2;
        var numDashes = 20;
        var dashLength = 1;
        var dashWidth = 5;
        ctx.beginPath();
        for (var i = 0; i < numDashes; i++) {
            var angle = (i / numDashes) * Math.PI * 2;
            var startX = centerX + Math.cos(angle) * radius;
            var startY = centerY + Math.sin(angle) * radius;
            var endX = centerX + Math.cos(angle) * (radius - dashLength);
            var endY = centerY + Math.sin(angle) * (radius - dashLength);
            ctx.moveTo(startX, startY);
            ctx.lineTo(endX, endY);
        }
        ctx.strokeStyle = "grey";
        ctx.lineWidth = dashWidth;
        ctx.stroke();
    }

    Component.onCompleted: {
        hourCircle.updatePosition();
    }

    function updatePosition() {
        var currentHour = rootClock.currentDate.getHours() % 12;
        var currentMinute = rootClock.currentDate.getMinutes();
        var currentFractionalHour = currentHour + currentMinute / 60;
        var radius = Math.min(plate.width, plate.height) / 2 - 60;
        var hourAngle = (270 + currentFractionalHour * 30) * Math.PI / 180;

        var x = (plate.width / 2) + radius * Math.cos(hourAngle) - hourCircle.width / 2;
        var y = (plate.height / 2) + radius * Math.sin(hourAngle) - hourCircle.height / 2;

        hourCircle.x = x;
        hourCircle.y = y;
    }

    Connections {
        target: rootClock
        function onCurrentDateChanged() {
            hourCircle.updatePosition();
        }
    }

}


Canvas {
    visible: showDashLine
    id: minuteCircle
    width: 80
    height: 80
    onPaint: {
        var ctx = minuteCircle.getContext("2d");
        ctx.clearRect(0, 0, minuteCircle.width, minuteCircle.height);
        var centerX = minuteCircle.width / 2;
        var centerY = minuteCircle.height / 2;
        var radius = Math.min(centerX, centerY) - 2;
        var numDashes = 20;
        var dashLength = 1;
        var dashWidth = 5;
        ctx.beginPath();
        for (var i = 0; i < numDashes; i++) {
            var angle = (i / numDashes) * Math.PI * 2;
            var startX = centerX + Math.cos(angle) * radius;
            var startY = centerY + Math.sin(angle) * radius;
            var endX = centerX + Math.cos(angle) * (radius - dashLength);
            var endY = centerY + Math.sin(angle) * (radius - dashLength);
            ctx.moveTo(startX, startY);
            ctx.lineTo(endX, endY);
        }
        ctx.strokeStyle = "grey";
        ctx.lineWidth = dashWidth;
        ctx.stroke();
    }

    Component.onCompleted: {
        minuteCircle.updatePosition();
    }

    function updatePosition() {
        var currentMinute = rootClock.currentDate.getMinutes();
        var radius = Math.min(plate.width, plate.height) / 2 - 60;
        var minuteAngle = (270 + currentMinute * 6) * Math.PI / 180;

        var x = (plate.width / 2) + radius * Math.cos(minuteAngle) - minuteCircle.width / 2;
        var y = (plate.height / 2) + radius * Math.sin(minuteAngle) - minuteCircle.height / 2;

        minuteCircle.x = x;
        minuteCircle.y = y;
    }

    Connections {
        target: rootClock
        function onCurrentDateChanged() {
            minuteCircle.updatePosition();
        }
    }

}

}
