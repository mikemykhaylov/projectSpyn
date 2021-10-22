function [] = dumb_turning(right, left, gyro, angle)
adjAngle = 0;
speed = 70
if angle > 0
    adjAngle = angle - 8;
    while gyro.readRotationAngle < adjAngle
        disp(gyro.readRotationAngle)
        right.Speed = speed;
        left.Speed = -speed;
    end
else
    adjAngle = angle + 8;
    while gyro.readRotationAngle > adjAngle
        disp(gyro.readRotationAngle)
        right.Speed = -speed;
        left.Speed = speed;
    end
end
right.Speed = 0;
left.Speed = 0;
end