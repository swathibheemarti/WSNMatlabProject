function l=GetAgentLocations(N, side)
%This function generates N random (x,y) coordinates where x and y range
%from 0 to side

l = zeros(N,2);%array with 2 columns

for i = 1:round(N/2)
    l(i, 1) = randi(round(side/2));
    l(i, 2) = randi(round(side/2));
end

for i = round(N/2)+1:N
    l(i, 1) = round(side/2) + randi(round(side/2));
    l(i, 2) = round(side/2) + randi(round(side/2));
end
