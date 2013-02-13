function PlotXYLocationsWithSuspeciousAgents(ALL, S, gridSize)

figure;
for i = 1:1
    plot(ALL(:,1,i),ALL(:,2,i),'.');
    hold on;
    plot(ALL(S(find(S)),1,i),ALL(S(find(S)),2,i),'r.');
end

hold on;
%Draw vertical lines
y = 1:300;
for i = 1:(300/gridSize)
    x = gridSize * i;
    plot(x, y, '-black');
end

hold on;
%Draw horizontal lines
x = 1:300;
for i = 1:(300/gridSize)
    y = gridSize * i;
    plot(x, y, '-black');
end

end