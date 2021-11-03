function [] = wall_follower(right, left, sonic, touch, color, gyro, stop_color)
%FOLLOW_WALL Implements right wall follower algorithm
%   Detailed explanation goes here
speed = 55;
right.Speed = speed;
left.Speed = speed + 3;
while 1
    initial_dist = sonic.readDistance();
    current_dist = sonic.readDistance();
    dead_end = 0;
    while abs(current_dist - initial_dist) < 0.1
        current_dist = sonic.readDistance();
        disp(current_dist)
        current_color = color.readColor();
        if strcmp(current_color,stop_color)
            return
        end
        if touch.readTouch()
            dead_end = 1;
            break
        end
    end
    
    if dead_end
        right.Speed = -speed;
        left.Speed = -speed - 3;
        pause(0.7)
    else
        pause(1)
    end
    right.Speed = 0;
    left.Speed = 0;
    if dead_end
        smart_rotation(right, left, gyro, "l");
    else
        smart_rotation(right, left, gyro, "r");
    end
    right.Speed = speed;
    left.Speed = speed + 3;
    pause(1)
end
end

