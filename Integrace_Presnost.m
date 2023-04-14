clc;
clear all;
close all;

f = @(x) log(x)/sqrt(9-x^2);

a = 1;
b = exp(1);

n = 4;
h = (b-a)/n;
step= (b-a)/n;
eps = 1e-8;

% Trojuhelnik
prevT = 0;
diffT = 1;
while diffT > eps
    h = (b-a)/n;
    ST = 0;
    for i=0:n-1
        ST = ST + h*(f(a+i*h) + f(a+h+i*h))/2;
    end

    diffT = abs(ST-prevT);
    prevT = ST;
    n = n*2;
end
ST 

% Obdelnik
prevO = 0;
diffO = 1;
while diffO > eps
    h = (b-a)/n;
    SO = 0;
    for i=0:n-1
        SO = SO + h*(f(a+i*h) + f(a+h+i*h))/2;
    end

    diffO = abs(SO-prevO);
    prevO = SO;
    n = n*2;
end
SO
