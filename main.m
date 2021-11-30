clear
myev3 = legoev3('Bluetooth', '/dev/tty.HANDY')
% myev3 = legoev3('USB')
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

wall_closing(right, left, sonic, gyro)
wall_follower(right, left, sonic, touch, color, gyro, 'blue')

disp("Going manual")
left.Speed = 0;
right.Speed = 0;
remote_control_v2(right, left, claw, gyro)

wall_closing(right, left, sonic, gyro)
wall_follower(right, left, sonic, touch, color, gyro, 'yellow')

disp("Going manual")
left.Speed = 0;
right.Speed = 0;
remote_control_v2(right, left, claw, gyro)
