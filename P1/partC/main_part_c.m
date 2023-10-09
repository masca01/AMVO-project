%% main part C
clear
close all
clc
warning('off');

N=10;
L=1;
numSteps = 50;
s = ( L / N )^2;
visc = (L / N) / 100; %viscosity (Reynolds number should be around 100)

syms x y

u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms =  - sin(2*pi*x) * cos(2*pi*y);

[u_print, v_print, time] = numericPartC(N, L, u_syms, v_syms, x, y, s, numSteps, visc);
[u_print_an, v_print_an, timePrint_an] = analyticPartC(N, L, u_syms, v_syms, x, y, numSteps, visc);

timePrint = cumsum(time);

figure(1);
plot(timePrint,u_print,timePrint,v_print, timePrint_an,u_print_an,timePrint_an,v_print_an);
xlabel('Time, t / s')
ylabel('Velocity, v / (ms^-1)')
title('Velocity over time')
legend('u num','v num', 'u an','v an', 'location','best')
axis([0 2 -0.4 0.4]);
grid on
grid minor

% 
% figure(2);
% plot(timePrint_an,u_print_an,timePrint_an,v_print_an);
% xlabel('Time, t / s')
% ylabel('Velocity, v / (ms^-1)')
% title('Velocity over time')
% legend('u num','v num', 'u an','v an', 'location','best')
% grid on
% grid minor


