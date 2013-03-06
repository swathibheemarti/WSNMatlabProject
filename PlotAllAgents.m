function PlotAllAgents(ALL, S, laps)

%plot a graph for all the agents and mark the ordinary agents with blue 
%and suspicious agents in red over time t = 1 to 10
%BEGIN FIGURE 1

figure;
for i = 1:laps
    plot(ALL(:,1,i),ALL(:,2,i),'.');
    hold on;
    plot(ALL(S(i,find(S(i,:))), 1, i),ALL(S(i,find(S(i,:))), 2, i),'r.');
    xlabel('X - Location');
    ylabel('Y - Location');
    grid on;
end
%END FIGURE 1

end