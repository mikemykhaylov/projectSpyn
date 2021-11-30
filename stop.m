clear
myev3 = legoev3('USB')
right = motor(myev3, 'A');
left = motor(myev3, 'D');

left.Speed = 0;
right.Speed = 0;