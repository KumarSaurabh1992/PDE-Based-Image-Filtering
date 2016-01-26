clear all;
close all;
clc;

im = imread('triangle.jpg');
A = im(:,:,1);
[m,n] = size(A);

B = zeros(m,n);
lambda = 8;
A = imnoise(A,'gaussian',0.01);
dt = 0.1;
t = 0;
tfinal = 8;
C = A;
while (t < tfinal)
    g = gD(A,lambda);
    %A = gaussian_linear(A,1.001,3);
for i = 1:m
    for j = 1:n
       
       if (((i == 1) && (j == 1)) || ((i == 1) && (j == n)) || ((i == m) && (j == 1)) || ((i == m) && (j == n)))
           B(i,j) = A(i,j);
       elseif (i == 1)
           B(i,j) = A(i,j) + dt*((sqrt(g(i + 1,j)*g(i,j)))*(A(i + 1,j) - A(i,j)) ...
               +((sqrt(g(i,j + 1)*g(i,j)))*(A(i,j + 1) - A(i,j)) ...
               - (sqrt(g(i,j - 1)*g(i,j)))*(A(i,j) - A(i,j - 1))));
       elseif (i == m)
           B(i,j) = A(i,j) + dt*(-(sqrt(g(i,j)*g(i - 1,j))*(A(i,j) - A(i - 1,j))) +...
               ((sqrt(g(i,j + 1)*g(i,j)))*(A(i,j + 1) - A(i,j)) ...
               - sqrt(g(i,j - 1)*g(i,j))*(A(i,j) - A(i,j - 1))));
       elseif (j == 1)
         B(i,j) = A(i,j) + dt*(((sqrt(g(i + 1,j)*g(i,j)))*(A(i + 1,j) - A(i,j)) ...
               - sqrt(g(i,j)*g(i - 1,j))*(A(i,j) - A(i - 1,j)))+...
               ((sqrt(g(i,j + 1)*g(i,j)))*(A(i,j + 1) - A(i,j))));  
       elseif (j == n)
          B(i,j) = A(i,j) + dt*(((sqrt(g(i + 1,j)*g(i,j)))*(A(i + 1,j) - A(i,j)) ...
               - sqrt(g(i,j)*g(i - 1,j))*(A(i,j) - A(i - 1,j)))+...
               (- (sqrt(g(i,j - 1)*g(i,j))*(A(i,j) - A(i,j - 1)))));
       else
           B(i,j) = A(i,j) + dt*(((sqrt(g(i + 1,j)*g(i,j)))*(A(i + 1,j) - A(i,j)) ...
               - sqrt(g(i,j)*g(i - 1,j))*(A(i,j) - A(i - 1,j)))+...
               ((sqrt(g(i,j + 1)*g(i,j)))*(A(i,j + 1) - A(i,j)) ...
               - sqrt(g(i,j - 1)*g(i,j))*(A(i,j) - A(i,j - 1))));
       end
    end
end
 A = B;
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
    pause(0.001);
    
    t = t + dt;
    suptitle(['Time = ',num2str(t)]);

end
figure(2);
imshow(uint8(A),[]);

           
        