clear

myev3 = legoev3('USB')
left = motor(myev3, 'A');
right = motor(myev3, 'D');
colorSens = colorSensor(myev3, 1);

start(left)
start(right)

speed = 30;


right.Speed = speed;
left.Speed = speed;
while 1
    color = readColor(colorSens);
    disp(color)
    if color == "red"
        right.Speed = 0;
        left.Speed = 0;
        pause(2)
        right.Speed = speed;
        left.Speed = speed;
        pause(1.5)
    elseif color == "blue" || color == "green" || color == "yellow" || color == "brown"
        right.Speed = 0;
        left.Speed = 0;
        if color == "blue" || color == "green"
            disp('Pickup Zone')
        else
            disp('Dropoff Zone')
        end
        
    else
        right.Speed = speed;
        left.Speed = speed;
    end
end