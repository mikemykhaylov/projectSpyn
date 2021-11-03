function [] = smart_rotation(right, left, gyro, direction)
%SELF_CORRECTION Fool-proof rotation algorithm
speed = 27;
currentRot = gyro.readRotationAngle;
angle = 0;
if direction == "r"
    angle = 90 - mod(currentRot, 90);
    if angle < 10
        angle = angle + 90;
    end
else
    angle = -mod(currentRot, 90);
    if angle > -10
        angle = angle - 90;
    end
end
disp(currentRot)
disp(angle)
targetRot = currentRot + angle;
while abs(targetRot - currentRot) ~= 0
    currentRot = gyro.readRotationAngle();
    if targetRot < currentRot
        left.Speed = -speed;
        right.Speed = speed;
    else
        left.Speed = speed;
        right.Speed = -speed;
    end     
end
left.Speed = 0;
right.Speed = 0;
end