function [Power] = Power_Per_Windspeed(radius,chord,twist,NACA64,omega,Speed)
%Power_Per_Windspeed takes in the radius, chord, twist, NACA64, omega, and 
%the wind speeds from 3 to 25 and calculates the power at each speed for
%the wind turbine.

B = 3; aCritical = 0.2; AirDensity = 1.23;  %Setting constant values
omega = omega*2*pi/60;  %Converting to radians/second
twist = twist*pi/180;       %Converting to radians
TangentialLoad = zeros(length(radius),length(Speed));   %Preallocating the tangential load

for s = 1:length(radius) %Looping over each radius/chord/twist
    
    
    for q = 1:length(Speed)     %Looping through each speed
        aCurrent = aCritical;
        aPast = 1; 
        aCurrentPrime = aCritical; 
        aPastPrime = 1;  %Resetting values for each different speed
        
        
        while (abs(aCurrent - aPast) > 1e-6)|| (abs(aCurrentPrime - aPastPrime) > 1e-6)     %If a or a' changes enter the loop
     
            aPast = aCurrent;    %Storing the past a
            aPastPrime = aCurrentPrime; %Storing the past a
            
            tanphi = (((1-aCurrent)*Speed(q))/((1+aCurrentPrime)*omega(Speed(q))*radius(s)));  %Calculating phi step 2
            phi = atan(tanphi);
            alpha = phi - twist(s);     %Finding attack angle step 3
            
            
            while alpha > pi || alpha < -pi     %If alpha is too big or small, putting it in the correct range
                if alpha > pi
                    alpha = alpha - pi;
                else
                    alpha = alpha + pi;
                end
            end
            
            alpha = alpha*180/pi;         %Converting alpha to degrees
            CLift = interp1(NACA64(:,1),NACA64(:,2),alpha);  %Interpolating the lift coefficient step 4
            CDrag = interp1(NACA64(:,1),NACA64(:,3),alpha); %Interpolating the drag coefficient step 4
            
            CNormal = CLift*cos(phi)+CDrag*sin(phi);    %Finding the normalized force step 5
            CTangent = CLift*sin(phi)-CDrag*cos(phi);   %Finding the tangential force step 5
            
            sigma = (chord(s)*B)/(2*pi*radius(s));  %Calculating solidity step 6
            aCurrent = ((4*(sin(phi))^2)/(sigma*CNormal)+1)^(-1);  %Finding the new a step 6
            aCurrentPrime = ((4*sin(phi)*cos(phi))/(sigma*CTangent)-1)^(-1);   %Finding the new a' step 6
            
            if aCurrent > aCritical     %If a is too big
                K = (4*(sin(phi))^2)/(sigma*CNormal);   %Finding the K value step 7
                aCurrent = 1/2*(2+K*(1-2*aCritical)-sqrt((K*(1-2*aCritical)+2)^2+4*(K*(aCritical)^2-1)));     %Finding the new a step 7
            end
            
           
        end     %Redo loop if a or a' change step 8
        
        VRelative = (Speed(q)*(1-aCurrent))/(sin(phi));     %Finding the relative velocities step 9
        TangentialLoad(s,q) = 1/2*CTangent*AirDensity*VRelative^2*chord(s);     %Finding the tangential load step 9
    
    end     %Loop again through each speed

end     %Loop again through each radius

M = zeros(length(radius)-1,length(Speed));     %Preallocating the shaft torque matrix

for j = 1:length(Speed)    %Looping through each speed of tangential load
    
    for i = 1:length(radius)-1  %Looping through each radius of tangential load
        
        A = (TangentialLoad(i+1,j)-TangentialLoad(i,j))/(radius(i+1)-radius(i));    %Finding A step 11
        B2 = (radius(i+1)*TangentialLoad(i,j)-radius(i)*TangentialLoad(i+1,j))/(radius(i+1)-radius(i));  %Finding B step 11
        M(i,j)=1/3*A*((radius(i+1))^3-(radius(i))^3)+1/2*B2*((radius(i+1))^2-(radius(i))^2);     %Finding the shaft torque step 11
    
    end     %Go to the next radius

end     %Go to the next speed


MTotal = B*sum(M);  %Finding the total shaft torque at each speed step 12
Power = zeros(1,length(Speed));    %Preallocating the power matrix


for i = 1:length(MTotal)    %Looping through for each wind speed
    Power(i) = MTotal(i)*omega(Speed(i));   %Calculating power step 13
end     %Go to next wind speed

end

