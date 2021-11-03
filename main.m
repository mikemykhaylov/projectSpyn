clear
% myev3 = legoev3('Bluetooth', '/dev/tty.GP');
myev3 = legoev3('USB');
right = motor(myev3, 'A');
left = motor(myev3, 'D');
claw = motor(myev3, 'B');
sonic = sonicSensor(myev3, 1);
color = colorSensor(myev3, 2);
touch = touchSensor(myev3, 3);
gyro = gyroSensor(myev3, 4);

start(right)
start(left)
start(claw)
gyro.resetRotationAngle();


if sonic.readDistance() > 0.2
    wall_closing(right, left, sonic, gyro)
end

wall_follower(right, left, sonic, touch, color, gyro, 'never')

disp("Going manual")
left.Speed = 0;
right.Speed = 0;

