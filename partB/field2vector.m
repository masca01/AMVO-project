function b = field2vector(d)
N = size(d, 1);
k = 1;
for i = N:-1:1
    for j = 1:N
        b(1, k) = d(i, j);
        k = k+1;
    end
end

b = transpose(b);



