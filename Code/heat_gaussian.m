im = imread('triangle.jpg');
A = im(:,:,1);
A = imnoise(A,'gaussian',0.01);
[m,n] = size(A);
B = zeros(m,n);
dt = 0.1;
t = 0;
sigma = 3;

final_time = 4.5;
figure;
              
while t <= final_time
    
            
    A = gaussian_linear(A,sigma,3);
    if (t == 0)
        subplot(2,3,1)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    elseif ((t - 0.1) < 10^(-6))
        subplot(2,3,2)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    elseif ((t - 0.3) < 10^(-6))
        subplot(2,3,3)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    elseif ((t - 1.0) < 10^(-6))
        subplot(2,3,4)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    elseif ((t - 2.0) < 10^(-6))
        subplot(2,3,5)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    elseif ((t - 4.5) < 10^(-6))
        subplot(2,3,6)
        imshow(uint8(A));
        title(['Time = ',num2str(t), 's']);
    end
    t = t + dt;
    
    
end

suptitle('Gausian Solution');

        
        
