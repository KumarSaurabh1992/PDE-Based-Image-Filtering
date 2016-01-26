function lambda = MAD(A)

% %% Reading image
% A = imread('triangle.jpg');
% [m,n,p]=size(A);
% A=imnoise(A,'gaussia',0.01); % adding Gaussian noise of mean zero and variance 0.01
%% Boundary Condition
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


C = A;
k_x = differ_x(C);
k_y = differ_y(C);
M = sqrt((k_x.*k_x) + (k_y.*k_y));
L = median(median(M));
%disp(L);
lambda = 1.4826*median(median(abs((M - L))));
end

