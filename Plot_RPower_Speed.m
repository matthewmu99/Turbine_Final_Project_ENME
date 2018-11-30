function [] = Plot_RPower_Speed(rotorPower,windSpeed)
%Plot_RPower_Speed takes in the rotor power in MW for speeds 3 to 25, and
%the wind speed of values 3 to 25. It then interpolates the rotor power at
%each wind speeds and plots the data


figure('Name','Rotor Power as a Function of Wind Speed'); %Creating the figure

x= windSpeed; %Setting x as wind speed
y = rotorPower; %Setting y as rotor power at each wind speed
xi = 0:0.01:27; %Making a new x for speeds of zero through 27
yi = interp1(x,y,xi,'pchip'); %Interpolating y values for each x value
yi(xi<3)=0; %Setting the power to 0 when speed is less than 3
yi(xi>25)=0; %Setting the power to 0 when speed is more than 25
yi(yi>5)=5; %Setting the power that is greater than 5 to 5



plot(xi,yi,'Linewidth',1); %Plotting the interpolated data of the rotor power vs windspeed

title('Rotor Power as a Function of Wind Speed'); %Setting the title
xlabel('Wind Speed [m/s]'); %Labelling the x axis
ylabel('Rotor Power [MW]'); %Labelling the y axis
grid on %Showing the grid
grid minor
axis([0 27 0 6]) %Setting the limits of the axis
xticks(min(xi):max(xi)); %Setting the x ticks to increase by 1
% print('PowerSpeed','-depsc'); %Printing the figure

end

