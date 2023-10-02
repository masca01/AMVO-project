%% main part C
clear
close all
clc
warning('off');

N=10;
L=1;
numSteps = 50;
s = ( L / N )^2;

syms x y

u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms =  - sin(2*pi*x) * cos(2*pi*y);

[u_print, v_print, time] = numericPartC(N, L, u_syms, v_syms, x, y, s, numSteps);

timePrint = cumsum(time);
plot(timePrint,u_print,timePrint,v_print);
xlabel('Time, t / s')
ylabel('Velocity, v / (ms^-1)')
title('Velocity over time')
legend('u velocity','v velocity', 'location','best')
grid on
grid minor

