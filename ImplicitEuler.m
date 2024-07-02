x = implicitEuler(0,0.1,[0 2])

function x = implicitEuler(y0,h,tspan)
clf;
size(tspan(1):h:tspan(2))
x = zeros(size(tspan(1):h:tspan(2)));
x(1) = y0;
for i = 2:(size(x,2))
    x(i) = (99999*h*exp(-i*h + tspan(1)) + x(i-1))/(1 + 100000*h);
end
plot(tspan(1):h:tspan(2),x)
end
