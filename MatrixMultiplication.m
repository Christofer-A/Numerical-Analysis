A = rand(3,5)
B = rand(5,4)
A*B
myMatMulti(A,B)
% # flops: 2*size(B,2)*size(A,1)*size(B,1)

function C = myMatMulti(A,B)
C = zeros(size(A,1),size(B,2));
if size(A,2) == size(B,1)
    for i = 1:size(B,2)
        for j = 1:size(A,1)
            for k = 1:size(B,1)
                C(j,i) = C(j,i) + A(j,k)*B(k,i);
            end
        end
    end
end
end
