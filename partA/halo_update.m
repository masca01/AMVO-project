function halo_print = halo_update(u)
    % Agafem el tamany de la matriu u
    M= size(u, 1);

    % Inicialitzem la matriu halo print amb 0
    halo_print = zeros(M + 2, M + 2);

    % Copiem els valors interiors de u a halo print
    for i = 2:M+1
        for j = 2:M+1
            halo_print(i, j) = u(i - 1, j - 1);
        end
    end

    % Copy values to form the halo
    for j = 1:M
        halo_print(1, j + 1) = halo_print(M + 1, j + 1);   % Copiem la penultima fila a la primera
        halo_print(M + 2, j + 1) = halo_print(2, j + 1);   % Copeim la segona fila a l'ultima
    end

    for i = 1:M
        halo_print(i + 1, 1) = halo_print(i + 1, M + 1);   % Copiem la penultima columna a la primera
        halo_print(i + 1, M + 2) = halo_print(i + 1, 2);   % Copeim la segona columna a l'ultima
    end
end
