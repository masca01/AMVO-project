function p_poisson_matrix = vector2Matrix(p, N)

k = 1;
for i = N:-1:1
    for j = 1:N
        p_poisson_matrix_aux(i, j) = p(k, 1);
        k = k + 1;
    end
end

p_poisson_matrix = halo_update(p_poisson_matrix_aux);
