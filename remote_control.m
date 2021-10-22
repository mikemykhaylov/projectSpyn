clear
% myev3 = legoev3('Bluetooth','/dev/tty.GP-SerialPort')
myev3 = legoev3('USB')
left = motor(myev3, 'A');
right = motor(myev3, 'D');
claw = motor(myev3, 'B');
gyro = gyroSensor(myev3, 3);
start(left)
start(right)
start(claw)

gyro.resetRotationAngle();

h_fig = figure;
set(h_fig,'KeyPressFcn',{@keyUpHandler, right, left, claw, gyro});
set(h_fig,'KeyReleaseFcn',{@keyReleaseHandler, right, left, claw});

function keyUpHandler(~,event, right, left, claw, gyro)
   key = event.Key;
   switch key
    case 'w'
        right.Speed = 100;
        left.Speed = 100;
    case 's'
        right.Speed = -100;
        left.Speed = -100;
    case 'a'
        right.Speed = -100;
        left.Speed = 100;
    case 'd'
        right.Speed = 100;
        left.Speed = -100;
    case 'q'
        claw.Speed = -50;
    case 'e'
        claw.Speed = 50;
    case 'g'
        gyro.resetRotationAngle();
    case 'r'
        self_correction(right, left, gyro, "r");   
    case 'l'
        self_correction(right, left, gyro, "l");      
   end
end

function keyReleaseHandler(~, ~, right, left, claw) 
    right.Speed = 0;
    left.Speed = 0;
    claw.Speed = 0;
end