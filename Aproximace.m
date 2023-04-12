
xi =[ -2.3, -1.3, 0.6, 1.5, 2.8, 3.3, 4.6, 5.9, 7.8, 9.3];
yi =[ -51, -15, 8, 31, -47, -11, -101, -110, -223, -307];

% linearni
MLin = [ length(xi), sum(xi); sum(xi), sum(xi.^2)]
fiLin = [sum(yi); sum(yi.*xi)]

c = MLin\fiLin

Lin =@(x) c(2)*x+c(1)

% kvadraticka

MQ = [sum(xi.^4), sum(xi.^3), sum(xi.^2); sum(xi.^3), sum(xi.^2), sum(xi); sum(xi.^2), sum(xi), length(xi)]
fiQ = [sum(yi.*(xi.^2)); sum(yi.*xi); sum(yi)]

cQ = MQ\fiQ

Qad =@(x) cQ(1)*x^2 + cQ(2)*x + cQ(3)

% c1*sin(x) +c2*x^2

M = [sum(sin(xi).^2), sum((xi.^2).*sin(xi)); sum((xi.^2).*sin(xi)), sum(xi.^4)]
fi = [sum(yi.*sin(xi)); sum(yi.*xi.^2)]

c = M\fi

f = @(x)c(1)*sin(x) + c(2)*x^2

plot(xi,yi,'ro')
hold on
fplot(Lin,[-3,10],'color','blue')
fplot(Qad,[-3,10],'color','green')
fplot(f,[-3,10],'color','black')