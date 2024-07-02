%1. g1 = sqrt(4x - 3)
%g2 = x^2/4 + 3/4

%2. using fixed point iteration for g2 does not converge

[xr, n] = fixedPointIteration(4)
[xr, n] = fixedPointIteration1(4)

function [xr, n] = fixedPointIteration(x1)
n = 0;
error = 1;
g1 = @(x) sqrt(4*x - 3);
    while error > 0.0001
        xr = g1(x1);
        error = abs((xr - x1)/xr);
        x1 = xr;
        n = n + 1;
    end
end

function [xr, n] = fixedPointIteration1(x1)
n = 0;
error = 1;
g2 = @(x) x^2/4 + 3/4;
    while error > 0.0001
        xr = g2(x1);
        error = abs((xr - x1)/xr);
        x1 = xr;
        n = n + 1;
        if xr > 1000
            xr = NaN;
            error = -1;
        end
    end
end