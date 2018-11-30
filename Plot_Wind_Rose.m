function [] = Plot_Wind_Rose(allData)
% Creates the wind rose plot, which shows the wind speeds associated with
% the different wind direction. Uses allData as an imput because allData
% contains wind speed in one row and wind direction in the other row

speed = allData(1,:);
%assigns the wind speed in m/s (rounded to the nearest integral) to the
%variable speed

direction = allData(2,:);
%assigns the wind direction in radians to the variable directiom


directSpeed5 = [];
%creates a varible in which to store all directions for speeds that are
%smaller than 6

for i = 1:length(speed)
    %loops through all the wind speeds
    if speed(i) < 6
        %selects the speeds that are smaller than 4
        x = length(directSpeed5)+1;
        %calculates the index of the final element in directSpeed4 if one
        %more element is added
        
        directSpeed5(x) =  direction(i);
        %adds the direction matching the index of the speed selected in the
        %if statement to the end of directSpeed4
    end
end


directSpeed4 = [];
%creates a varible in which to store all directions for speeds that are
%smaller than 5

for i = 1:length(speed)
    %loops through all the wind speeds
    if speed(i) < 5
        %selects the speeds that are smaller than 4
        x = length(directSpeed4)+1;
        %calculates the index of the final element in directSpeed4 if one
        %more element is added
        
        directSpeed4(x) =  direction(i);
        %adds the direction matching the index of the speed selected in the
        %if statement to the end of directSpeed4
    end
end


directSpeed3 = [];
%creates a varible in which to store all directions for speeds that are
%smaller than 4

for i = 1:length(speed)
    %loops through all the wind speeds
    if speed(i) < 4
        %selects the speeds that are smaller than 4
        x = length(directSpeed3)+1;
        %calculates the index of the final element in directSpeed4 if one
        %more element is added
        
        directSpeed3(x) =  direction(i);
        %adds the direction matching the index of the speed selected in the
        %if statement to the end of directSpeed4
    end
end


directSpeed2 = [];
%creates a varible in which to store all directions for speeds that are
%smaller than 3

for i = 1:length(speed)
    %loops through all the wind speeds
    if speed(i) < 3
        %selects the speeds that are smaller than 3
        x = length(directSpeed2)+1;
        %calculates the index of the final element in directSpeed3 if one
        %more element is added
        
        directSpeed2(x) =  direction(i);
        %adds the direction matching the index of the speed selected in the
        %if statement to the end of directSpeed3
    end
end


directSpeed1 = [];
%creates a varible in which to store all directions for speeds that are
%smaller than 2 and greater than 0

for i = 1:length(speed)
    %loops through all the wind speeds
    if speed(i) < 2 && speed(i) > 0
        %selects the speeds that are smaller than 2 and greater than 0
        x = length(directSpeed1)+1;
        %calculates the index of the final element in directSpeed2 if one
        %more element is added
        
        directSpeed1(x) =  direction(i);
        %adds the direction matching the index of the speed selected in the
        %if statement to the end of directSpeed2
    end
end



figure('Name','Rose Plot')
%names the figure for the rose plot

polarhistogram(direction,36)
%Creates a polar histogram using all the directions. There are 36 different
%directions, therefore the histogram is divided into 36 different sections.
%The size of the sections is determined by the frequency of the direction.
%The more often a direction occurs, the larger the section.

hold on
%allows other histograms to be added to the current histogram

polarhistogram(directSpeed5,36)
polarhistogram(directSpeed4,36)
polarhistogram(directSpeed3,36)
polarhistogram(directSpeed2,36)
polarhistogram(directSpeed1,36)
%Plots the histogram for each different speed. This will show the the
%different speeds in every direction.

rlim([0 665])
%limits the polar axis to a certain size
rticks([220.5 441 661.5])
%adds ticks to certains lengths of the polar axis
rticklabels({'2.5%','5%','7.5%'})
%adds labels to the ticks to show the percentage that each length of the
%polar axis corresponds to

lgd = legend('>5','5','4','3','2','1');
%creates a legend for the different speeds
title(lgd,'Wind Speed (m/s)')
%adds a title to the legend

pax = gca;
%creates a variable for the polar axis
pax.ThetaDir = 'clockwise';
%degrees on the graph increase clockwise
pax.ThetaZeroLocation = 'top';
%zero appears at the top

title('Wind Rose')
%adds title to plot

end