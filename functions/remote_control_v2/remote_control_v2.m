function [] = remote_control_v2(right, left, claw, gyro)
global key
speed = 50;
init_keyboard();
while 1
    pause(0.1)
    disp(key)
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
            claw.Speed = -100;
        case 'e'
            claw.Speed = 100;
        case 'x'
            break
        case 'r'
            smart_rotation(right, left, gyro, "r");
        case 'l'
            smart_rotation(right, left, gyro, "l");
        case 0
            right.Speed = 0;
            left.Speed = 0;
            claw.Speed = 0;
    end
end
close_keyboard();
end