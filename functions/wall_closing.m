function [] = wall_closing(right, left, sonic, gyro)
%WALL_CLOSING Brings robot closer to the wall
if sonic.readDistance() > 0.15
    left.Speed = 0;
    right.Speed = 0;
    current_rotation = gyro.readRotationAngle();
    while gyro.readRotationAngle() < current_rotation + 30
        left.Speed = 25;
        right.Speed = -25;
    end

    while sonic.readDistance() > 0.15
        left.Speed = 35;
        right.Speed = 35;
    end

    left.Speed = 0;
    right.Speed = 0;
    smart_rotation(right, left, gyro, "l")
end
end