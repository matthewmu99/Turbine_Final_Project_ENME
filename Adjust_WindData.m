function [windSpds,windDirs,yearData] = Adjust_WindData(JanuaryData,FebruaryData,MarchData,AprilData,MayData,JuneData,JulyData,...
    AugustData,SeptemberData,OctoberData,NovemberData,DecemberData)
% Adjust_WindData takes 12 vectors of nx2 with values for wind speed and
% wind direction taken at height h
% converts speeds from km/h to m/s and adjust for height H
% converts direction from degrees to polar
% returns vector of speeds windSpds with each column corresponding to a
% month
% returns vector of directions windDirs with each column corresponding to a
% month
% return a 2xn matrix yearData with all values from windSpds and windDirs
% in respective rows

h = 90;     % Hub height
H = 15;     % Original height at which wind was measured


yearData = [JanuaryData;FebruaryData;MarchData;AprilData;MayData;JuneData;JulyData;...
    AugustData;SeptemberData;OctoberData;NovemberData;DecemberData];

yearData = yearData';

monthCol = [length(JanuaryData),length(FebruaryData),length(MarchData),length(AprilData),length(MayData),length(JuneData),...
    length(JulyData),length(AugustData),length(SeptemberData),length(OctoberData),length(NovemberData),length(DecemberData)];
maxNum = max(monthCol); % calculating the length of the month with the most entries 
                                
monthMat = NaN(maxNum);     % creating a nxn matrix of NaN entries where n = maxNum
monthMat(:,25:end) = [];    % adjusting the matrix to only have 24 col
monthMat = monthMat';       % transposing monthMat so it now has 24 rows



yearData(1,:) = yearData(1,:)/3.6;                % Converting speed from km/h to m/s
yearData(1,:) = round(yearData(1,:)*(h/H)^(1/7)); % Using formula to compute windSpeed at 90m
yearData(2,:) = yearData(2,:)*(pi/18);            % Converting angles from degrees to polar


month = 1;     % setting month to 1 which determines which month is used
yIndex = 1;    % setting yIndex to 1 which determines starting index at which yearData is copyied from in loop
add = 0;    
for i = 1:2:24                                        % looping 12 times  
    l = monthCol(month);                              % setting l to the length of the respective month
    lYear = monthCol(month)+add;                      % setting end index at which data will be used in yearData
    monthMat(i:i+1,1:l) = yearData(1:2,yIndex:lYear); % copying the information for each month from yearData to monthMat
    yIndex = yIndex+l;                                % adding l to yIndex to set starting index for yearData in next iteration
    month = month+1;                                  % adding 1 to month to change month used in next iteration
    add = lYear;                                      % ensures that lYear in next iteration is at correct index by adding previous lYear
end
monthDataT = monthMat';                               %transposing monthMat
windSpds = round(monthDataT(:,1:2:24));               % rounding values for speed and putting them in windSpds
windDirs = round(monthDataT(:,2:2:24));               % rounding values for direction and putting them in windDirs



end

