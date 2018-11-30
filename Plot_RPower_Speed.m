function [] = Plot_RPower_Speed(rotorPower,windSpeed)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
figure('Name','Rotor Power as a Function of Wind Speed');

x= windSpeed;
y = rotorPower;
xi = 0:0.1:27;
yi = interp1(x,y,xi,'pchip');
yi(xi<3)=0;
yi(xi>25)=0;
yi(yi>5)=5;



plot(xi,yi,'Linewidth',1);

title('Rotor Power as a Function of Wind Speed');
xlabel('Wind Speed [m/s]');
ylabel('Rotor Power [MW]');
grid on
axis([0 27 0 6])
xticks(min(xi):max(xi)); 
% print('PowerSpeed','-depsc');

end

