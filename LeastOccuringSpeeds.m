function x = LeastOccuringSpeeds(A)
%This function searches for agents whose speeds are among the least
%occuring speeds on both sides of the mean

S = A(:, 3);
US = unique(S);

NUS = zeros(length(US), 2);

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

NUS1 = sortrows(NUS, 2);
LUS = NUS1(1, 2);

for i = 1:length(NUS1)
    if NUS1(i, 2) == LUS
        x(i) = NUS1(i, 1);
    end
end
