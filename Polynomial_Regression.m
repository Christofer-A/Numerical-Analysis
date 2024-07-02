x = transpose(1:0.5:50.5);
y = randi(100,100,1);
a = myPolynRegression(x,y,3)

function a = myPolynRegression(x,y,m)
clf
n = size(x,1);
A(1:n,1) = ones(n,1);
for i = 1:m
    A(1:n,i+1) = x(1:n,1).^i;
end
a = inv(transpose(A)*A)*transpose(A)*y;
hold on;
plot(x,y)
plot(x,polyval(flip(a),x),'LineWidth',2,'LineStyle','--');
end