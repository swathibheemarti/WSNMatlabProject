function PlotALLAgents(ALL, S)

%plot a graph for all the agents and mark the ordinary agents with blue 
%and suspicious agents in red over time t = 1 to 10
%BEGIN FIGURE 1

figure;
for i = 1:10
    plot(ALL(:,1,i),ALL(:,2,i),'.');
    hold on;
    plot(ALL(S(find(S)),1,i),ALL(S(find(S)),2,i),'r.');
    xlabel('X - Location');
    ylabel('Y - Location');
    Grid on;
end
%END FIGURE 1

end