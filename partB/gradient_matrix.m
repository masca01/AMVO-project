function [du_dx, du_dy] = gradient_matrix(u, L, N)
% u matrix, which has values at the center nodes, define the gradient
% values at each face node ( staggered mesh)

% grad (f) = df/dx + df/dy
delta = L/N;
for i = 2:N+1
    for j = 2:N+1
        du_dx(i-1, j-1) = (u(i, j+1) - u(i, j)) / delta;
        du_dy(i-1, j-1) = (u(i-1, j) - u(i, j)) / delta;
    end
end


