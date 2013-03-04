function s=GetSpeeds(N)
%This function generates 100 random values between 3.5 and 4.5 (Assuming
%average person walks between 3.5 feet/second to 4.5 feet/second. 
%each time we calculate mean and standard deviation of the 100 random
%values generated. We then use the calculated mean and standard deviation
%to generate 100 normally distributed random values following the supplied
%mean and standard deviation

sLo=3.5;
sHi=4.5;
mu=0.0;
sigma=0.00;

R=sLo + (sHi - sLo).*rand(N,1);
mu = mu + mean(R);
sigma = sigma + std2(R);

%mu = mu/100;
%sigma = sigma/100;

%fprintf('\n Mean = %s',mu);
%fprintf('\n Std Dev = %s',sigma);
%fprintf('\n');

s=truncnormrnd(N,mu,sigma,sLo,sHi);%generates normal random values 