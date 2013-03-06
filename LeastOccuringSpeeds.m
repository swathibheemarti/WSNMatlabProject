function x = LeastOccuringSpeeds(A)
%This function searches for agents whose speeds are among the least
%occuring speeds on both sides of the mean

%Get the Spped of Agents into S array
S = A(:, 3);
%US is the unique speeds of the agents
US = unique(S);

%declaring a matrx of 0's of size len(US) and 2 columns
NUS = zeros(length(US), 2);

%By end of the outer and inner loop we will end up with a matrix with 2
%cols with unique speeds in Col1 and no of times it occurs in A in 2nd col
for i = 1:length(US)
    times = 0;
    NUS(i, 1) = US(i);
    for j = 1:length(S)
        if US(i) == S(j)
            times = times + 1;
        end 
    end
    NUS(i, 2) = times;
end

%Sorting the Speed array on times (col2)
NUS1 = sortrows(NUS, 2);
%Top 3 Least occuring times is grabbed so we can get the speeds that fall into
%this many times

if length(NUS1) > 2
    LUS = NUS1([1,2,3], 2);
elseif length(NUS1) > 1
    LUS = NUS1([1,2], 2);
else 
    LUS = NUS1(1, 2);
end

for i = 1:length(NUS1)
    if ismember(NUS1(i, 2), LUS) == 1
        x(i) = NUS1(i, 1);
    end
end
