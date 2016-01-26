function [k] = differ_y(A)
[m,n] = size(A);
k = zeros(m,n);

for i = 2:m - 1
    for j = 2:n - 1
        k(i,j) = (A(i + 1,j) - A(i,j))/2;
    end
end
end