A = zeros(512,512);
for i = 1:512
    for j = 1:512
        if j < (512/2)
            A(i,j) = 1;
        end
    end
end
k = diff(A);
        
imshow(A);