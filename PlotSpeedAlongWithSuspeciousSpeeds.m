function PlotSpeedAlongWithSuspeciousSpeeds(ALL, S, sdGridSize)

figure;
%Scaling speed from 3.5 to 4.5 to 0 to 1 (S - 3.5)
%Scaling direction from 0 to 10 to 0 to 1 (D / 10)
plot(ALL(:,3,1)-3.5,ALL(:,4,1)/10,'.');
hold on
plot(ALL(S(1,find(S(1,:))), 3, 1)-3.5,ALL(S(1,find(S(1,:))), 4, 1)/10,'r.');

hold on;
%Draw vertical lines
y = 0:0.001:1;
for i = 0:(1/sdGridSize)
    x = sdGridSize * i;
    plot(x, y,'-black');
end

hold on;
%Draw horizontal lines
x = 0:0.001:1;
for i = 0:(1/sdGridSize)
    y = sdGridSize * i;
    plot(x, y,'-black');
end

end