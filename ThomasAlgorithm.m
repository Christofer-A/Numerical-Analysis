A = [1 2 0; 3 1 2; 0 3 1]
r = [1; 1; 1]
x = thomasAlgorithm(A,r)

function x = thomasAlgorithm(A,r)
for i = 1:size(A,1)-1
    A(i+1,i) = A(i+1,i)/A(i,i)
    A(i+1,i+1) = A(i+1,i+1) - A(i+1,i)*A(i,i+1)
end
for i = 1:size(A,1)-1
    r(i+1) = r(i+1) - A(i+1,i)*r(i)
end
x = zeros(size(A,1),1)
x(size(A,1)) = r(size(A,1))/A(size(A,1),size(A,1))
for i = size(A)-1:-1:1
    x(i) = (r(i) - A(i,i+1)*x(i+1))/A(i,i)
end
end