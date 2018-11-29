function [] = Energy(Population,Power,AllWind)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
EnergyPerPerson = 16.5; %Setting the energy
EnergyNeeded = EnergyPerPerson*Population; %Finding the energy needed for the whole population
Power = [0 0 Power]; %Setting the power for speeds of 1 to 25
NumberOfHours = zeros(1,length(Power)); %Setting the number of hours at each power

for i = 1:length(NumberOfHours) %Running through each wind speed
    NumberOfHours(i) = length(find(AllWind==i)); %Finding the number of hours at each wind speed
end

%EnergyCreated = mean(Power.*freq.*NumberOfDays); %energy made by 1 turbine

EnergyCreated = sum(Power.*NumberOfHours); %Multiplying the power of each wind speed by the hours at each wind speed and summing the total
TotalTurbines = EnergyNeeded/EnergyCreated; %Divide the needed energy by the energy by 1 turbine
TotalTurbines = ceil(TotalTurbines); %Rounding up to get number of turbines needed
fprintf('The total number of turbines needed to power the city of Victoria is %d \nwhere the total energy produced in one year per turbine is %gMWh,\nand the needed energy to power the city for the year is %gMWh \n',TotalTurbines,EnergyCreated,EnergyNeeded); %Printing a statement
end

