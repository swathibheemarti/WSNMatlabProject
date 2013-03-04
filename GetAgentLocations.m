function l=GetAgentLocations(N, side)
%This function generates N random (x,y) coordinates where x and y range
%from 0 to 300


lHi = side;

rng shuffle;
X = randi([0,lHi],[N,1]);
rng shuffle;
Y = randi([0,lHi],[N,1]);

l = zeros(N,2);%array with 2 columns

for i = 1:N
    l(i, 1) = X(i);
    l(i, 2) = Y(i);
end