% ENME 337
% Turbine Final Project
close all;
clc
population = 335696;


load TURBINE_DATA/radius.dat
load TURBINE_DATA/chord.dat
load TURBINE_DATA/NACA64.dat
load TURBINE_DATA/omega.dat
load TURBINE_DATA/twist.dat
%Load Wind Data
AprilData = Import_Weather ('TURBINE_DATA/WIND_DATA/AprilData.csv');
JanuaryData = Import_Weather ('TURBINE_DATA/WIND_DATA/JanurayData.csv');
MayData = Import_Weather ('TURBINE_DATA/WIND_DATA/MayData.csv');
AugustData = Import_Weather ('TURBINE_DATA/WIND_DATA/AugustData.csv');
JulyData = Import_Weather ('TURBINE_DATA/WIND_DATA/JulyData.csv');
NovemberData = Import_Weather ('TURBINE_DATA/WIND_DATA/NovemberData.csv');
DecemberData = Import_Weather ('TURBINE_DATA/WIND_DATA/DecemberData.csv');
JuneData = Import_Weather ('TURBINE_DATA/WIND_DATA/JuneData.csv');
OctoberData = Import_Weather ('TURBINE_DATA/WIND_DATA/OctoberData.csv');
FebruaryData = Import_Weather ('TURBINE_DATA/WIND_DATA/FebruaryData.csv');
SeptemberData = Import_Weather ('TURBINE_DATA/WIND_DATA/SeptemberData.csv');
MarchData = Import_Weather ('TURBINE_DATA/WIND_DATA/MarchData.csv');
xDivC = xlsread('TURBINE_DATA/Final Project Airfoil Profile.xlsx','A3:A207');
yDivC = xlsread('TURBINE_DATA/Final Project Airfoil Profile.xlsx','B3:B207');

Blade_Plot(radius,chord,twist,xDivC,yDivC);

yearData = [JanuaryData;FebruaryData;MarchData;AprilData;MayData;JuneData;JulyData;...
    AugustData;SeptemberData;OctoberData;NovemberData;DecemberData];

[windSpds, windDirs, allData] = Adjust_WindData(JanuaryData,FebruaryData,MarchData,AprilData,MayData,JuneData,JulyData,...
    AugustData,SeptemberData,OctoberData,NovemberData,DecemberData);

Create_WindRose(allData);

Wind = 3:25;

[rotorPower] = Power_Per_Windspeed(radius,chord,twist,NACA64,omega,Wind);
MPower = rotorPower/(10^6); 
MPower(MPower>5)=5;
Rotor_Power_Speed_Plot(MPower,Wind)

wind_Speed_perMonth(windSpds,MPower);

Energy(population,MPower,allData(1,:));
