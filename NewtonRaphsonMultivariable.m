
[n, xr] = NewtonRaphsonMult([5; 5])

function [n, xr] = NewtonRaphsonMult(xr)
f = @(x) [(x(1)^2 + 1)*(x(2) - 1); (x(1) - 2)*(x(2) + 2)];
J = @(x) [2*x(1)*x(2) - 2*x(1), x(1)^2 + 1; x(2) + 2, x(1) - 2];
n = 0;
while norm(f(xr)) > 10^-5
    xr = xr - inv(J(xr))*f(xr);
    n = n + 1;
end
end