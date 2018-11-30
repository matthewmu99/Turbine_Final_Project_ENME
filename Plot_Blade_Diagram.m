function [] = Plot_Blade_Diagram(radius,chord,twist,xDivC,yDivC)
%Creates a plot of the shape of the turbine blade. Three different views
%are displayed on one figure to show the overall shape.

x = chord*xDivC';
%Multiplies chord by yDivC to compute the x value
y = chord*yDivC';
%Multiplies chord by yDivC to compute the y value
z1 = radius;
%adds radius to a variable
z2  = zeros(size(x));
%prealocates a variable for radius in the loop

for i = 1:length(xDivC)
    %copies z1 into columns in z2
    z2(:,i) = z1;
end

figure('Name','Blade Diagram');
%names the figure
Screen = get(0,'ScreenSize');
Screen(3:4) = Screen(3:4)-100;
%creates size of screen
set(gcf,'Position', Screen, 'Color', 'k')
%sets size of screen and background colour to black
subplot(2,2,[1 3])
%creates subplot

for i = 1:length(radius)
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    %plots blade for every radius
    hold on
    
end



axis([-1,5,-1,5,0,65])
%sets axis size of graph
pbaspect([1 2 5])
%sets ratio of axis size
view(0,-35)
%changes view
axis off


subplot(2,2,2)
%next subplot, same except changes view
for i = 1:length(radius)
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    hold on
    
end
view(2)
axis([-1,5,-1,1,0,65])
axis off


subplot(2,2,4)
%next subplot, same except changes view
for i = 1:length(radius)
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    hold on
    
end

axis([-1 5 -1 2 0 70])
pbaspect([1 2 5])
xlabel('x');
ylabel('y');
zlabel('z');
view(90,45)
axis off
annotation('textbox',[.4 0.8 0.2 .1],'String','Blade Plots','EdgeColor','none','Color','r','FontSize',30,'HorizontalAlignment','center')
hold off
% print('Blade','-depsc');
end

