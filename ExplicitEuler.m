output = eulersMethod(3)


function output = eulersMethod(y)
i = 0;
while y >= 0
    y = y - 0.03*sqrt(y);
    i = i+1;
end
output = 0.5*i;
end