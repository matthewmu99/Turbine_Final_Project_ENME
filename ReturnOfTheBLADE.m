function [] = ReturnOfTheBLADE(radius,chord,twist,xDivC,yDivC)

x = chord*xDivC';
y = chord*yDivC';
z1 = radius;
z2  = zeros(size(x));
for i = 1:length(xDivC)
    z2(:,i) = z1;
    
end

figure('Name','Blade Diagram')
lr = length(radius); 
x1 = linspace(2.8,61.6,lr);
for i = 1:lr
    
    rotate(plot3(x(i,:),y(i,:),z2(i,:),'r'),[0 0 1],twist(i));
    hold on
    xds(1,:) = x(i,:);
    [xreal(i) yindex] = max(xds);
    yds(1,:) = y(i,:);
    p(i,:) = polyfit(xds,yds,lr-1);
%     y1(i,:) = polyval(p(i),x1);
    yreal(i) = y(i,yindex);
%     length(x1)
%     length(yreal(i,:))
%     length(z2(i,[1:17]))
%     plot3(x1,yreal(i,:),z2(i,[1:17]))
end
    length(xreal)
    length(yreal)
    length(z1)
    xreal
    fprintf('\n')
    yreal
    fprintf('\n')
    radius
    for i = 1:length(twist)
       rotate(plot3(xreal(i),yreal(i),radius(i),'*b'),[0 0 1],twist(i))
      
    end
  
hold off
axis([-1 5 -1 2 0 70])
xlabel('x');
ylabel('y');
zlabel('z');
view(0,90)
end

