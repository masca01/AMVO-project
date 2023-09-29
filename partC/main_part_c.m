%% main part C
N=10;
L=1;
% evaluate time step for stability
 [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field (N, L);
time = eval_time_step (N, L, u, v);