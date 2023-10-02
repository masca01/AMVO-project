%% main part C
clear
warning('off');

N=7;
L=1;
numSteps = 10;
s = ( L / N )^2;

syms x y

u_syms = cos(2*pi*x) * sin(2*pi*y);
v_syms =  - sin(2*pi*x) * cos(2*pi*y);

u_print = zeros(1, numSteps);
v_print = zeros(1, numSteps);

% evaluate time step for stability
[pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);

time = eval_time_step (N, L, u, v);

[conv_u, conv_v, diff_u, diff_v] = partA(N, L, u, v);

Ru = ((-conv_u / s) + (diff_u / s));

Rv = ((-conv_v / s) + (diff_v / s));

up = u + time * (Ru);
vp = v + time * (Rv);

result_div_up = diverg(halo_update(up), halo_update(vp), N, L); %shouldnt be 0

[result_div, u_n1, v_n1] = partB(N,L,up,vp); %should be 0

%[pos_x_p, pos_y_p, p] = set_pressure_field (N, L, 0);

%[dp_dx, dp_dy] = gradient_matrix(halo_update(p), N, L);
% up = u;
% vp = v;
%
un = u;
vn = v;
%
% un_new = up - dp_dx;
% vn_new = vp - dp_dy;
%
%time = zeros(1, numSteps);
% timePrint = zeros(1, numSteps);
%
for i = 1:numSteps

    % u_n = u_n1;
    % v_n = v_n1;

    time(i) = eval_time_step (N, L, u_n1, v_n1);

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, un, vn);

    Rold_u = ((-conv_u / s) + (diff_u / s)); %old R

    Rold_v = ((-conv_v / s) + (diff_v / s)); %old R

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, u_n1, v_n1);

    Rnew_u = ((-conv_u / s) + (diff_u / s)); %new R

    Rnew_v = ((-conv_v / s) + (diff_v / s)); %new R

    up = u_n1 + time(i) * (1.5 * Rnew_u - 0.5 * Rold_u);
    vp = v_n1 + time(i) * (1.5 * Rnew_v - 0.5 * Rold_v);

    % [pos_x_p, pos_y_p, p] = set_pressure_field (N, L, time(i));
    % [dp_dx, dp_dy] = gradient_matrix(halo_update(p), N, L);

    result_div_up = diverg(halo_update(up), halo_update(vp), N, L); %shouldnt be 0

    un = u_n1;
    vn = v_n1;

    [result_div, u_n1, v_n1] = partB(N,L,up,vp); %should be 0

    % u_print(i) = u_n1(3,3);
    % v_print(i) = v_n1(3,3);
    % timePrint(i+1) = timePrint(i) + time(i);
end


