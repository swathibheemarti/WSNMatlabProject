function PlotXYLocationsWithSuspeciousAgents(ALL, S, gridSize, side)

figure;
for i = 1:1
    plot(ALL(:,1,i),ALL(:,2,i),'.');
    hold on;
    plot(ALL(S(find(S)),1,i),ALL(S(find(S)),2,i),'r.');
end

hold on;
%Draw vertical lines
y = 1:side;
for i = 1:(side/gridSize)
    x = gridSize * i;
    plot(x, y, '-black');
end

hold on;
%Draw horizontal lines
x = 1:side;
for i = 1:(side/gridSize)
    y = gridSize * i;
    plot(x, y, '-black');
end

end