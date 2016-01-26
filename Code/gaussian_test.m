clear all
close all

%% Reading image
A = imread('triangle.jpg');
[m,n,p]=size(A);
A=imnoise(A,'gaussia',0.01); % adding Gaussian noise of mean zero and variance 0.01

A = A(:,:,1);
% B=zeros(m+2,n+2);
% for i = 2:m + 1
%     for j = 2:n + 1
%         B(i,j) = A(i - 1,j - 1);
%     end
% end
% 
% B(m+2,:) = B(m,:);
% B(1,:) = B(3,:);
% B(:,n+2) = B(:,n);
% B(:,1) = B(:,3);

%% aussian filter

C1 = gaussian_linear(A,0.5,3);
C2 = gaussian_linear(A,50,3);
C3 = gaussian_linear(A,5000,3);

figure(1);
subplot(2,2,1);
imshow(uint8(A));
title('Original image');
subplot(2,2,2);
plot(A(127,:));
subplot(2,2,3);
imshow(uint8(C1));
title('sigma = 0.5');
subplot(2,2,4);
plot(C1(127,:));
suptitle('Gaussian linear filter');

figure(2);
subplot(2,2,1);
imshow(uint8(C2));
title('sigma = 50');
subplot(2,2,2);
plot(C2(127,:));
subplot(2,2,3);
imshow(uint8(C3));
title('sigma = 5000');
subplot(2,2,4);
plot(C3(127,:));

suptitle('Gaussian linear filter');