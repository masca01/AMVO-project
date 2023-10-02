function [delta_t] = eval_time_step(N, L, u, v)

%% funcio per evaluar el time step adequat per l'estabilitat, pag 57
f = 0.3;
delta = L / N;
%agafem la u o v maxima
max_u = max(max(abs(u)));
max_v = max(max(abs(v)));
maxim_vel = max (max_u, max_v);
delta_c = delta / maxim_vel;

viscosity = (N/L) / 100; %viscosity (Reynolds number should be around 100)
viscosity =100;
delta_d = 0.5 * (delta^2 / viscosity);

delta_t = f * min(delta_c, delta_d);
end

