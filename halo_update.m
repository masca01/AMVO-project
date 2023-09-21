function [halo_print] = halo_update(u)
% for a given mesh (u), makes the halo update
    % row M-1 goes to row 1
    % row 2 goes to row M
    % column M-1 goes to column 1
    % column 2 goes to column M

% vector definition
M = size(u, 1);
halo_print = u;

for i = 1:M
    if i == 1
        for j = 1:M
            halo_print(i, j) = u(M-1, j);
        end
    elseif i == M
        for j = 1:M
            halo_print(i, j) = u(2, j);
        end
    end
end

for j = 1:M
    if j == 1
        for i = 1:M
            halo_print(i, j) = u(i, M-1);
        end
    elseif j == M
        for i = 1:M
            halo_print(i, j) = u(i, 2);
        end
    end
end

