function r = tensor_diffusion( L, a, b, c )

m = size( L, 1 );
n = size( L, 2 );


B = zeros(m + 2,n + 2);
a1 = zeros(m + 2,n + 2);
b1 = zeros(m + 2,n + 2);
c1 = zeros(m + 2,n + 2);

for i = 1:m
    for j = 1:n
        B(i+1,j+1) = L(i,j);
        a1(i+1,j+1) = a(i,j);
        b1(i+1,j+1) = b(i,j);
        c1(i+1,j+1) = c(i,j);
    end
end

B(1,:) = B(3,:);
B(m+2,:) = B(m,:);
B(:,1) = B(:,3);
B(:,n+2) = B(:,n);

a1(1,:) = a1(3,:);
a1(m+2,:) = a1(m,:);
a1(:,1) = a1(:,3);
a1(:,n+2) = a1(:,n);

b1(1,:) = b1(3,:);
b1(m+2,:) = b1(m,:);
b1(:,1) = b1(:,3);
b1(:,n+2) = b1(:,n);

c1(1,:) = c1(3,:);
c1(m+2,:) = c1(m,:);
c1(:,1) = c1(:,3);
c1(:,n+2) = c1(:,n);
r = zeros(m,n);
for i = 2:m + 1
    for j = 2:n + 1
        r(i - 1,j - 1) = (-(1/4)*((b1(i - 1,j) + b1(i,j+1))))*B(i-1,j+1) +...
            ((c1(i,j+1) + c1(i,j))/2)*B(i,j+1) +...
            ((b1(i + 1,j) + b1(i,j+1))/4)*B(i+1,j+1)+...
            (((a1(i - 1,j)) + a1(i,j))/2)*B(i-1,j) -...
            ((a1(i - 1,j) + 2*a1(i,j) + a1(i + 1,j) + c1(i - 1,j) + 2*c1(i,j) + c1(i + 1,j))/2)*B(i,j)+...
            ((a1(i + 1,j) + a1(i,j))/2)*B(i+1,j) +...
            ((b1(i - 1,j) + b1(i,j-1))/4)*B(i-1,j-1) + ((c1(i,j-1) + c1(i,j))/2)*B(i,j) -...
            ((b1(i+1,j) + b1(i,j - 1))/4)*B(i+1,j-1);
    end
end