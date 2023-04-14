clc;
clear all;
close all;


% Puleni intervalu (Binary) -----------------------------

% f = @(x) 2*x + 2 - exp(x);
% 
% % separace kořenu
% fplot(f,[-5,5],'color','blue')
% % <-2,0> a <1,3>
% 
% x_prev = 0 % random prirazeni hodnoty
% a = -2;
% b = 0;
% eps = 1e-2; % mezi x ale pry by to melo byt mezi x
% diff = eps+1
% while diff > eps
%     x = (b+a)/2;
% 
%     if f(x)*f(a) > 0
%         a = x;
%     else
%         b = x;
%     end
% 
%     diff = abs(f(x)-f(x_prev)); % pokud je eps mezi x je to abs(x-x_prev)
%     x_prev = x;
% end
% x1=x
% 
% % koren 2
% x_prev = 0 % random prirazeni hodnoty
% a = 1;
% b = 3;
% eps = 1e-2; 
% diff = eps+1;
% while diff > eps
%     x = (b+a)/2;
% 
%     if f(x)*f(a) > 0
%         a = x;
%     else
%         b = x;
%     end
% 
%     diff = abs(f(x)-f(x_prev)); 
%     x_prev = x;
% end
% x2 =x


% Newtonova metoda ------------------------------------------------------
f = @(x) x - 4*cos(x)^2
df1 = @(x) 1+8*cos(x)*sin(x)
df2 = @(x) -8*sin(x)*sin(x) + 8*cos(x)*cos(x)

% koreny <1,2> <2,3> <3,4>
a = 3.3;
b = 3.8;
% % overeni predpokladu
% % 1. a 2. good
% fplot(f,[a,b],'color','green')
% hold on 
% fplot(df1,[a,b],'color','red')
% fplot(df2,[a,b],'color','blue')
% hold off
% 
% % 3.  Good
% third = f(a) *  f(b) < 0; % 1
% % 4.  Good
% fourth1 = abs(f(a)/df1(a)) < b-a; % 1
% fourth2 = abs(f(b)/df1(b)) < b-a; % 1
% fprintf('%i %i %i \n',third,fourth1,fourth2)

k = 1;
prev = a;
x = 0;
eps = 1e-8;
diff = 1;
while diff > eps
    x = prev - f(prev)/df1(prev)
    diff = abs(x-prev);
    prev = x;
    k = k+1;
end

koren(1) = x


% -------------------------------------------
a = 2.4;
b = 2.7;
% overeni predpokladu
% 1. a 2. good
% fplot(f,[a,b],'color','green')
% hold on 
% fplot(df1,[a,b],'color','red')
% fplot(df2,[a,b],'color','blue')
% hold off
% 
% % 3.  Good
% third = f(a) *  f(b) < 0; % 1
% % 4.  Good
% fourth1 = abs(f(a)/df1(a)) < b-a; % 1
% fourth2 = abs(f(b)/df1(b)) < b-a; % 1
% fprintf('%i %i %i \n',third,fourth1,fourth2)

k = 1;
prev = a;
x = 0;
eps = 1e-8;
diff = 1;
while diff > eps
    x = prev - f(prev)/df1(prev);
    diff = abs(x-prev);
    prev = x;
    k = k+1;
end

koren(2) = x;


% -------------------------------------------
a = 1;
b = 2;
% overeni predpokladu
% % 1. a 2. good
% fplot(f,[a,b],'color','green')
% hold on 
% fplot(df1,[a,b],'color','red')
% fplot(df2,[a,b],'color','blue')
% hold off
% 
% % 3.  Good
% third = f(a) *  f(b) < 0; % 1
% % 4.  Good
% fourth1 = abs(f(a)/df1(a)) < b-a; % 1
% fourth2 = abs(f(b)/df1(b)) < b-a; % 1
% fprintf('%i %i %i \n',third,fourth1,fourth2)

k = 1;
prev = a;
x = 0;
eps = 1e-8;
diff = 1;
while diff > eps
    x = prev - f(prev)/df1(prev);
    diff = abs(x-prev);
    prev = x;
    k = k+1;
end

koren(3) = x;

koren