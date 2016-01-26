function [k] = differ_x(A)
[m,n] = size(A);
k = zeros(m,n);

for i = 2:m - 1
    for j = 2:n - 1
        k(i,j) = (A(i,j + 1) - A(i,j - 1))/2;
    end
end
end