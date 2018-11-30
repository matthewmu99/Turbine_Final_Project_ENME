function [] = Compute_Energy(Population,Power,AllWind)
% Compute_Energy takes in the population of the city, the power created
% from wind speeds from 3 to 25, and the data for all of the wind in one
% year for that city. It then computes the total energy needed to power the
% city for one year, the total energy created in one year by one turbine,
% and then finds the total number of turbines needed to power the city.

EnergyPerPerson = 16.5; %Setting the energy
EnergyNeeded = EnergyPerPerson*Population; %Finding the energy needed for the whole population
Power = [0 0 Power]; %Setting the power for speeds of 1 to 25
NumberOfHours = zeros(1,length(Power)); %Setting the number of hours at each power

for i = 1:length(NumberOfHours) %Running through each wind speed
    NumberOfHours(i) = length(find(AllWind==i)); %Finding the number of hours at each wind speed
end

EnergyCreated = sum(Power.*NumberOfHours); %Multiplying the power of each wind speed by the hours at each wind speed and summing the total
TotalTurbines = EnergyNeeded/EnergyCreated; %Divide the needed energy by the energy by 1 turbine
TotalTurbines = ceil(TotalTurbines); %Rounding up to get number of turbines needed
fprintf('The total number of turbines needed to power the city of Victoria is %d \nwhere the total energy produced in one year per turbine is %g MWh,\nand the needed energy to power the city for the year is %g MWh \n',TotalTurbines,EnergyCreated,EnergyNeeded); %Printing a statement
end

