function DATA = ConvertAgentsToTwoDimArray(ALL, S, lap, cntAgents)

%Data for exporting to excel
DATA = zeros(cntAgents * lap, 11);

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
            DATA(((i - 1) * cntAgents + j), 11) = 1;%Suspicious agent
        else
            DATA(((i - 1) * cntAgents + j), 11) = 0;%Ordinary agent
        end           
    end
end