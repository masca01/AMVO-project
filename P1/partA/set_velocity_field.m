function [pos_x_u, pos_y_u, pos_x_v, pos_y_v, u, v] = set_velocity_field(N, L, u_an, v_an, x, y)
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
        pos_x_u(i, j) = (L/N) * (i);
        pos_y_u(i, j) = (L/N)*(j-1/2);
    end
end
u_field = matlabFunction(u_an, 'Vars', [x y]);
for j = 1:N
    for i=1:N
        u(i, j) = u_field(pos_x_u(i,j),pos_y_u(i,j)); %  modify according to velocity field
    end
end

% pos_x_v
pos_x_v(N, :) = (L/(N)) / 2;
for i = 1:N
    for j = 1:N
        pos_x_v(i, j) =  (L/N)*(i-1/2);
    end
end

% pos_y_v
for i = N:-1:1
    for j = 1:N
        pos_y_v(i, j) = (L/N) * (j);
    end
end

v_field = matlabFunction(v_an, 'Vars', [x y]);
for i = 1:N
    for j = 1:N
        v(i, j) = v_field(pos_x_v(i,j),pos_y_v(i,j)); % modify according to velocity field
    end
end



