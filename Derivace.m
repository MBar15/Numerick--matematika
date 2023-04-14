clc;
clear all;
close all;

f = @(x) sin(x);
 
a = 0;
b = 6.14;
h = 0.25;
x = [a:h:b]

df =[];
for i=a:h:b
    i
    df(end+1) = (f(i+h)-f(i-h))/(2*h);
end

ddf = [];
for i=a:h:b
    ddf(end+1) = (f(i+h)-2*f(i) + f(i-h)) / ((h)*(h));
end

syms y
ff = sin(y)
dff = diff(ff,y);
ddff = diff(dff,y);

df
length(x);
length(df);

fplot(f,[a,b],'color','red')
hold on
% fplot(dff,[a,b],'color','blue')
% fplot(ddff,[a,b],'color','green')
plot(x,df,'b-')
plot(x,ddf,'g-')