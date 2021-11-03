function [] = wall_closing(right, left, sonic, gyro)
%WALL_CLOSING Brings robot closer to the wall

while gyro.readRotationAngle() < 35
    left.Speed = 20;
    right.Speed = -20;
end

while sonic.readDistance() > 0.2
    left.Speed = 50;
    right.Speed = 50;
end

left.Speed = 0;
right.Speed = 0;
smart_rotation(right, left, gyro, "l")
end