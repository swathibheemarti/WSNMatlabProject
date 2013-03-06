function d=GetDirections(N)
%This function generates 100 random direction values between 0 and 360
%(Assuming 0 to 360 are the possible directions agents can move). each
%time we calculate mean and standard deviation of the 100 random direction
%values generated. We then use the calculated mean and std dev to generate
%100 normally distributed random values following the supplied mean and std
%deviation.

dLo=0;
dHi=10;
mu=0.0;
std=0.00;

R = dLo + (dHi - dLo).*rand(N,1);
mu = mu + mean(R);
std = std + std2(R);

d=truncnormrnd(N,mu,std,dLo,dHi);