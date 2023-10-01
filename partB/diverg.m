function  [d] = diverg(u, v, N, L)  % velocity fields u and v in halo_update

%Inicialitzem
d = zeros(N, N);
delta = L/N;

for i = 2:N+1
    for j = 2:N+1
        % integral de la divergencia du/dx
        du_dx = ((u(i, j) - u(i, j-1)) / delta)*delta^2;
        
        % integral de la divergencia dv/dy
        dv_dy= ((v(i, j) - v(i-1, j)) / delta)*delta^2;

        % divergence = du/dx + dv/dy 
        d(i-1, j-1) = du_dx + dv_dy;
    end
end
end


