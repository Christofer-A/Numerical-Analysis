A = randi(100,4,4)
B = randi(100,4,1)
[C,D] = forwardElimination(A,B)
x = backwardSubstitution(C,D)
x1 = GaussianElimination(A,B)

function x = GaussianElimination(A,B)
[A, B] = forwardElimination(A,B);
x = backwardSubstitution(A,B);
end


function [A,B] = forwardElimination(A,B)
for i = 1:size(A,2)-1
    for j = i+1:size(A,1)
        factor = A(j,i)/A(i,i);
        for k = i:size(A,2)
            A(j,k) = A(j,k) - factor*A(i,k);
        end
        B(j) = B(j) - factor*B(i);
    end
end
end

function x = backwardSubstitution(A, B)
x = zeros(size(A,2), 1);
for i = size(A,2):-1:1
    sum = 0;
    for j = i+1:size(A,2)
        sum = sum + A(i,j)*x(j);
    end
    x(i) = (B(i) - sum) / A(i,i);
end
end
