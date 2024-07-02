A = randi(100,5,5)
b = randi(100,5,1)
%A = [2 1 1; 4 3 3; 8 7 9]
x = luDecomp(A,b)

function x = luDecomp(A,b)
if size(A,1) == size(A,2)
    U = A;
    L = eye(size(A,1));
    for i = 1:size(A,1)-1 %loops through columns
        for j = i+1:size(A,1) %loops through rows
            L(j,i) = U(j,i)/U(i,i)
            U(j,i:size(A,1)) = U(j,i:size(A,1)) - L(j,i)*U(i,i:size(A,1)) %does 1 row at a time
        end
    end
    y = zeros(size(A,1),1)
    %backward substitution Ly = b
    for i = 1:size(A,1) 
        for j = 1:i-1
            y(i) = y(i) - L(i,j)*y(j)
        end
        y(i) = y(i) + b(i)
    end
    %backward substitution Ux = y
    x = zeros(size(A,1),1)
    for i = size(A,1):-1:1
        for j = size(A,1):-1:i+1
            x(i) = x(i) - U(i,j)*x(j)
        end
        x(i) = (y(i) + x(i))/U(i,i)
    end
    rref([A b])
else
    x = NaN;
end
end
