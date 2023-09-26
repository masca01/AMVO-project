function [first_halo] = first_halo(u, N)
% generates a mesh that surounds a given mesh (u) with zeros

% vector definition
first_halo = zeros(N+2, N+2);

for i = 2:N+1
    for j = 2:N+1
        first_halo(i, j) = u(i-1, j-1);
    end
end
