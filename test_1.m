clc
clear all
M = 5;
u = zeros(M, M);

for i = 1:M
    for j = 1:M
        u(i, j) = j + (i-1)*M;
    end
end

label = 'test';
format = '1';
u
[fprintf] = print_field(u)

[halo_print] = halo_update(fprintf)