%% main part C
clear

N=7;
L=1;
numSteps = 1;
s = ( L / N )^2;

syms x y

u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms =  - sin(2*pi*x) * cos(2*pi*y);

u_print = zeros(1, numSteps);
v_print = zeros(1, numSteps);

% evaluate time step for stability
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);

[pos_x_p, pos_y_p, p] = set_pressure_field (N, L, 0);

[dp_dx, dp_dy] = gradient_matrix(halo_update(p), N, L);
up = u;
vp = v;

un = u;
vn = v;

un_new = up - dp_dx;
vn_new = vp - dp_dy;

time = zeros(1, numSteps);
timePrint = zeros(1, numSteps);

for i = 1:numSteps

    un_old = un;
    vn_old = vn;

    un = un_new; %new becomes old
    vn = vn_new; %new becomes old

    time(i) = eval_time_step (N, L, un, vn);

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, un_old, vn_old);

    Rold_u = ((-conv_u / s) + (diff_u / s)); %old R

    Rold_v = ((-conv_v / s) + (diff_v / s)); %old R

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, un, vn);

    Rnew_u = ((-conv_u / s) + (diff_u / s)); %new R

    Rnew_v = ((-conv_v / s) + (diff_v / s)); %new R

    up = un + time(i) * (1.5 * Rnew_u - 0.5 * Rold_u);
    vp = vn + time(i) * (1.5 * Rnew_v - 0.5 * Rold_v);

    [pos_x_p, pos_y_p, p] = set_pressure_field (N, L, time(i));
    [dp_dx, dp_dy] = gradient_matrix(halo_update(p), N, L);

    un_new = up - dp_dx; %new velocity u_n+1
    vn_new = vp - dp_dy;

    u_print(i) = un_new(3,3);
    v_print(i) = vn_new(3,3);
    timePrint(i+1) = timePrint(i) + time(i);
end


