function PlotXYLocationsWithSuspeciousAgents(ALL, S, gridSize, side)

figure;

plot(ALL(:, 1, 1),ALL(:, 2, 1), '.');
hold on;
plot(ALL(S(1,find(S(1,:))), 1, 1),ALL(S(1,find(S(1,:))), 2, 1),'r.');

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