im = imread('triangle.jpg');
A = im(:,:,1);

A = imnoise(A,'gaussia',0.01);

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


C = B;%gaussian_linear(B,0.5,2);
k_x = differ_x(C);
k_y = differ_y(C);
I = sqrt(k_y.*k_y + k_x.*k_x);
k1 = 1.8*mean(mean(I));

for i = 1:size(I,1)
    for j = 1:size(I,1)
        if I(i,j) < 0.66*k1
            I(i,j) = 0;
        end
    end
end
