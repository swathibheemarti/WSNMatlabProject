function d=GetDirections(N)
%This function generates 100 random direction values between 0 and 360
%(Assuming 0 to 360 are the possible directions agents can move). each
%time we calculate mean and standard deviation of the 100 random direction
%values generated. We then use the calculated mean and std dev to generate
%100 normally distributed random values following the supplied mean and std
%deviation.

dLo=0;
dHi=360;
mu=0.0;
std=0.00;

for i = 1:100
    R = dLo + (dHi - dLo).*rand(N,1);
    mu = mu + mean(R);
    std = std + std2(R);
end

mu = mu/100;
std = std/100;

%fprintf('\n Mean = %s',mu);
%fprintf('\n Std Dev = %s',std);
%fprintf('\n');

d=truncnormrnd(N,mu,std,dLo,dHi);