clf
%f = @(x) 1./(1 + 25*x.^2);
%yq = lagrangePolynomial(-1:0.5:1,f(-1:0.5:1),-1:0.01:1);
%yq1 = newtonInterpolatingPolynomials(-1:0.5:1,f(-1:0.5:1),-1:0.5:1)
%hold on
%plot(-1:0.01:1,spline(-1:0.5:1,f(-1:0.5:1),-1:0.01:1),'red',-1:0.01:1,f(-1:0.01:1),'blue')

%yq = lagrangePolynomial(0:8:40,[14.621 11.843 9.870 8.418 7.305 6.413],0:0.1:40)
yq1 = newtonInterpolatingPolynomials(0:8:40,[14.621 11.843 9.870 8.418 7.305 6.413],27)
spline(0:8:40,[14.621 11.843 9.870 8.418 7.305 6.413],27)

function yq = lagrangePolynomial(x,y,xq)
clf;
hold on;
plot(x,y,".");
m = size(x,2);
yq = zeros(1,size(xq,2));
for k = 1:size(xq,2)
g = zeros(1,m);
L = ones(1,m);
for i = 1:m
    for j = 1:m
        if j ~= i
            L(i) = L(i)*(xq(k) - x(j))/(x(i) - x(j));
        end
    end
    g(i) = L(i)*y(i);
end
yq(k) = sum(g,2);
end
plot(xq,yq);
end

function yq = newtonInterpolatingPolynomials(x,y,xq)
n = length(x) - 1;
D = ones(n,n);
for i = 1:n
    D(i,1) = (y(i+1) - y(i))/(x(i+1) - x(i));
end
for i = 2:n
    for j = 1:(n-i+1)
        D(j,i) = (D(j+1,i-1) - D(j,i-1))/(x(j+i) - x(j));
    end
end
b(1) = y(1);
for k = 2 : (n+1)
    b(k) = D(1,k-1); % the first row corresponds to the point x(1)
end
yq = b(n+1);
disp(b)
for k = 1:n
    yq = b(n+1-k)+yq.*(xq-x(n+1-k)); % nested multiplication
end
disp(yq)
end

