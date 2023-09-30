function d = diverg(u, v, N, L)  % velocity fields u and v in halo_update
% divergence = du/dx + dv/dy 
delta = L/N;
for i = 2:N+1
    for j = 2:N+1

        % du/dx
        du_dx(i-1, j-1) = (u(i, j) - u(i, j-1)) / delta;
        
        % dv/dy
        dv_dy(i-1, j-1) = (v(i, j) - v(i+1, j)) / delta;


        % divergence
        d(i-1, j-1) = du_dx(i-1, j-1) + dv_dy(i-1, j-1);

    end
end
end


