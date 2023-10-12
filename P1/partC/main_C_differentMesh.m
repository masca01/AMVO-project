%% MAIN PART C DIFFERENT MESH
clear
close all
clc

%% Vector Definition
max_error_u = zeros(5, 1);
max_error_v = zeros(5, 1);
max_error = zeros(5, 1);
h = zeros(5, 1);

L = 1;
numSteps = 100;

syms x y
u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms = - sin(2*pi*x) * cos(2*pi*y);

i = 1;

for N = 10:10:50

    visc = (L/N)/100;

    [u_print, v_print, time] = numeric_C(N, L, u_syms, v_syms, x, y, numSteps, visc);
    [u_print_an, v_print_an] = analyticPartC(N, L, u_syms, v_syms, x, y, numSteps, visc, time);

    max_error_u(i) = error_calc(u_print, u_print_an);
    max_error_v(i) = error_calc(v_print, v_print_an);
    max_error(i) = max(max_error_u(i), max_error_v(i));

    h(i) = L/N;
    i = i + 1;

end


figure(1)
hold on
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')
plot(h, max_error, 'x')
plot(h, h.^2)
xlabel('h')
ylabel('error')
title('Mesh convergence of the overall code')
legend('MAX error','h^2', 'location','best')
axis([0.017 0.12 0.0003 0.1])
grid on
% grid minor


