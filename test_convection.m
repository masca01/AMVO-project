close all
clear all
clc

L = 1;
M = 8;
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(M, L);
X = L/M:L/M:L;
Y = L:-L/M:L/M;
figure (1)
hold on
quiver(X, Y, u, v)
title('velocity field')
v = zeros(M, M);
% figure (2)
% hold on
% quiver(X, Y, u, v)
% title('velocity field')

i = 1;
%for N = 100:200:1000
    N = 8;

    [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(N, L);

    first_halo_u = first_halo(u, N);
    first_halo_v = first_halo(v, N);

    halo_print_u = halo_update(first_halo_u);
    halo_print_v = halo_update(first_halo_v);

    [convective_u, convective_v] = convective_term(halo_print_u, halo_print_v, N, L);
   % [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, u, v,pos_x_u, pos_y_u, pos_x_v, pos_y_v);



   [convective_analytic_u, convective_analytic_v] = convective_analytic_method_2(L, N);


    [error_convective_u, error_u] = mas_error_convection(convective_u, convective_analytic_u);

    [error_convective_v, error_v] = mas_error_convection(convective_v, convective_analytic_v);

    max_error_convective_u(1, i) = error_convective_u;
    max_error_convective_v(1, i) = error_convective_v;

    difference_error(1, i) = max_error_convective_v(1, i) - max_error_convective_u(1, i);
    %% diffusive

    [diffusive_u, diffusive_v] = diffusive(halo_print_u, halo_print_v, N, L);
    [diffusive_analytic_u, diffusive_analytic_v] = diffusive_analytic_method(N, pos_x_u, pos_y_u, pos_x_v, pos_y_v);

    [error_diff_u] = mas_error_convection(diffusive_u, diffusive_analytic_u);
    [error_diff_v] = mas_error_convection(diffusive_v, diffusive_analytic_v);

    max_error_diff_u(1, i) = error_diff_u;
    max_error_diff_v(1, i) = error_diff_v;

    h(1, i) = L/N;
    i = i+1;
% end
figure(2)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error_convective_u)
plot(h, max_error_diff_u)
plot(h, h.^2)
xlabel('h')
ylabel('error')
title('velocity U')
legend('error conv.','error diff.','h^2', 'location','best')
grid on
grid minor

figure(3)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error_convective_v)
plot(h, h.^2)
plot(h, max_error_diff_v)
xlabel('h')
ylabel('error')
title('Velocity V')
legend('error conv.','h^2', 'error diff.', 'location', 'best')
grid on



% ficar set velocity field dintre del convection i diffusive  (acabar de
% mirar)


