close all
clear all
clc

%% visualització del camp de velicitats
L = 1;
<<<<<<< Updated upstream:test_convection.m
M = 20;
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(M, L);
X = L/M:L/M:L;
Y = L:-L/M:L/M;
=======
M = 32;
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(M, L);
X = linspace(0, L, M);
Y = linspace(L, 0, M);
>>>>>>> Stashed changes:partA/test_convection.m
figure (1)
hold on
quiver(X, Y, u, v)
title('velocity field')
v = zeros(M, M);
% figure (2)
% hold on
% quiver(X, Y, u, v)
% title('velocity field')

%% test part A
i = 1;
<<<<<<< Updated upstream:test_convection.m
for N = 5:1:16
   % N = 8;
=======

for N = 32:8:256
>>>>>>> Stashed changes:partA/test_convection.m

    [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(N, L);

    halo_print_u = halo_update(u);
    halo_print_v = halo_update(v);

<<<<<<< Updated upstream:test_convection.m
    [convective_u, convective_v] = convective_num2(halo_print_u, halo_print_v, N, L);
   % [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, u, v,pos_x_u, pos_y_u, pos_x_v, pos_y_v);
    [convective_analytic_u, convective_analytic_v] = convective_analytic_method_2(N, L);

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
 end
=======
    %% CONVECTIVE
    
    %calculem els termes convectius, tants els numerics com els analitics
    [convective_u, convective_v] = convective_term(halo_print_u, halo_print_v, N, L);
    [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, L);
    
    %calculem l'error entre analitic i numeric i ho guardem a un vector
    max_error_convective_u(1, i) = error_calc(convective_u, convective_analytic_u);
    max_error_convective_v(1, i) = error_calc(convective_v, convective_analytic_v);
    
    %% DIFFUSIVE
    %calculem els termes convectius, tants els numerics com els analitics
    [diffusive_u, diffusive_v] = diffusive(halo_print_u, halo_print_v, N, L);
    [diffusive_analytic_u, diffusive_analytic_v] = diffusive_analytic_method(N, pos_x_u, pos_y_u, pos_x_v, pos_y_v);
    
    %calculem l'error entre analitic i numeric i ho guardem a un vector
    max_error_diff_u(1, i) = error_calc(diffusive_u, diffusive_analytic_u);
    max_error_diff_v(1, i) = error_calc(diffusive_v, diffusive_analytic_v);
    
    %guardem el tamany de les divisions
    h(1, i) = L/N;
    i = i+1;
end

%% fem els plots dels errors
>>>>>>> Stashed changes:partA/test_convection.m
figure(2)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error_convective_u)
plot(h, max_error_diff_u)
plot(h, h.^2)
xlabel('h')
ylabel('error')
title('Velocity U')
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
<<<<<<< Updated upstream:test_convection.m



% ficar set velocity field dintre del convection i diffusive  (acabar de
% mirar)
=======
>>>>>>> Stashed changes:partA/test_convection.m


