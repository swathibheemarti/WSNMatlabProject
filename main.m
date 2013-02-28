
function [ALL, DATA, S, avg_Prob_xy, avg_Prob_sd, avg_total_st, k1] = main(noOfAgents, gridSize, lap, side)

cntAgents = noOfAgents;
% create a 3-d array
ALL = zeros(cntAgents,4,lap);

%Data for exporting to excel
DATA = zeros(cntAgents * lap, 11);

% array for agents
FA = GetAgents(cntAgents, side);

%populate third dimension of ALL with first generated array of agents
ALL(:,:,1) = FA;
%get suspicious agents from first generated array of agents

lapi = 1;
S = zeros(lap, cntAgents);

CS = SuspiciousAgents(FA);
for i = 1:length(CS)
    S(lapi,i) = CS(1, i);
end

for i = 2:lap
    % Todo : GetAgents returns a 500x4 array of form (x, y, s, d) where
    % (x,y) is agent location, s is speed, d is direction, we will not use
    % the randomly generated (x,y) but calculate it based on the time,
    % speed and direction, so todo: change GetAgents to generate (x,y) only
    % first time i.e., t = 0;
    CA = GetAgents(cntAgents, side);
    %needed for populating CA
    PA = ALL(:,:,i-1);
    
    %New agent locaton (x1,y1) is (x + s * t * cos(d), y + s * t * sin(d))
    %where s is speed (3.5 to 4.5)  t is time interval which is 1, and d is the
    %direction  (0 to 360)
    %x1 = x + st*cos(d), y1 = y+st*sin(d)
    for j = 1:cntAgents
        
       if j <= cntAgents/2
           CA(j, 1) = round(PA(j, 1) + randi(10, 1, 1));
           CA(j, 2) = round(PA(j, 2) + randi(2, 1, 1));
       else
           CA(j, 1) = round(PA(j, 1) - randi(10, 1, 1));
           CA(j, 2) = round(PA(j, 2) - randi(2, 1, 1));
       end
       
    end
    
    ALL(:,:,i) = CA;
    
    lapi = lapi + 1;
    CS = SuspiciousAgents(CA);
    for k = 1:length(CS)
        S(lapi,k) = CS(1, k);
    end        
end

%Fill DATA with Agents
for i = 1:lap    
    for j = 1:cntAgents
        
        DATA(((i - 1) * cntAgents + j), 1) = j;%agentNo
        DATA(((i - 1) * cntAgents + j), 2) = ALL(j,1,i);%x
        DATA(((i - 1) * cntAgents + j), 3) = ALL(j,2,i);%y
        DATA(((i - 1) * cntAgents + j), 4) = ALL(j,3,i);%s
        DATA(((i - 1) * cntAgents + j), 5) = ALL(j,4,i);%d
        DATA(((i - 1) * cntAgents + j), 6) = i;%lap
        
        if (ismember(j, S(i,:)) == 1)
            DATA(((i - 1) * cntAgents + j), 11) = 'I';%Suspicious agent
        else
            DATA(((i - 1) * cntAgents + j), 11) = 'N';%Ordinary agent
        end           
    end
end

%plot a graph for all the agents and mark the ordinary agents with blue 
%and suspicious agents in red over time t = 1 to 10
%BEGIN FIGURE 1
PlotALLAgents(ALL, S(1, :));
%END FIGURE 1

%plot a graph with all agents at t = 1, ordinary agents with blue and
%suspicious agents with red
%BEGIN FIGURE 2
PlotXYLocationsWithSuspeciousAgents(ALL, S(1, :), gridSize, side);
%END FIGURE 2

%Find probability p(x,y) of each grid
%prob_xy initializes all prob(x,y) of each grid to 0
%prob_xy [side/gridSize, side/gridSize]
%st_xy initializes all st for each grid to 0
%st_xy [side/gridSize, side/gridSize]
prob_xy = zeros((side/gridSize), (side/gridSize), lap);
st_xy = zeros((side/gridSize), (side/gridSize), lap);

avg_Prob_xy = zeros(lap);
avg_St_xy = zeros(lap);

