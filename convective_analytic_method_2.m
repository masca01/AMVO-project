function [convective_analytic_u, convective_analytic_v] = convective_analytic_method_2(L, N)

% [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(N, L);

xu = linspace(L/N, L, N);
yu = linspace(L/(2*N), L-L/(2*N), N);

xv = linspace(L/(2*N), L-L/(2*N), N);
yv = linspace(L/N, L, N);

syms x y u_an v_an
u_an = cos(2*pi*x) * sin(2*pi*y);
v_an = - sin(2*pi*x) * cos(2*pi*y);

% du_dx = diff(u_an, x);
% du_dy = diff(u_an, y);
% 
% dv_dx = diff(v_an, x);
% dv_dy = diff(v_an, y);
% 
% du_dx_f = matlabFunction(du_dx, 'Vars', [x y]);
% du_dy_f = matlabFunction(du_dy, 'Vars', [x y]);
% dv_dx_f = matlabFunction(dv_dx, 'Vars', [x y]);
% dv_dy_f = matlabFunction(dv_dy, 'Vars', [x y]);
% 
% for i = 1:N
%     for j = 1:N
%         du_dx_field(i, j) = du_dx_f(pos_x_u(i, j), pos_y_u(i, j));
%         du_dy_field(i, j) = du_dy_f(pos_x_u(i, j), pos_y_u(i, j));
%         dv_dx_field(i, j) = dv_dx_f(pos_x_v(i, j), pos_y_v(i, j));
%         dv_dy_field(i, j) = dv_dy_f(pos_x_v(i, j), pos_y_v(i, j));
% 
%         convective_analytic_u(i, j) = u(i, j) * du_dx_field(i, j) + v(i, j) * du_dy_field(i, j);
%         convective_analytic_v(i, j) = u(i, j) * dv_dx_field(i, j) + v(i, j) * dv_dy_field(i, j);
%     end
% end

convective_u = u_an * diff(u_an, x) + v_an * diff(u_an, y);
convective_v = u_an * diff(v_an, x) + v_an * diff(v_an, y);

f_u = matlabFunction(convective_u, 'Vars', [x y]);
f_v = matlabFunction(convective_v, 'Vars', [x y]);
for i = 1:N
    for j = 1:N
        convective_analytic_u_aux(i, j) = f_u(xu(1, i), yu(1, j));
        convective_analytic_v_aux(i, j) = f_v(xv(1, i), yv(1, j));
    end
end
  
convective_analytic_u = print_field(convective_analytic_u_aux);
convective_analytic_v = print_field(convective_analytic_v_aux);

