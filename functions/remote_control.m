function [] = remote_control(right, left, claw, gyro)
speed = 50;
h_fig = figure;
set(h_fig,'KeyPressFcn',{@keyUpHandler, right, left, claw, gyro, speed});
set(h_fig,'KeyReleaseFcn',{@keyReleaseHandler, right, left, claw});
end

function keyUpHandler(~,event, right, left, claw, gyro, speed)
key = event.Key;
switch key
    case 'w'
        right.Speed = speed;
        left.Speed = speed;
    case 's'
        right.Speed = -speed;
        left.Speed = -speed;
    case 'a'
        right.Speed = speed;
        left.Speed = -speed;
    case 'd'
        right.Speed = -speed;
        left.Speed = speed;
    case 'q'
        claw.Speed = -50;
    case 'e'
        claw.Speed = 50;
    case 'g'
        gyro.resetRotationAngle();
    case 'r'
        smart_rotation(right, left, gyro, "r");
    case 'l'
        smart_rotation(right, left, gyro, "l");
    otherwise
        return
end
end

function keyReleaseHandler(~, ~, right, left, claw)
right.Speed = 0;
left.Speed = 0;
claw.Speed = 0;
end