close all
syms x
x = -2:0.1:2;
f = @(x) x.^4 + x.^3 - 2*x.^2 - x - 1;
g = @(x) 4*x.^3 + 3*x.^2 - 4*x - 1;
h = @(x) 12*x.^2 + 6*x - 4
hold on
plot(x,g(x),'red','Marker','x')
plot(x,h(x),'green','Marker','x')
plot(x,fd(x,0.1))
plot(x,fb(x,0.1))
plot(x,cd(x,0.1))
plot(x,cd2(x,0.1))
legend('Exact 1st Order','Exact 2nd Order','FD','FB','CD','CD 2nd Order');


function output = fd(x,h)
f = @(x) x.^4 + x.^3 - 2*x.^2 - x - 1;
output = zeros(1,length(x));
for i = 1:length(x) - 1
    output(i) = (f(x(i+1)) - f(x(i)))/h;
end 
output(end) = (f(x(end)) - f(x(end-1)))/h;
end

function output = fb(x,h)
f = @(x) x.^4 + x.^3 - 2*x.^2 - x - 1;
output = zeros(1,length(x));
output(1) = (f(x(2)) - f(x(1)))/h;
for i = 2:length(x)
    output(i) = (f(x(i)) - f(x(i-1)))/h;
end 
end

function output = cd(x,h)
f = @(x) x.^4 + x.^3 - 2*x.^2 - x - 1;
output = zeros(1,length(x));
output(1) = (f(x(2)) - f(x(1)))/h;
for i = 2:length(x) - 1
    output(i) = (f(x(i+1)) - f(x(i-1)))/(2*h);
end 
output(end) = (f(x(end)) - f(x(end-1)))/h;
end

function output = cd2(x,h)
f = @(x) x.^4 + x.^3 - 2*x.^2 - x - 1;
output = zeros(1,length(x));
output(1) = ( 2*f(x(1)) - 5*f(x(2)) + 4*f(x(3)) - f(x(4)) ) / (h^2);
for i = 2:length(x) - 1
    output(i) = (f(x(i+1)) + f(x(i-1)) - 2*f(x(i)))/(h^2);
end 
output(end) = ( 2*f(x(end)) - 5*f(x(end-1)) + ...
    4*f(x(end-2)) - f(x(end-3)) ) / (h^2);
end