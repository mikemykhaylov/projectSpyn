function [] = self_correction(right, left, gyro, direction)
%SELF_CORRECTION Fool-proof rotation algorithm
%   Detailed explanation goes here
speed = 30;
currentRot = gyro.readRotationAngle;
angle = 0;
if direction == "r"
    angle = 90 - mod(currentRot, 90);
else
    angle = -mod(currentRot, 90);
end
targetRot = currentRot + angle;
while abs(targetRot - currentRot) ~= 0
    currentRot = gyro.readRotationAngle();
    if targetRot < currentRot
        right.Speed = -speed;
        left.Speed = speed;
    else
        right.Speed = speed;
        left.Speed = -speed;
    end     
end
right.Speed = 0;
left.Speed = 0;
end