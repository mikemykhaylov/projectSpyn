function [] = wall_follower(right, left, sonic, touch, color, gyro, stop_color)
%FOLLOW_WALL Implements right wall follower algorithm
%   Detailed explanation goes here
rSpeed = 55;
lSpeed = rSpeed + 3;
right.Speed = rSpeed;
left.Speed = lSpeed;
while 1
    current_dist = sonic.readDistance();
    if current_dist < 0.40
        disp("Need to get closer to wall, currently at distance " + current_dist)
        wall_closing(right, left, sonic, gyro)
    end
    right.Speed = rSpeed;
    left.Speed = lSpeed;
    dead_end = 0;
    while 1
        current_dist = sonic.readDistance();
        current_color = color.readColor();
        if strcmp(current_color,"red")
            right.Speed = 0;
            left.Speed = 0;
            pause(2)
            right.Speed = rSpeed;
            left.Speed = lSpeed;
            pause(1)
        end
        if strcmp(current_color,stop_color)
            true = 1;
            for a = 0:5
                current_color = color.readColor();
                if ~strcmp(current_color,stop_color)
                    true = 0;
                end
            end
            if true
                return
            end
        end
        if touch.readTouch()
            dead_end = 1;
            break
        end
        if current_dist > 0.2
            break
        end
    end
    if dead_end
        go_with_red_detection(right, left ,color, 0.3, -rSpeed, -lSpeed)
    else
        go_with_red_detection(right, left ,color, 0.5, rSpeed, lSpeed)
    end
    right.Speed = 0;
    left.Speed = 0;
    if dead_end
        smart_rotation(right, left, gyro, "l");
    else
        smart_rotation(right, left, gyro, "r");
    end
    go_with_red_detection(right, left ,color, 1.5, rSpeed, lSpeed)
end
end

