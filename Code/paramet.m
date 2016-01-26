function [ sd ] = paramet( A)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

m = size(A,1);
n = size(A,2);
k = zeros(9,1);
sd = zeros(m,n);
A = gaussian_linear(A,5,5);
l = mean2(A);
for i = 1:m
    for j = 1:n
        if ((i == 1) || (j == 1) || (i == m) || (j == n))
           sd(i,j) = eps;
        else
            k(1) = A(i,j)- A(i,j);
            k(2) = abs( A(i + 1,j) - A(i,j));
            k(3) = abs(A(i - 1,j) - A(i,j));
            k(4) = abs(A(i,j + 1)- A(i,j));
            k(5) = abs(A(i,j - 1) - A(i,j));
            k(6) = abs(A(i + 1,j + 1)- A(i,j));
            k(7) = abs(A(i - 1,j - 1) - A(i,j));
            k(8) = abs(A(i + 1,j - 1)- A(i,j));
            k(9) = abs(A(i - 1,j + 1)- A(i,j));
            h = max(k)/l;
            sd(i,j) = 1/(h + eps);
        end
    end
end

end

