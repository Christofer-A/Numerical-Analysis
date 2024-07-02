%y = finiteDifference(0,0,2)
y = shootingMethod(0,1,0,0,2);

function y = finiteDifference(y0,yend,dx)
E = 30000; I = 800; w = 1; L = 10;
disx = dx:dx:L-dx
x = zeros(length(0:dx:L)-2,length(0:dx:L)-2)
for i = 1:length(0:dx:L)-3
    x(i+1,i) = 1;
    x(i,i+1) = 1;
    x(i,i) = -2;
end
x(length(0:dx:L)-2,length(0:dx:L)-2) = -2;
b = zeros(length(0:dx:L)-2,1);
b(1) = (w*L*disx(1)*dx^2)/(2*E*I) - (w*disx(1)^2*dx^2)/(2*E*I) - y0
for i = 2:length(b)-1
    disx(i)
    b(i) = (w*L*disx(i)*dx^2)/(2*E*I) - (w*disx(i)^2*dx^2)/(2*E*I)
end
x
b(end) = (w*L*disx(end)*dx^2)/(2*E*I) - (w*disx(end)^2*dx^2)/(2*E*I) - yend
y = [0; inv(x)*b; 0]

xx = linspace(0,10);
exact = w/12/E/I*xx.*(L*xx.^2-xx.^3/2-L^3/2);
plot(0:dx:L,y,xx,exact)
legend('finite-diff', 'exact')
end

function atrue = shootingMethod(guess1,guess2,y0,yend,dx)
E = 30000; I = 800; w = 1; L = 10;
f = @(x,y) (w*L*x*dx^2)/(2*E*I) - (w*x^2*dx^2)/(2*E*I);
[x,y] = ode45(f,[0 L], guess1);
y1end = y(end);
[x,y] = ode45(f,[0 L], guess2);
y2end = y(end);
atrue = y0 + ((guess1 - guess2)/(y1end - y2end))*(yend - y1end)


% range of x
xspan = [0 ,10];
% initial values for y and v
y0=[0,- 1.7361e-006];
[x,solution] = ode45(@fnc,xspan,y0);
% comparing with exact solution
xx = linspace(0,10);
exact = omega/12/E/I*xx.*(L*xx.^2-xx.^3/2-L^3/2);
plot(x,solution(:,1),xx,exact)
legend('shooting method', 'exact')
title('Problem2, part b')
function dydx = fnc(x,y)
% compute right-hand side of the system
dydx = [y(2); omega*L*x/2/E/I - omega*x*x/2/E/I ];
end 

 
end