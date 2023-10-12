function [u_print, v_print] = analyticPartC(N, L, u_syms, v_syms, x, y, numSteps, visc, time)

u_print = zeros(1, numSteps);
v_print = zeros(1, numSteps);

[~, ~, ~, ~, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);

u_print(1) = u(3,3);
v_print(1) = v(3,3);

for i = 2:numSteps

    F = exp(-8 * pi^2 * visc * time(i));
    un = F * u;
    vn = F * v;
    u_print(i) = un(3,3);
    v_print(i) = vn(3,3);
end