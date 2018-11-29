function [] = Blade_Plot(radius,chord,twist,xDivC,yDivC)

x = chord*xDivC';
y = chord*yDivC';
z1 = radius;
z2  = zeros(size(x));
for i = 1:length(xDivC)
    z2(:,i) = z1;
    
end
f = figure('Name','Blade Diagram','Position',[0 0 2 2]);
Screen = get(0,'ScreenSize');
Screen(3:4) = Screen(3:4)-100;
set(gcf,'Position', Screen, 'Color', 'k')
subplot(2,2,[1 3])
for i = 1:length(radius)
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    hold on
    
end

% The following modifications were me just playing around with it


axis([-1,5,-1,5,0,65])
pbaspect([1 1 5])
view(0,-35)
axis off


subplot(2,2,2)
for i = 1:length(radius)
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    hold on
    
end
view(2)
axis([-1,5,-1,1,0,65])
axis off


subplot(2,2,4)
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
print('Blade','-depsc');
end

