function [pos_x_p, pos_y_p, p] = set_pressure_field (N, L, time)
% for a given mesh size, computes the position (x, y) of the both pressure

% N --> number of cells
% L --> domain size

rho = 1.29; %air density [kg/m3]
visc = 100; %viscosity (Reynolds number should be around 100)

% vector definition
pos_x_p = zeros(N, N);
pos_y_p = zeros(N, N);
p = zeros(N, N);

% pos_x_p
for i = 1:N
    for j = 1:N
        pos_x_p(i, j) = (L/N) * (j);
    end
end
%pos_y_p
pos_y_u(N, :) = (L/(N)) / 2;
for i = N-1:-1:1
    for j = 1:N
        pos_y_p(i, j) = ((L/(N)) / 2) + (L/N) * (N-i);
    end
end
for i = 1:N
    for j = 1:N
        p(i, j) = cos(2*pi*pos_x_u(i, j)) * sin(2*pi*pos_y_u(i, j)); %  modify according to velocity field    
    end
end


