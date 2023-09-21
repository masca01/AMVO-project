function [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, u, v,pos_x_u, pos_y_u, pos_x_v, pos_y_v)
% computes the convective term of a given velocity field in both
% directions, x and y --> u, v

% vector definition
convective_u_aux1 = zeros(N, N);
convective_u_aux2 = zeros(N, N); 
convective_analytic_u = zeros(N, N);
convective_v_aux1 = zeros(N, N);
convective_v_aux2 = zeros(N, N);
convective_analytic_v = zeros(N, N);

% definition of the u velocity analytically
syms u_an(x, y)
u_an = cos(2*pi*x) * sin(2*pi*y);
% derivates of the u velocity
du_dx = diff(u_an, x);
du_dy = diff(u_an, y);
% transform the syms function into a mesh, where you can modify the values
% of x and y
class(du_dx);
du_dx_field = matlabFunction(du_dx, 'Vars', [x y]);
class(du_dx_field);
class(du_dy);
du_dy_field = matlabFunction(du_dy, 'Vars', [x y]);
class(du_dy_field);
% same for v velocity
syms v_an(x, y)
v_an = - sin(2*pi*x) * cos(2*pi*y);
dv_dx = diff(v_an, x);
dv_dy = diff(v_an, y);

class(dv_dx);
dv_dx_field = matlabFunction(dv_dx, 'Vars', [x y]);
class(dv_dx_field);
class(dv_dy);
dv_dy_field = matlabFunction(dv_dy, 'Vars', [x y]);
class(dv_dy_field);


for i = 1:N
    for j = 1:N
        % convective u
        convective_u_aux1(i, j) = u(i, j) * du_dx_field(pos_x_u(i, j), pos_y_u(i, j));
        convective_u_aux2(i, j) = v(i, j) * du_dy_field(pos_x_u(i, j), pos_y_u(i, j));
        convective_analytic_u(i, j) = convective_u_aux1(i, j) + convective_u_aux2(i, j);

        % convective v
        convective_v_aux1(i, j) = u(i, j) * dv_dx_field(pos_x_v(i, j), pos_y_v(i, j));
        convective_v_aux2(i, j) = v(i, j) * dv_dy_field(pos_x_v(i, j), pos_y_v(i, j));
        convective_analytic_v(i, j) = convective_v_aux1(i, j) + convective_v_aux2(i, j);
    end
end




