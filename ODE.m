clc;
clear all;
close all;

f = @(x,y) x^2 - 0.2*y %y - x^2 + 2;
y0 = -1;
h = 0.25;
a = -2%0;
b = 3%2;
n = (b-a)/h;

% newton -------------------
xn = [a:h:b];
yn = [y0];
length(xn)
length(1:n)
for i=1:n
    yn(i+1) = yn(i) + h*f( xn(i),yn(i) );
end

plot(xn,yn,'r-')
hold on

% heunnova
xh = [a:h:b];
yh = [y0];
for i=1:n
    k1 = h*f(xh(i),yh(i));
    k2 = h*f(xh(i) +h,yh(i) + k1);
    yh(i+1) = yh(i) + 1/2 * (k1 + k2);
end
plot(xh,yh,'b-')
% Runge Kutta
xr = [a:h:b];
yr = [y0];
for i=1:n
    k1 = h*f(xr(i),yr(i));
    k2 = h*f(xr(i) +1/2*h,yr(i) + 1/2*k1);
    k3 = h*f(xr(i) +1/2*h,yr(i) + 1/2*k2);
    k4 = h*f(xr(i) +h,yr(i) + k3);
    yr(i+1) = yr(i) + 1/6 * (k1 + 2*k2 + 2*k3 + k4);
end
plot(xr,yr,'g-')
