function lambda = paramet2(A)
A = A(:,:,1);
[m,n] = size(A);
B=zeros(m+2,n+2);
for i = 2:m + 1
    for j = 2:n + 1
        B(i,j) = A(i - 1,j - 1);
    end
end

B(m+2,:) = B(m,:);
B(1,:) = B(3,:);
B(:,n+2) = B(:,n);
B(:,1) = B(:,3);


C = gaussian_linear(B,0.5,2);
k_x = differ_x(C);
k_y = differ_y(C);
I = sqrt(k_y.*k_y + k_x.*k_x);
lambda = 1.8*mean(mean(I));
end