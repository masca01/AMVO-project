function [convective_u, convective_v] = convective_term(u, v, N, L)
% numerical definition of the convective term in both directions, x and y

% vector definition
convective_u = zeros(N, N);
convective_v = zeros(N, N);

% face longitude 
delta = L/N;

for i = 2:N+1
    for j = 2:N+1
        % u velocity at each face
        u_e = (u(i, j) + u(i, j+1)) / 2;
        u_w = (u(i, j) + u(i, j-1)) / 2;
        u_n = (u(i, j) + u(i-1, j)) / 2;
        u_s = (u(i, j) + u(i+1, j)) / 2;
        v_n_u = (v(i, j) + v(i, j+1)) / 2;
        v_s_u = (v(i+1, j) + v(i+1, j+1)) / 2;

        % v velocity at each face
        v_e = (v(i, j) + v(i, j+1)) / 2;
        v_w = (v(i, j) + v(i, j-1)) / 2;
        v_n = (v(i, j) + v(i-1, j)) / 2;
        v_s = (v(i, j) + v(i+1, j)) / 2;
        u_e_v = (u(i, j) + u(i-1, j)) / 2;
        u_w_v = (u(i, j-1) + u(i-1, j-1)) / 2;

        %calculem el terme convectiu en u i v per cada punt, cal desfer la
        %integral amb el delta^2
        convective_u(i-1, j-1) = (u_e*u_e*delta - u_w*u_w*delta + u_n*v_n_u*delta - u_s*v_s_u*delta) / delta^2;
        convective_v(i-1, j-1) = (u_e_v*v_e*delta - u_w_v*v_w*delta + v_n*v_n*delta - v_s*v_s*delta) / delta^2;
    end
end



