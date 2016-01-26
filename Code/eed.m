function A = eed( L, stepsize, nosteps)

lambda = 20;
A = L;
[m,n] = size(A);
figure(1);
for k = 1:nosteps
    A =gaussian_linear(A,0.8,3);
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
    c1 = gD(A,lambda);
    c2 = 1;
    a = (c1 .* Ax.^2 + c2 .* Ay.^2) ./ (Aw + eps);
    b = (c2-c1) .* Ax .* Ay ./ (Aw + eps);
    c = (c1 .* Aw.^2 + c2 .* Aw.^2) ./ (Aw + eps);
    
    
    A = A + stepsize* tensor_diffusion( A, a, b, c );
    
     
    
    subplot(2,2,1);
    imshow((A));
    hold on;
    X = 1:365;
    plot(X,127);
    title('Noisy image');
    hold off;
    drawnow;
    subplot(2,2,2);
    plot(A(127,:));
    xlabel('x');
    ylabel('Intensity Value');
    title('Intensity Value');
    drawnow;
    subplot(2,2,3);
    k_x = differ_x(A);
    plot(abs(k_x(127,:)));
    xlabel('x');
    ylabel('I_x');
    title('X Derivative');
    drawnow;
    k_y = differ_y(A);
    subplot(2,2,4);
    plot(abs(k_y(127,:)));
    xlabel('x');
    ylabel('I_y');
    title('Y Derivative');
    drawnow;
    
   
    
    
end

    
end