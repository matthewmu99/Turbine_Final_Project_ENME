function [] = Plot_WSpeed_perMonth(windSpds, power)
% This function plots a histogram bar chart of the various wind speeds. In
% addittion, it plots energy overtop

p = 1; %initial plot position

figure('Name','Monthly Wind Speed Distribution') %Define a new figure for the plot

monthLbls = {'January','February','March','April','May','June','July','August','September','October','November','December'}; %an array of the month names
power = [0,0 ,power]; %format the power matrix containing power for each wind speed (add 0s to make 1x25)

for i = 1:12 %loop thru all 12 months
    
    y = windSpds(:,i); %hist values to plot. these are the wind speeds
    subplot(3,4,p) % make a sub plot for all 12 graphs
    hist(y) %make the histogram plot for that month
    p = p+1; %change the sub plot position
    
    title(monthLbls(i)); %put the month title from the array above (monthLbls)
    xlabel('Wind Speed [m/s]'); %label x
    ylabel('Frequency [Hours]'); %label y (left axis)
    grid on %turn on the grid
    set(gcf, 'Position', [100, 100, 1000, 500]) %set the window size so that everything is not squished
    
    
    xticks(0:2:20); %define a consistent set of xticks (used for every graph)
    xlim([0,20]);  %define a consistent set of xticks (used for every graph) limit the ticks
    ylim([0,300]) %define a consistent set of yticks (used for every graph)
    yticks(0:100:300); %define a consistent set of yticks (used for every graph) limit the ticks
    h = findobj(gca,'Type','patch'); %find bars to use to change its colour
    h.FaceColor = [0.6, 0.8, 1]; %change its colour to the difned rgb values
    
    freq = unique(windSpds(:,i)); %the quantity of how many unique wind speeds occur
    freq(isnan(freq)) = []; %remove the NaN values from the array
    lfreq = length(freq); %get the length of unique wind speeds
    %array of unique windspeeds
    %     compute energy
    val = hist(y,lfreq); %get the number of hours that unique wind speed happens (into a array)
    energy = zeros(1,lfreq); %declare the energy matrix (initialized it)
    for j = 1:lfreq
        if freq(j) == 0
            energy(j)= 0;
        else
            energy(j) = power(freq(j)).*val(j); %compute energy with power and the value of number of hours
        end
    end
    
    hold on
    
    
    yyaxis right %set a right y axis
    plot(1:lfreq, energy,'r') %plot the energy and make it red
    yticks(0:25:150); %set the right y ticks
    ylim([0,150]); %limit the y ticks
    ax = gca;
    ax.YAxis(2).Color = 'r'; %make the y ticks red on the right
    
    ylabel('Energy [MWh]'); %label
    
    
    
end

end

