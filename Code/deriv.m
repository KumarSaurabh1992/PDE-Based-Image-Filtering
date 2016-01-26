clear all;
clc;
close all;

%% Reading Image
im = imread('triangle.jpg');
A = im(:,:,1);

%% Original Image
figure(1);
subplot(3,2,1);
imshow(uint8(A));
hold on;
X = 1:365;
plot(X,127);
title('Noisy image');
hold off;
subplot(3,2,2);
plot(A(127,:));
xlabel('x');
ylabel('Intensity Value');
title('Intensity Value');
subplot(3,2,3);
k_x = differ_x(A);
imshow((abs(k_x)));
title('X Derivative image');
subplot(3,2,4);
plot(abs(k_x(127,:)));
xlabel('x');
ylabel('I_x');
title('X Derivative');
subplot(3,2,5);
k_y = differ_y(A);
imshow((abs(k_y)));
title('Y Derivative image');
subplot(3,2,6);
plot(abs(k_y(127,:)));
xlabel('x');
ylabel('I_y');
title('Y Derivative');
suptitle('Noiseless Image');

%% Adding noise
A = imnoise(A,'gaussia',0.001);
figure(2);
subplot(3,2,1);
imshow(uint8(A));
hold on;
X = 1:365;
plot(X,127);
title('Noisy image');
hold off;
subplot(3,2,2);
plot(A(127,:));
xlabel('x');
ylabel('Intensity Value');
title('Intensity Value');
subplot(3,2,3);
k_x = differ_x(A);
imshow(uint8(abs(k_x)),[]);
title('X Derivative image');
subplot(3,2,4);
plot(abs(k_x(127,:)));
xlabel('x');
ylabel('I_x');
title('X Derivative');
subplot(3,2,5);
k_y = differ_y(A);
imshow(uint8(abs(k_y)),[]);
title('Y Derivative image');
subplot(3,2,6);
plot(abs(k_y(127,:)));
xlabel('x');
ylabel('I_y');
title('Y Derivative');
suptitle('Noisy Image');

%% Gaussian Filter
[m,n] = size(A);
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

C = gaussian_linear(A,5,5);
figure(3);
subplot(3,2,1);
imshow(uint8(C));
hold on;
X = 1:365;
plot(X,127);
title('Noisy image');
hold off;
subplot(3,2,2);
plot(C(127,:));
xlabel('x');
ylabel('Intensity Value');
title('Intensity Value');
subplot(3,2,3);
k_x = differ_x(C);
imshow(uint8(abs(k_x)),[]);
title('X Derivative image');
subplot(3,2,4);
plot(abs(k_x(127,:)));
xlabel('x');
ylabel('I_x');
title('X Derivative');
subplot(3,2,5);
k_y = differ_y(C);
imshow(uint8(abs(k_y)),[]);
title('Y Derivative image');
subplot(3,2,6);
plot(abs(k_y(127,:)));
xlabel('x');
ylabel('I_y');
title('Y Derivative');
suptitle('Noisy Image passed through linear gaussian filter');


D = gaussian_adaptive(A,5);
figure(4);
subplot(3,2,1);
imshow(uint8(D));
hold on;
X = 1:365;
plot(X,127);
title('Noisy image');
hold off;
subplot(3,2,2);
plot(D(127,:));
xlabel('x');
ylabel('Intensity Value');
title('Intensity Value');
subplot(3,2,3);
k_x = differ_x(D);
imshow(uint8(abs(k_x)),[]);
title('X Derivative image');
subplot(3,2,4);
plot(abs(k_x(127,:)));
xlabel('x');
ylabel('I_x');
title('X Derivative');
subplot(3,2,5);
k_y = differ_y(D);
imshow(uint8(abs(k_y)),[]);
title('Y Derivative image');
subplot(3,2,6);
plot(abs(k_y(127,:)));
xlabel('x');
ylabel('I_y');
title('Y Derivative');
suptitle('Noisy Image passed through adaptive gaussian filter');

% %% Median filter
% A = B;
% A = medfilt2(A);
% figure(4);
% subplot(2,2,1);
% imshow(uint8(A));
% hold on;
% X = 1:365;
% plot(X,127);
% title('Image after Median filter');
% hold off;
% subplot(2,2,2);
% plot(A(127,:));
% xlabel('x');
% ylabel('Intensity Value');
% title('Intensity Value');
% subplot(2,2,3);
% k = differ_x(A);
% imshow(abs(k));
% title('Derivative image');
% subplot(2,2,4);
% plot(abs(k(127,:)));
% xlabel('x');
% ylabel('I_x');
% title('Derivative');
% suptitle('Noisy Image passed through median filter');