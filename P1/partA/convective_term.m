function [convective_u, convective_v] = convective_term(u, v, N, L)
% numerical definition of the convective term in both directions, x and y

% vector definition
convective_u = zeros(N, N);
convective_v = zeros(N, N);
for i = 2:N+1
    for j = 2:N+1
        % u velocity at each face
        u_e(i-1, j-1) = (u(i+1, j) + u(i, j)) / 2;
        u_w(i-1, j-1) = (u(i-1, j) + u(i, j)) / 2;
        u_n(i-1, j-1) = (u(i, j) + u(i, j+1)) / 2;
        u_s(i-1, j-1) = (u(i, j) + u(i, j-1)) / 2;
        v_n_u(i-1, j-1) = (v(i, j) + v(i+1, j)) / 2;
        v_s_u(i-1, j-1) = (v(i, j-1) + v(i+1, j-1)) / 2;

        % v velocity at each face
        v_e(i-1, j-1) = (v(i, j) + v(i+1, j)) / 2;
        v_w(i-1, j-1) = (v(i, j) + v(i-1, j)) / 2;
        v_n(i-1, j-1) = (v(i, j) + v(i, j+1)) / 2;
        v_s(i-1, j-1) = (v(i, j) + v(i, j-1)) / 2;
        u_e_v(i-1, j-1) = (u(i, j) + u(i, j+1)) / 2;
        u_w_v(i-1, j-1) = (u(i-1, j) + u(i-1, j+1)) / 2;
        
        % face longitude 
        delta = L/N;

        convective_u(i-1, j-1) = (u_e(i-1, j-1)*u_e(i-1, j-1)*delta - u_w(i-1, j-1)*u_w(i-1, j-1)*delta + u_n(i-1, j-1)*v_n_u(i-1, j-1)*delta - u_s(i-1, j-1)*v_s_u(i-1, j-1)*delta) / delta^2;
        convective_v(i-1, j-1) = (u_e_v(i-1, j-1)*v_e(i-1, j-1)*delta - u_w_v(i-1, j-1)*v_w(i-1, j-1)*delta + v_n(i-1, j-1)*v_n(i-1, j-1)*delta - v_s(i-1, j-1)*v_s(i-1, j-1)*delta) / delta^2;
    end
end