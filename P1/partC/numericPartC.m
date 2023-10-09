function [u_print, v_print, time] = numericPartC(N, L, u_syms, v_syms, x, y, numSteps, visc)

u_print = zeros(1, numSteps);
v_print = zeros(1, numSteps);

time = zeros(1,numSteps);

[~, ~, ~, ~, u, v] = set_velocity_field(N, L, u_syms, v_syms, x, y);

u_print(1) = u(3,3);
v_print(1) = v(3,3);

time(2) = eval_time_step (N, L, u, v, visc);

[conv_u, conv_v, diff_u, diff_v] = partA(N, L, u, v);

Ru = ((-conv_u) + visc * (diff_u));

Rv = ((-conv_v) + visc * (diff_v));

up = u + time(2) * (Ru);
vp = v + time(2) * (Rv);

% result_div_up = diverg(halo_update(up), halo_update(vp), N, L); %shouldnt be 0

[result_div, u_n1, v_n1] = partB(N,L,up,vp); %should be 0

if abs(result_div) > 1*10^(-5)

    return %it will stop the code

end

u_print(2) = u_n1(3,3);
v_print(2) = v_n1(3,3);

un = u;
vn = v;

for i = 2:numSteps

    time(i+1) = eval_time_step (N, L, u_n1, v_n1, visc);

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, un, vn);

    Rold_u = ((-conv_u ) + visc * (diff_u )); %old R

    Rold_v = ((-conv_v ) + visc * (diff_v )); %old R

    [conv_u, conv_v, diff_u, diff_v] = partA(N, L, u_n1, v_n1);

    Rnew_u = ((-conv_u) + visc * (diff_u)); %new R

    Rnew_v = ((-conv_v) + visc * (diff_v)); %new R

    up = u_n1 + time(i) * (1.5 * Rnew_u - 0.5 * Rold_u);
    vp = v_n1 + time(i) * (1.5 * Rnew_v - 0.5 * Rold_v);

    % [pos_x_p, pos_y_p, p] = set_pressure_field (N, L, time(i));
    % [dp_dx, dp_dy] = gradient_matrix(halo_update(p), N, L);

    %result_div_up = diverg(halo_update(up), halo_update(vp), N, L); %shouldnt be 0

    un = u_n1;
    vn = v_n1;

    [result_div, u_n1, v_n1] = partB(N,L,up,vp); %should be 0

    if abs(result_div) > 1*10^(-5)

        return %it will stop the code

    end

    u_print(i+1) = u_n1(3,3);
    v_print(i+1) = v_n1(3,3);
end