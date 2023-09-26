function [diffusive_analytic_u, diffusive_analytic_v] = diffusive_analytic_method(N, pos_x_u, pos_y_u, pos_x_v, pos_y_v)
% computes the diffusive term by an analytic method

% vector definition
diffusive_analytic_u = zeros(N, N);
diffusive_analytic_v = zeros(N, N);

% u velocity definition
syms u_an(x, y)
u_an = cos(2*pi*x) * sin(2*pi*y);
% second derivates of the u velocity
ddu_dxx = diff(u_an, x, x);
ddu_dyy = diff(u_an, y, y);
% transform the syms function into a mesh, where you can modify the values
% of x and y
class(ddu_dxx); 
ddu_dxx_field = matlabFunction(ddu_dxx, 'Vars', [x y]);
class(ddu_dxx_field);
class(ddu_dyy);
ddu_dyy_field = matlabFunction(ddu_dyy, 'Vars', [x y]);
class(ddu_dyy_field);

% same for v
syms v_an(x, y)
v_an =  - sin(2*pi*x) * cos(2*pi*y);
ddv_dxx = diff(v_an, x, x);
ddv_dyy = diff(v_an, y, y);
class(ddv_dxx);
ddv_dxx_field = matlabFunction(ddv_dxx, 'Vars', [x y]);
class(ddv_dxx_field);
class(ddv_dyy);
ddv_dyy_field = matlabFunction(ddv_dyy, 'Vars', [x y]);
class(ddv_dyy_field);

for i = 1:N
    for j = 1:N
        diffusive_analytic_u(i, j) = ddu_dxx_field(pos_x_u(i, j), pos_y_u(i, j)) + ddu_dyy_field(pos_x_u(i, j), pos_y_u(i, j));
        diffusive_analytic_v(i, j) = ddv_dxx_field(pos_x_v(i, j), pos_y_v(i, j)) + ddv_dyy_field(pos_x_v(i, j), pos_y_v(i, j));
    end
end
