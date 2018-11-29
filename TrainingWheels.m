load TURBINE_DATA/NACA64.dat

x = NACA64(:,1);
y = NACA64(:,3);
x1 = -180:1:180;
y1 = interp1(x,y,x1);

plot(x,y,'b',x1,y1,'.r')