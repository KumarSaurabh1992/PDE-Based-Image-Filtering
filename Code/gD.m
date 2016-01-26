function g = gD(A,lambda)

[m,n] = size(A);
g = zeros(m,n);
for i = 1:m
    for j = 1:n
        if (((i == 1) && (j == 1)) || ((i == 1) && (j == n)) || ((i == m) && (j == 1)) || ((i == m) && (j == n)))
            g(i,j) = 0;
            
        elseif ((i == 1) || (i == m))
            g(i,j) = 1/(1 + (((A(i,j + 1) - A(i,j - 1))/2)^2/lambda^2));
        elseif ((j == 1) || (j == n))
            g(i,j) = 1/(1 + (((A(i + 1,j) - A(i - 1,j))/2)^2/lambda^2));
        else
            g(i,j) = 1/(1 + ((((A(i + 1,j) - A(i - 1,j))/2)^2 + ((A(i,j + 1) - A(i,j - 1))/2)^2)/lambda^2));
        end
    end
end
        
