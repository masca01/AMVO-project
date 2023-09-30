close all
clear

L = 1;
M = 32;
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(M, L);
X = L/M:L/M:L;
Y = L:-L/M:L/M;
figure (1)
hold on
quiver(X, Y, u, v)
title('Velocity field')

i = 1;
for N = 10:10:100

    [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(N, L);

    first_halo_u = first_halo(u, N);
    first_halo_v = first_halo(v, N);

    halo_print_u = halo_update(first_halo_u);
    halo_print_v = halo_update(first_halo_v);

    %% CONVECTIVE
    [convective_u, convective_v] = convective_term(halo_print_u, halo_print_v, N, L);
    [convective_analytic_u, convective_analytic_v] = convective_analytic_method(L, N);


    [error_convective_u, error_u] = max_error_convection(convective_u, convective_analytic_u);

    [error_convective_v, error_v] = max_error_convection(convective_v, convective_analytic_v);

    max_error_convective_u(1, i) = error_convective_u;
    max_error_convective_v(1, i) = error_convective_v;

    difference_error(1, i) = max_error_convective_v(1, i) - max_error_convective_u(1, i);
    %% DIFFUSIVE

    [diffusive_u, diffusive_v] = diffusive(halo_print_u, halo_print_v, N, L);
    [diffusive_analytic_u, diffusive_analytic_v] = diffusive_analytic_method(N, pos_x_u, pos_y_u, pos_x_v, pos_y_v);

    [error_diff_u] = max_error_convection(diffusive_u, diffusive_analytic_u);
    [error_diff_v] = max_error_convection(diffusive_v, diffusive_analytic_v);

    max_error_diff_u(1, i) = error_diff_u;
    max_error_diff_v(1, i) = error_diff_v;

    h(1, i) = L/N;
    i = i+1;
end
figure(2)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error_convective_u, '-o')
plot(h, max_error_diff_u, '-o')
plot(h, h.^2, '-o')
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
plot(h, max_error_convective_v, '-o')
plot(h, max_error_diff_v, '-o')
plot(h, h.^2, '-o')
xlabel('h')
ylabel('error')
title('Velocity V')
legend('error conv.', 'error diff.', 'h^2', 'location', 'best')
grid on
%


% ficar set velocity field dintre del convection i diffusive  (acabar de
% mirar)


