%% MAIN PART C
clear
close all
clc

N = 10;
L = 1;
numSteps = 100;
visc = (L/N)/100;

syms x y
u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms = - sin(2*pi*x) * cos(2*pi*y);

[u_print, v_print, time] = numeric_C(N, L, u_syms, v_syms, x, y, numSteps, visc);
[u_print_an, v_print_an] = analyticPartC(N, L, u_syms, v_syms, x, y, numSteps, visc, time);


set(groot,'defaultAxesTickLabelInterpreter','latex');
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');

figure(1)
hold on
plot(time, u_print)
plot(time, v_print)
plot(time, u_print_an)
plot(time, v_print_an)
legend('$u_{num}$', '$v_{num}$', '$u_{an}$', '$v_{an}$', 'Location','best', 'FontSize', 12)
xlabel('Time [s]','FontSize', 16)
ylabel('Velocity [m/s]', 'FontSize', 16)
title('Comparison of Analytic and Numeric velocities');
grid on 
grid minor
box on
set(gcf, 'units', 'points', 'position', [50,50,676,420]);
hold off;

