clear all;
clc;


im = imread( 'triangle.jpg' );
A = im(:,:,1);
imshow(A);
A = im2double(A);
A=imnoise(A,'gaussia',0.001);
nosteps = 10;
 lambda = 25;
        B = A; 
        [m,n] = size(A);
        for k = 1:nosteps 
            A =gaussian_linear(A,1.1,3);
            Ay =zeros(m,n);
            Ax = zeros(m,n);
            
            for i = 1:size(A,1)
                for j = 1:size(A,2)
                    if (((i == 1) && (j == 1)) || ((i == 1) && (j == n)) || ((i == m) && (j == 1)) || ((i == m) && (j == n)))
                        Ax(i,j) = 0;
                        Ay(i,j) = 0;
                    elseif ((i == 1) || (i == m))
                        Ay(i,j) =  (((A(i,j + 1) - A(i,j - 1))/2));
                    elseif ((j == 1) || (j == n))
                        Ax(i,j) = ((A(i + 1,j) - A(i - 1,j))/2);
                    else
                        Ax(i,j) = ((A(i + 1,j) - A(i - 1,j))/2);
                        Ay(i,j) =  (((A(i,j + 1) - A(i,j - 1))/2));
                    end
                end
            end
            Aw = Ax.^2 + Ay.^2;
c2 = gD(A,lambda);
c1 = 1;
a = (c1 .* Ax.^2 + c2 .* Ay.^2) ./ (Aw + eps); 
b = (c2-c1) .* Ax .* Ay ./ (Aw + eps); 
c = (c1 .* Aw.^2 + c2 .* Aw.^2) ./ (Aw + eps); 
A = A + 0.1 * tnldStep1( A, a, b, c ); 
        end

% b = eed1( ad, 8, 1, .12, 10, 1 );
% figure(6);
% imshow(b,[]);