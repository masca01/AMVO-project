close all
clear
clc

%% visualització del camp de velicitats
L = 1;
M = 32;

syms x y

u_syms = cos(2*pi*x).* sin(2*pi*y);
v_syms =  - sin(2*pi*x).* cos(2*pi*y);


[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(M, L, u_syms, v_syms, x, y);
X = linspace(0, L, M);
Y = linspace(L, 0, M);
figure (1)
hold on
quiver(X, Y, u, v)
title('velocity field')

%% test part A
i = 1;
for N = [8,16,32,64,128,256]

     [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);
     halo_print_u = halo_update(u);
     halo_print_v = halo_update(v);
     
    %% CONVECTIVE
    
    %calculem els termes convectius, tants els numerics com els analitics
    [convective_u, convective_v] = convective_term(halo_print_u, halo_print_v, N, L);
    [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, L, u_syms, v_syms, x, y);
    
    %calculem l'error entre analitic i numeric i ho guardem a un vector
    max_error_convective_u(1, i) = error_calc(convective_u, convective_analytic_u);
    max_error_convective_v(1, i) = error_calc(convective_v, convective_analytic_v);
    
    %% DIFFUSIVE
    %calculem els termes convectius, tants els numerics com els analitics
    [diffusive_u, diffusive_v] = diffusive(halo_print_u, halo_print_v, N, L);
    [diffusive_analytic_u, diffusive_analytic_v] = diffusive_analytic_method(N, pos_x_u, pos_y_u, pos_x_v, pos_y_v, u_syms, v_syms, x, y);
    
    %calculem l'error entre analitic i numeric i ho guardem a un vector
    max_error_diff_u(1, i) = error_calc(diffusive_u, diffusive_analytic_u);
    max_error_diff_v(1, i) = error_calc(diffusive_v, diffusive_analytic_v);
    
    %guardem el tamany de les divisions
    h(1, i) = L/N;
    i = i+1;
end

%% fem els plots dels errors
figure(2)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error_convective_u, '-o')
plot(h, max_error_diff_u, '-o')
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
plot(h, max_error_convective_v, '-o')
plot(h, max_error_diff_v, '-o')
plot(h, h.^2)
xlabel('h')
ylabel('error')
title('Velocity V')
legend('error conv.', 'error diff.','h^2', 'location', 'best')
grid on

