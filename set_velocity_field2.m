function [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field2(N, L)
% for a given mesh size, computes the position (x, y) of the both
% velocities (u, v)

% N --> number of cells
% L --> domain size

% vector definition
pos_x_u = zeros(N, N);
pos_y_u = zeros(N, N);
pos_y_v = zeros(N, N);
pos_x_v = zeros(N, N);
u = zeros(N, N);
v = zeros(N, N);

% pos_x_u
for i = 1:N
    for j = 1:N
        pos_x_u(i, j) = (L/N) * (j);
    end
end
%pos_y_u
pos_y_u(N, :) = (L/(N)) / 2;
for i = N-1:-1:1
    for j = 1:N
        pos_y_u(i, j) = ((L/(N)) / 2) + (L/N) * (N-i);
    end
end
for i = 1:N
    for j = 1:N
        u(i, j) = cos(2*pi*pos_x_u(i, j)) * sin(2*pi*pos_y_u(i, j)); %  modify according to velocity field
    end
end

% pos_x_v
pos_x_v(N, :) = (L/(N)) / 2;
for i = 1:N
    for j = 1:N
        pos_x_v(i, j) = ((L/(N)) / 2) + (L/N) * (j-1);
    end
end

% pos_y_v
for i = N:-1:1
    for j = 1:N
        pos_y_v(i, j) = (L/N) * (N+1-i);
    end
end

for i = 1:N
    for j = 1:N
        v(i, j) = -sin(2*pi*pos_x_v(i, j)) * cos(2*pi*pos_y_v(i, j)); % modify according to velocity field
    end
end




