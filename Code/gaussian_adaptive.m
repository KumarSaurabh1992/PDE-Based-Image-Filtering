
function A = gaussian_adaptive(A,R)
[m,n] = size(A);
%B = zeros(size(A));
B=zeros(m+2,n+2);
for i = 2:m + 1
    for j = 2:n + 1
        B(i,j) = A(i - 1,j - 1);
    end
end

B(m+2,:) = B(m,:);
B(1,:) = B(3,:);
B(:,n+2) = B(:,n);
B(:,1) = B(:,3);
sd = paramet(B);
C = zeros(size(B,1),size(B,2));
for i = 1:size(B,1)
    for j = 1:size(B,2)
        zsum = 0;
        for m = -R:R
            if i+m >= 1 && i+m <= size(B,1) 
                for n = -R:R
                    if j+n >= 1 && j+n <= size(B,2) 
                        z = (1/(2*pi*sd(i,j)^2))*exp(-(m^2 + n^2)/(2*sd(i,j)^2));%
                        zsum = zsum + z;
                        C(i,j) = C(i,j) + z*B(i+m,j+n);
                    end
                end
            end
        end
        C(i,j) = C(i,j)/zsum;
    end
    A = C(2:size(C,1) - 1,2:size(C,2) - 1);
end
