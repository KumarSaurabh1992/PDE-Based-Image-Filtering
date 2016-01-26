clear all;
clc;
close all;

im = imread('triangle.jpg');
A = im(:,:,1);
A = imnoise(A,'gaussian',0.01);
[m,n] = size(A);
B = zeros(m,n);
dt = 0.1;
t = 0;

final_time = 8;
figure(1);
while t <= final_time
    for i = 1:m
        for j = 1:n
            if ((i == 1) && (j == 1))
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i + 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j + 1)));
            elseif ((i == m) && (j == n))
                B(i,j) = A(i,j) + dt*((A(i - 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j-1) - 2*A(i,j) + A(i,j - 1)));
            elseif ((i == m) && (j == 1))
                B(i,j) = A(i,j) + dt*((A(i - 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j + 1)));
            elseif((i == 1) && (j == n))
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i + 1,j)) ...
                    + (A(i,j - 1) - 2*A(i,j) + A(i,j - 1)));
            elseif (i == 1)
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i + 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j - 1)));
            elseif (i == m)
                B(i,j) = A(i,j) + dt*((A(i - 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j - 1)));
            elseif (j == n)
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j-1) - 2*A(i,j) + A(i,j - 1)));
            elseif (j == 1)
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j + 1)));
            else
                B(i,j) = A(i,j) + dt*((A(i + 1,j) - 2*A(i,j) + A(i - 1,j)) ...
                    + (A(i,j+1) - 2*A(i,j) + A(i,j - 1)));
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
imshow(uint8(A));






