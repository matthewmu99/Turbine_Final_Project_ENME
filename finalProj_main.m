% ENME 337
% Turbine Final Project
close all;
clc;
population = 335696; % Population of Victoria

% Loading files provided files
load TURBINE_DATA/radius.dat
load TURBINE_DATA/chord.dat
load TURBINE_DATA/NACA64.dat
load TURBINE_DATA/omega.dat
load TURBINE_DATA/twist.dat

% Loading Wind Data
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

% Sending values to function Blade_Plot which plots the geometry of the
% blade
Plot_Blade_Diagram(radius,chord,twist,xDivC,yDivC);

% Sending imported monthly wind data to function Adjust_WindData
[windSpds, windDirs, allData] = Adjust_Wind_Data(JanuaryData,FebruaryData,MarchData,AprilData,MayData,JuneData,JulyData,...
    AugustData,SeptemberData,OctoberData,NovemberData,DecemberData);

% Sending matrix allData to function Create_WindRose
Plot_Wind_Rose(allData);

Wind = 3:25; % creating vector of wind speeds

% Sending information to function Power_Per_Windspeed to calculate power
[rotorPower] = Compute_Power_perWSpeed(radius,chord,twist,NACA64,omega,Wind);
MPower = rotorPower/(10^6); % converting power to MW
MPower(MPower>5)=5; % limiting power to 5 MW

Plot_RPower_Speed(MPower,Wind)

% Sending windspeeds in m/s and power in MW to function wind_Speed_perMonth
Plot_WSpeed_perMonth(windSpds,MPower);

% Sending information to function Energy
Compute_Energy(population,MPower,allData(1,:));
