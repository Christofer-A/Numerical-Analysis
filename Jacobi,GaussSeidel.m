A = [2 -1; -1 2]
b = [2; 1]
tol = 10^-3
iterMethod = 'GS'
x = iterationMethodsForAxEqualsb(A,b,tol,iterMethod)

function x = iterationMethodsForAxEqualsb(A,b,tol,iterMethod)
S = zeros(size(A,1),size(A,1))
T = A
x = zeros(size(A,1),1)
if strcmp(iterMethod,'Jacobi')
    for i = 1:size(A,1)
        S(i,i) = A(i,i)
        T(i,i) = 0
    end
    T = -T
elseif strcmp(iterMethod,'GS')
    S = tril(A)
    T = S - A
end
i = 1
while norm(A*x(:,i) - b) > tol
    x(:,i+1) = inv(S)*(T*x(:,i) + b)
    i = i + 1
end
end
