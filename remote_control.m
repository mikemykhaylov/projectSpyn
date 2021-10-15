clear
myev3 = legoev3('Bluetooth','/dev/tty.GP-SerialPort')
l = motor(myev3, 'A');
r = motor(myev3, 'D');
c = motor(myev3, 'B');
start(l)
start(r)
start(c)

h_fig = figure;
set(h_fig,'KeyPressFcn',{@keyUpHandler, r, l, c});
set(h_fig,'KeyReleaseFcn',{@keyReleaseHandler, r, l, c});

function keyUpHandler(~,event, right, left, claw)
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
    otherwise
        quit()    
   end
end

function keyReleaseHandler(~, ~, right, left, claw) 
    right.Speed = 0;
    left.Speed = 0;
    claw.Speed = 0;
end