clear all
close all
clc
% Polynomy jsou jednoduché ale oscilují mimo definované body a výrazně na
% u vedle okrajovách bodů
% polynomy max n řádu


% základní polynom
    % musíme řešit soustavu rovnic
    % Při řešení má matice nenulová Vandermodův determinant (at je to cokoliv)
    % a pak při větším počtu bodů je MATICE špatně podmíněna
    % U polynomů je polynom řádu n,ale jeho nejvyší člen je x^(x_počet_bodů - 1)
    % Existuje právě jeden polynom řádu n pro dané body

% lagrangeův polynom
    % nemusíme řešit soustavu rovnic
    % algebraickou úpravou dostaneme stejný polynom jako pomocí základního
    
% newtonův polynom
    % kombinace předešlých, kdy řešíme soustavu rovnic ale má
    % trojúhelníkovou strukturu (difference, a proto matice trojúhelníková)
    % zápis výsledného polynomu je analogie taylorova polynomu


xi =[ -2.3; -1.3; 0.6; 1.5; 2.8; 3.3; 4.6; 5.9; 7.8; 9.3];
yi =[ -51; -15; 8; 31; -47; -11; -101; -110; -223; -307]

% pro odstranění komentářů (které jsou tvořeny % pokud už nevíte, stačí označit oblasti a stisknout CTRL+t pro zakometářování CTRL+r)

% základní polynom -----------------------------------------------------
% pn(x) = a0 + a1*x + a2*x^2 + an*x^n
% xi a yi mu

% M = [ones(10,1), xi, xi.^2, xi.^3, xi.^4, xi.^5, xi.^6, xi.^7, xi.^8, xi.^9]
% b = yi
% 
% a = M\b
% 
% pn =@(x) a(1) + a(2)*x + a(3)*x^2 +a(4)*x^3 + a(5)*x^4 + a(6)*x^5+ a(7)*x^6+ a(8)*x^7+ a(9)*x^8 + a(10)*x^9
% 
% plot(xi,yi,'r.')
% hold on
% fplot(pn,[-3,10],'color','blue')
% 

% % automatizace základního
% syms x
% x_length = length(xi)
% M = []
% 
% 
% for i = 0 : x_length-1
%     M(:,end+1) = xi.^i
% end
% 
% b = yi
% a = M\b
% 
% pn =  0
% 
% for i = 1 : x_length
%     pn = pn + a(i)*x^(i-1);
% end
% 
% plot(xi,yi,'r.')
% hold on
% fplot(pn,[-3,10],'color','blue')

% Lagrangeuv tvar --------------------------------------------------------
% % pn(x) = f0(x)*y0 + f1(x)*y1 ..... fn(x)*yn

