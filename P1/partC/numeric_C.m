function [u_print, v_print, time] = numeric_C(N, L, u_syms, v_syms, x, y, numSteps, visc)

% vector definition
u_print = zeros(numSteps, 1);
v_print = zeros(numSteps, 1);
time = zeros(numSteps, 1);
time_step = zeros(numSteps, 1);
% velocity field computation
[~, ~, ~, ~, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);
% time step definition
time_step(1, 1) = eval_time_step(N, L, u, v, visc);
% convective and diffusive term for first time iteration
[conv_u, conv_v, diff_u, diff_v] = partA(N, L, u, v);
% R factor for 1st iteration
Ru = -conv_u + visc*diff_u;
Rv = -conv_v + visc*diff_v;
% up for 1st iteration
up = u + time_step(1, 1) * Ru;
vp = v + time_step(1, 1) * Rv;

% computation of u n+1
[result_div, u_n1, v_n1] = partB(N,L,up,vp);
u_print(1, 1) = u_n1(3, 3);
v_print(1, 1) = v_n1(3, 3);
% define u_n values to u_n-1 and u_n+1 to u_n
u_n_min1 = u;
v_n_min1 = v;
u_n = u_n1;
v_n = v_n1;
Ru_min1 = Ru;
Rv_min1 = Rv;

% same process but inside the loop
for i = 2:numSteps
    time_step(i, 1) = eval_time_step(N, L, u_n, v_n, visc);
    time(i, 1) = time(i-1, 1) + time_step(i, 1);

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, u_n, v_n);

    Ru = -conv_u + visc*diff_u;
    Rv = -conv_v + visc*diff_v;

    up = u_n + time_step(i, 1) * (1.5 * Ru - 0.5 * Ru_min1);
    vp = v_n + time_step(i, 1) * (1.5 * Rv - 0.5 * Rv_min1);

    [result_div, u_n1, v_n1] = partB(N,L,up,vp);

    u_print(i, 1) = u_n1(3, 3);
    v_print(i, 1) = v_n1(3, 3);

    u_n = u_n1;
    v_n = v_n1;
    Ru_min1 = Ru;
    Rv_min1 = Rv;

end

