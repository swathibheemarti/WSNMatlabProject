function y = SuspiciousAgents(A)
%This function takes the matrix of Agents of form [x, y, S, D] where in x
%is an agent's x coordinate, y is agents y coordinate, S is agents speed and D
%is an agent's direction, based on the least occuring speeds and directions, we
%try to find the agents who have both least occuring speed and direction.

LUS = LeastOccuringSpeeds(A);
LUD = LeastOccuringDirections(A);

j = 1;
for i = 1:length(A)
    if ismember(A(i, 3), LUS) == 1  && ismember(A(i, 4), LUD)
        y(j) = i;
        j = j + 1;
    end
end