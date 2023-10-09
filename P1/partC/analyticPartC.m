function [u_print, v_print, time] = analyticPartC(N, L, u_syms, v_syms, x, y, numSteps, visc)

u_print = zeros(1, numSteps);
v_print = zeros(1, numSteps);
t = 0;

time = zeros(1,numSteps);

[~, ~, ~, ~, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);
u_print(1) = u(3,3);
v_print(1) = v(3,3);

for i = 2:numSteps

    t = t + 0.04;
    F = exp(-8 * pi^2 * visc * t);
    un = F * u;
    vn = F * v;
    u_print(i) = un(3,3);
    v_print(i) = vn(3,3);
    time(i) = t;
end