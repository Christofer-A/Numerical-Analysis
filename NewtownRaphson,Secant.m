[xr, n] = newtonRhapson(1)
[xr, n] = newtonRhapson(-3)
[xr, n] = newtonRhapson(4)
% x1 = 4 does not converge

[xr, n] = secant(1.2,1)

function [xr, n] = newtonRhapson(x1)
format long;
f = @(x) exp(-x)*(x^3 - 2) + 1;
g = @(x) exp(-x)*(-x^3 + 3*x^2 + 2);
n = 0;
error = 1;
while error > 1 * 10^-6
    xr = x1 - f(x1)/g(x1);
    error = abs((xr - x1)/xr);
    x1 = xr;
    n = n + 1;
    if n > 25
        error = -1;
    elseif g(xr) == 0
        error = -1;
    end
end
end

function [xr, n] = secant(x1,x2)
format long;
f = @(x) exp(-x)*(x^3 - 2) + 1;
n = 0;
error = 1;
while error > 1 * 10^-10
    xr = x2 - (f(x2)*(x1 - x2))/(f(x1) - f(x2));
    error = abs((xr - x1)/xr);
    x1 = x2;
    x2 = xr;
    n = n + 1;
    if n > 25
        error = -1;
    elseif (f(x1) - f(x2)) == 0
        error = -1;
    end
end
end