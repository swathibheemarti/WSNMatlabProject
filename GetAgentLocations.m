function l=GetAgentLocations(N, side)
%This function generates N random (x,y) coordinates where x and y range
%from 0 to side

l = zeros(N,2);%array with 2 columns

for i = 1:N
    l(i, 1) = randi(side);
    l(i, 2) = randi(side);
end
