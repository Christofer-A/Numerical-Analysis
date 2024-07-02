x = [6 7 11 15 17 21 23 29 29 37 39];
y = [29 21 29 14 21 15 7 7 13 0 3];
%x = [1 2 3 4];
%y = [1 3 2 6];
[error, cc] = leastSquares(x,y)
%hold on
%mdl = fitlm(x,y)

function [error, correlationCoefficient] = leastSquares(x,y)
clf
n = size(x,2);
sumx = sum(x);
sumy = sum(y);
sumxy = sum(x.*y);
sumx2 = sum(x.*x);
xbar = sumx/n;
ybar = sumy/n;
a1 = (n*sumxy - sumx*sumy)/(n*sumx2 - sumx^2);
a0 = ybar - a1*xbar;
f = @(x) a0 + a1*x;
hold on;
plot(x, y);
plot(x, f(x));
Sr = sum((y - a0 - x.*a1).^2);
St = sum((y - ybar).^2);
error = sqrt(Sr/(n-2));
correlationCoefficient = (St - Sr)/St;    
end