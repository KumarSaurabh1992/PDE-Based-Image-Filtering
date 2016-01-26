im = imread('triangle.jpg');
A = im(:,:,1);
[m,n] = size(A);
L = zeros(m, n);
for i = 2:m-1
    for j = 2:n-1
        L(i,j) = (A(i,j) - A(i,j - 1));
    end
end
%L = diff(A);
imshow(uint8(L));