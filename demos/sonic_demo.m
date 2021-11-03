clear;
myev3 = legoev3('USB');
right = motor(myev3, 'A');
left = motor(myev3, 'D');
sonic = sonicSensor(myev3, 1);
touch = touchSensor(myev3, 3);
gyro = gyroSensor(myev3, 4);
start(right)
start(left)

gyro.resetRotationAngle();

right.Speed = 50;
left.Speed = 50;

while 1
    initial_dist = sonic.readDistance();
    current_dist = sonic.readDistance();
    dead_end = 0;
    while abs(initial_dist - current_dist) < 0.1
        current_dist = sonic.readDistance();
        if touch.readTouch()
            dead_end = 1;
            break
        end
    end
    
    if dead_end
        right.Speed = -50;
        left.Speed = -50;
        pause(0.5)
    else
        pause(1.5)
    end
    right.Speed = 0;
    left.Speed = 0;
    if dead_end
        self_correction(right, left, gyro, "l");
    else
        self_correction(right, left, gyro, "r");
    end
    right.Speed = 50;
    left.Speed = 50;
    pause(1)
end