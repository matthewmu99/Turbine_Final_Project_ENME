speed = [6 4 2 5 4 2 1 1 3 4];
direction = [3 5 2 2 3 6 3 5 2 2];

%
directSpeed4 = [];
for i = 1:length(speed)
    if speed(i) < 4
        x = length(directSpeed4)+1;
        directSpeed4(x) =  direction(i);
    end
end

%
directSpeed3 = [];
for i = 1:length(speed)
    if speed(i) < 3
        x = length(directSpeed3)+1;
        directSpeed3(x) =  direction(i);
    end
end

%
directSpeed2 = [];
for i = 1:length(speed)
    if speed(i) < 2
        x = length(directSpeed2)+1;
        directSpeed2(x) =  direction(i);
    end
end

%
directSpeed1 = [];
for i = 1:length(speed)
    if speed(i) < 1
        x = length(directSpeed1)+1;
        directSpeed1(x) =  direction(i);
    end
end




rose(direction,36)
hold on

rose(directSpeed4,36)
rose(directSpeed3,36)
rose(directSpeed2,36)
rose(directSpeed1,36)