% fi1 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(1)-xi(2))*(xi(1)-xi(3))*(xi(1)-xi(4))*(xi(1)-xi(5))*(xi(1)-xi(6))*(xi(1)-xi(7))*(xi(1)-xi(8))*(xi(1)-xi(9))*(xi(1)-xi(10)) )
% fi2 = @(x) ( (x-xi(1))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(2)-xi(1))*(xi(2)-xi(3))*(xi(2)-xi(4))*(xi(2)-xi(5))*(xi(2)-xi(6))*(xi(2)-xi(7))*(xi(2)-xi(8))*(xi(2)-xi(9))*(xi(2)-xi(10)) )
% fi3 = @(x) ( (x-xi(2))*(x-xi(1))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(3)-xi(2))*(xi(3)-xi(1))*(xi(3)-xi(4))*(xi(3)-xi(5))*(xi(3)-xi(6))*(xi(3)-xi(7))*(xi(3)-xi(8))*(xi(3)-xi(9))*(xi(3)-xi(10)) )
% fi4 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(1))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(4)-xi(2))*(xi(4)-xi(3))*(xi(4)-xi(1))*(xi(4)-xi(5))*(xi(4)-xi(6))*(xi(4)-xi(7))*(xi(4)-xi(8))*(xi(4)-xi(9))*(xi(4)-xi(10)) )
% fi5 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(1))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(5)-xi(2))*(xi(5)-xi(3))*(xi(5)-xi(4))*(xi(5)-xi(1))*(xi(5)-xi(6))*(xi(5)-xi(7))*(xi(5)-xi(8))*(xi(5)-xi(9))*(xi(5)-xi(10)) )
% fi6 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(1))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(6)-xi(2))*(xi(6)-xi(3))*(xi(6)-xi(4))*(xi(6)-xi(5))*(xi(6)-xi(1))*(xi(6)-xi(7))*(xi(6)-xi(8))*(xi(6)-xi(9))*(xi(6)-xi(10)) )
% fi7 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(1))*(x-xi(8))*(x-xi(9))*(x-xi(10)) ) / ( (xi(7)-xi(2))*(xi(7)-xi(3))*(xi(7)-xi(4))*(xi(7)-xi(5))*(xi(7)-xi(6))*(xi(7)-xi(1))*(xi(7)-xi(8))*(xi(7)-xi(9))*(xi(7)-xi(10)) )
% fi8 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(1))*(x-xi(9))*(x-xi(10)) ) / ( (xi(8)-xi(2))*(xi(8)-xi(3))*(xi(8)-xi(4))*(xi(8)-xi(5))*(xi(8)-xi(6))*(xi(8)-xi(7))*(xi(8)-xi(1))*(xi(8)-xi(9))*(xi(8)-xi(10)) )
% fi9 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(1))*(x-xi(10)) ) / ( (xi(9)-xi(2))*(xi(9)-xi(3))*(xi(9)-xi(4))*(xi(9)-xi(5))*(xi(9)-xi(6))*(xi(9)-xi(7))*(xi(9)-xi(8))*(xi(9)-xi(1))*(xi(9)-xi(10)) )
% fi10 = @(x) ( (x-xi(2))*(x-xi(3))*(x-xi(4))*(x-xi(5))*(x-xi(6))*(x-xi(7))*(x-xi(8))*(x-xi(9))*(x-xi(1)) ) / ( (xi(10)-xi(2))*(xi(10)-xi(3))*(xi(10)-xi(4))*(xi(10)-xi(5))*(xi(10)-xi(6))*(xi(10)-xi(7))*(xi(10)-xi(8))*(xi(10)-xi(9))*(xi(10)-xi(1)) )
% 
% 
% pn = @(x) fi1(x)*yi(1) + fi2(x)*yi(2) + fi3(x)*yi(3) + fi4(x)*yi(4) + fi5(x)*yi(5) + fi6(x)*yi(6) + fi7(x)*yi(7) + fi8(x)*yi(8) + fi9(x)*yi(9) + fi10(x)*yi(10)
% 
% plot(xi,yi,'r.')
% hold on
% fplot(pn,[-3,10],'color','blue')

% newton ----------------------------------------------------------------
xn = [0;3;4;1]
yn = [2;1;5;3/2]

df0 = yn
n = length(xn)

df1 = []
df2 = []
df3 = []

% df1
for i=1 : n-1
    df1(i) = (df0(i+1)-df0(i))/(xn(i+1)-xn(i)) 
end

% df2
for i=1 : n-2
    df2(i) = (df1(i+1)-df1(i))/(xn(i+2)-xn(i)) 
end

% df3
for i=1 : n-3
    df3(i) = (df2(i+1)-df2(i))/(xn(i+3)-xn(i)) 
end

pn = @(x)df0(1) + df1(1)*(x-xn(1)) + df2(1)*(x-xn(1)).*(x-xn(2)) + df3(1)*(x-xn(1)).*(x-xn(2)).*(x-xn(3));



plot(xn,yn,'r.')
hold on
fplot(pn,[0,5],'color','blue')
