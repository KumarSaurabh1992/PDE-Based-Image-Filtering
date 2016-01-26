function [ B ] = median_filter( A )
m = size(A,1);
n = size(A,2);
k = zeros(9,1);
B = zeros(m,n);
for i = 1:m
    for j = 1:n
        if ((i == 1) || (j == 1) || (i == m) || (j == n))
            B(i,j) = A(i,j);
        else
            k(1) = A(i,j);
            k(2) = A(i + 1,j);
            k(3) = A(i - 1,j);
            k(4) = A(i,j + 1);
            k(5) = A(i,j - 1);
            k(6) = A(i + 1,j + 1);
            k(7) = A(i - 1,j - 1);
            k(8) = A(i + 1,j - 1);
            k(9) = A(i - 1,j + 1);
            k = sort(k);
            B(i,j) = k(5);
        end
    end
end
end

