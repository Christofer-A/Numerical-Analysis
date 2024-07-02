syms x
f = @(x) x.^2 .* exp(x);
g = @(p,a) p.*a;
%[output, error] = trapezoidalRule(0:0.75:3,f(0:0.75:3),4)
%[output, error] = simpsonsRule(0:0.75:3,f(0:0.75:3),4)
[output, error] = simpsonsRule(0:2:10,g([4 3.95 3.89 3.8 3.6 3.41 3.3],[100 103 106 110 120 133 150]),6)

function [output, error] = trapezoidalRule(x,y,n)
output = ((x(end) - x(1))*(y(1) + 2*sum(y(1,2:n)) + y(n+1)))/(2*n);
error = 100*(abs(98.4277 - output)/98.4277);
end

function [output error] = simpsonsRule(x,y,n)
temp1 = 0;
temp2 = 0;
for i = 2:2:n
    temp1 = temp1 + y(i);
end
for i = 3:2:n-1
    temp2 = temp2 + y(i);
end
output = (x(end) - x(1))*(y(1) + 4*temp1 + 2*temp2 + y(n+1))/(3*n);
error = 100*(abs(98.4277 - output)/98.4277);
end