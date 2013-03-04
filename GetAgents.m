%This function creates an array with 4 columns X,Y,S,and D.
%It uses the functions L,D,and S for creating the rows
function w=GetAgents(N, side)

L=GetAgentLocations(N, side);
D=GetDirections(N);
S=GetSpeeds(N);

%truncate speed to get only one digit after the decimal place 
for i = 1:length(S)
    X = num2str(S(i), 2);
    S(i) = str2double(X);
end

%truncate direction to get only whole numbers
%for i = 1:length(D)
%    X = num2str(D(i),(strfind(num2str(D(i)),'.')-1));%
%    D(i) = str2double(X);
%end

D = int32(D);

w=zeros(N,4);%array of agents with 4 columns

for i = 1:N
    w(i,1) = L(i,1);
    w(i,2) = L(i,2);
    w(i,3) = S(i);    
    w(i,4) = D(i);
end