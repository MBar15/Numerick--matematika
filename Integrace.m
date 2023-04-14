clc;
clear all;
close all;
%f = @(x) log(x)/sqrt(9-x^2);
f = @(x) exp(x);
a = -1;
b = 1;
n = 4;
h = (b-a)/n;
step= (b-a)/n;
i=0:1:n-1

% Trojúhelník Trapezoidal
ST = 0;
for i=0:1:n-1
    ST = ST + h*( f(a+i*h)+f(a+h+i*h) )/2;
end


% Obdelnik Midpoint
SO = 0;
for i=0:1:n-1
    SO = SO + h*f(a+h/2 +i*h);
end

ST
SO

