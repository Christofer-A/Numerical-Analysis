[xr, n] = bisection(1,100)
[xr, n] = falsePosition(5,100)
%Generally false position has better accuracy 
%But, is more sensitive to what bounds are picked

function [xr, n] = bisection(x1,x2)
%x1 lower, x2 upper
    f = @(x) log(x) - 2;
    n = 0;
    error = 1;
    while error > 0.001
        xr = (x1 + x2)/2;
        error = abs((x2 - x1)/(x2 + x1));
        if f(x1)*f(xr) > 0
            x1 = xr;
        elseif f(x1)*f(xr) < 0
            x2 = xr;
        end
        n = n + 1;
    end
end

function [xr n] = falsePosition(x1,x2)
%x1 lower, x2 upper
   f = @(x) log(x) - 2;
    iterations = log2((x2 - x1)/0.001);
    n = 0;
    for i = 1:iterations
        xr = x2 - (f(x2)*(x1-x2))/(f(x1) - f(x2));
        if f(x1)*f(xr) > 0
            x1 = xr;
    elseif f(x1)*f(xr) < 0
        x2 = xr;
    end
    n = n + 1;
end
end