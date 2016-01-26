
clear all;
close all;
clc;
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

subplot(2,2,1);
imshow(uint8(A));
title('Noisy image');
subplot(2,2,2);
plot(A(127,:));

%sd = paramet(B);
C = gaussian_adaptive(A,3);
subplot(2,2,3);
imshow(uint8(C));
title('Adaptive Gaussian Filter');
subplot(2,2,4);
plot(C(127,:));
suptitle('Adaptive Gaussian Filter');

figure(2);
imshow(uint8(C));