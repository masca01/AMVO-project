function A = A_matrix(N)

A = zeros(N^2, N^2);
k = 1;
for i = N:-1:1
    for j = 1:N
        matrix_aux(i, j) = k;
        k = k+1;
    end
end

matrix_aux = first_halo(matrix_aux, N);
matrix_aux = halo_update(matrix_aux);

for i = 2:N+1
    for j = 2:N+1
        % east
        A(matrix_aux(i, j), matrix_aux(i, j+1)) = 1;
        A(matrix_aux(i, j+1), matrix_aux(i, j)) = 1;
        % west
        A(matrix_aux(i, j), matrix_aux(i, j-1)) = 1;
        A(matrix_aux(i, j-1), matrix_aux(i, j)) = 1;
        % north
        A(matrix_aux(i, j), matrix_aux(i-1, j)) = 1;
        A(matrix_aux(i-1, j), matrix_aux(i, j)) = 1;
        % south
        A(matrix_aux(i, j), matrix_aux(i+1, j)) = 1;
        A(matrix_aux(i+1, j), matrix_aux(i, j)) = 1;
    end
end

for i = 1:N^2
    for j = 1:N^2
        if i == j
            A(i, j) = -4;
        end
    end
end

