function [] = go_with_red_detection(right, left, color, duration, rSpeed, lSpeed)
%GO_WITH_RED_DETECTION Summary of this function goes here
%   Detailed explanation goes here
tic
right.Speed = rSpeed;
left.Speed = lSpeed;
while toc < duration
    current_color = color.readColor();
    if strcmp(current_color,"red")
        right.Speed = 0;
        left.Speed = 0;
        pause(2)
        right.Speed = rSpeed;
        left.Speed = lSpeed;
        pause(1)
    end
end
right.Speed = 0;
left.Speed = 0;