for z = 1:lap    
    %Looping from Bottom Grid to Top Grid
    for i = 1:(side/gridSize)
        ymin = (i - 1) * gridSize;
        ymax = (i) * gridSize;

        %For each vertical grid, loop from left to right on x-axis
        for j = 1:(side/gridSize)
            xmin = (j - 1) * gridSize;
            xmax = (j) * gridSize;

            %initializing count of suspicious agents to 0
            cntGSAgents = 0;
            %initializing count of normal agents to 0
            cntGNAgents = 0;

            %Looping through all agents (150) to find agents who belong to the
            %current grid
            for k = 1:noOfAgents
                if (ALL(k, 1, z) >= xmin && ALL(k, 1, z) < xmax && ALL(k, 2, z) >= ymin && ALL(k, 2, z) < ymax)
                    %if the agent is Suspicious increment suspicious agent count,
                    %else increment normal agent count
                    if (ismember(k, S(z,:)) == 1)
                        cntGSAgents = (cntGSAgents + 1);
                    else
                        cntGNAgents = (cntGNAgents + 1);
                    end                                
                end                
            end

            %With the count of normal and suspicious agents of this grid,
            %calculate the prob of p(x,y) 
            if(cntGNAgents ~= 0 || cntGSAgents ~= 0)
                prob_xy(i, j, z) = cntGNAgents / (cntGNAgents + cntGSAgents);        
            end

            %Calculating suspiciousness(t) based on the Normal and Suspicious agents
            %count and grid size. Suspiciousness increases as the numner of agents
            %increase and decreases as the region of observation increases
            st_xy(i, j, z) = (cntGNAgents + cntGSAgents) / (gridSize * gridSize);


            %Fill prob data into DATA for exporting
            for k = 1:noOfAgents
                if (ALL(k, 1, z) >= xmin && ALL(k, 1, z) < xmax && ALL(k, 2, z) >= ymin && ALL(k, 2, z) < ymax)
                    DATA((((z - 1) * cntAgents) + k), 7) = prob_xy(i, j, z);
                    DATA((((z - 1) * cntAgents) + k), 8) = st_xy(i, j, z);
                end
            end        
        end
    end
    
    %Calculating average p(x,y) for all grids avg_p_xy = sum of all p_xy's /
    %total no of cells
    avg_Prob_xy(z) = sum(sum(prob_xy(:,:,z))) / (prod(size(prob_xy(:,:,z))));
    %Calculating average st(x,y) for all grids avg_st_xy = sum of all st_xy's /
    %total no of cells
    avg_St_xy(z) = sum(sum(st_xy(:,:,z))) / (prod(size(st_xy(:,:,z))));
    
end



hold off;

%Plotting s (speed) vs d (direction);
%BEGIN Figure 3
sdGridSize = 0.25;
PlotSpeedAlongWithSuspeciousSpeeds(ALL, S, sdGridSize);
%END Figure 3

%Find probability q(s,d) of each grid
%prob_sd initializes all q(s,d) of each grid to 0
%prob_sd [1/sdGridSize, 1/sdGridSize]
%st_qd initializes all st for each grid to 0
%st_qd [1/sdGridSize, 1/sdGridSize]

prob_sd = zeros((1/sdGridSize), (1/sdGridSize), lap);
st_qd = zeros((1/sdGridSize), (1/sdGridSize), lap);

avg_Prob_sd = zeros(lap);
avg_st_qd = zeros(lap);

for z = 1:lap
    %Looping from Bottom Grid to Top Grid
    for i = 1:(1/sdGridSize)
        ymin = (i - 1) * sdGridSize;
        ymax = (i) * sdGridSize;

        %For each vertical grid, loop from left to right on x-axis
        for j = 1:(1/sdGridSize)
            xmin = (j - 1) * sdGridSize;
            xmax = (j) * sdGridSize;

            cntGridNSH = 0;
            cntGridSSH = 0;

            for k = 1:noOfAgents
                %If the current agent's s is between the xmin and xmax of
                %current grid and current agent's d is between ymin and ymax of
                %the current grid then that agent belongs to this cell.
                if (ALL(k, 3, z)-3.5 >= xmin && ALL(k, 3, z)-3.5 < xmax && ALL(k, 4, z)/360 >= ymin && ALL(k, 4, z)/360 < ymax)
                    if (ismember(k, S(z,:)) == 1)
                        cntGridSSH = (cntGridSSH + 1);
                    else
                        cntGridNSH = (cntGridNSH + 1);
                    end                                
                end                
            end

            if(cntGridNSH ~= 0 || cntGridSSH ~= 0)
                prob_sd(i, j, z) = cntGridNSH / (cntGridNSH + cntGridSSH);        
            end
            %Suspiciousness(t) 
            st_qd(i, j, z) = (cntGridNSH + cntGridSSH) / (sdGridSize * sdGridSize);

            %Fill prob data into DATA for exporting
            for k = 1:noOfAgents
                if (ALL(k, 3, z)-3.5 >= xmin && ALL(k, 3, z)-3.5 < xmax && ALL(k, 4, z)/360 >= ymin && ALL(k, 4, z)/360 < ymax)
                    DATA((((z - 1) * cntAgents) + k), 9) = prob_sd(i, j, z);
                    DATA((((z - 1) * cntAgents) + k), 10) = st_qd(i, j, z);
                end
            end 
        end
    end  
    
    %Calculating average q(s,d) for all grids avg_q_sd = sum of all q_sd's /
    %total no of cells
    avg_Prob_sd(z) = sum(sum(prob_sd(:,:,z))) / (prod(size(prob_sd(:,:,z))));
    %Calculating average st(q,d) for all grids avg_st_qd = sum of all st_qd's /
    %total no of cells
    avg_st_qd(z) = sum(sum(st_qd(:,:,z))) / (prod(size(st_qd(:,:,z))));
    
end


avg_total_st = zeros(lap);
k1 = zeros(lap);

for i = 1:lap
    %Total Average st based on average st(x,y) and average st(q,d)
    avg_total_st(i) = (avg_St_xy(i) + avg_st_qd(i)) / 2;

    %k1 = s(t)p(x,y)q(s,d)/ (s(t) - 1);
    k1(i) = (avg_total_st(i) * avg_Prob_xy(i) * avg_Prob_sd(i)) / (avg_total_st(i) - 1);    
end

%Plot k1 over lap
figure;
plot(k1);

%Write the DATA to excel
xlswrite('D:\AgentsData.xls',DATA);

end