function x = LeastOccuringDirections(A)
%This function searches for agents whose speeds are among the least
%occurring speeds on both sides of the mean. 

D = A(:, 4);%get the directions from A
UD = unique(D);%get the unique values for direction

NUD = zeros(length(UD), 2);%create an array with 2 columns(col1- unique direction value, col2-count of the direction)
%count how many times the unique values occur
for i = 1:length(UD)
    times = 0;
    NUD(i, 1) = UD(i);
    for j = 1:length(D)
        if UD(i) == D(j)
            times = times + 1;
        end 
    end
    NUD(i, 2) = times;
end

%array with sorted occurrences of direction
NUD1 = sortrows(NUD, 2);
%Top 3 Least occuring times is grabbed so we can get the directions that fall into
%this many times

if length(NUD1) > 2
    LUD = NUD1([1,2,3], 2);
end

if length(NUD1) > 1
    LUD = NUD1([1,2], 2);
end

if length(NUD1) > 1
    LUD = NUD1(1, 2);
end

for i = 1:length(NUD1)
    if ismember(NUD1(i, 2), LUD) == 1
        x(i) = NUD1(i, 1);
    end
end