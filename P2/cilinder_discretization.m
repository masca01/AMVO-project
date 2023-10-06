clear
close all
clc

%% DATA INPUT
R = 0.5;
N = 10;
M = N +1;
angle = linspace(0, 2*pi, M);

%% VECTOR DEFINITION
posicions = zeros(M, 2);
pos_cv = zeros(N, 2);
long = zeros(N, 1);
sin_array = zeros(N, 1);
cos_array = zeros(N, 1);
T_c = zeros(N, 2);
N_c = zeros(N, 2);

%% CALCULATIONS

% compute the x & z position of each node point
for i = 1:M
    posicions(i, 1) = R * cos(angle(1, i));
    posicions(i, 2) = - R * sin(angle(1, i));
end

for i = 1:N
    % compute the x & z position of each control volume
    pos_cv(i, 1) = (posicions(i, 1) + posicions(i+1, 1)) / 2;
    pos_cv(i, 2) = (posicions(i, 2) + posicions(i+1, 2)) / 2;

    % compute the longitud of each control volume
    diferencia_x = abs(posicions(i, 1) - posicions(i+1, 1));
    diferencia_z = abs(posicions(i, 2) - posicions(i+1, 2));
    long(i, 1) = sqrt(diferencia_x^2 + diferencia_z^2);

    % compute the cos & sen that the cv maes with x axis
    sin_array(i, 1) = (-posicions(i+1, 2) + posicions(i, 2)) / long(i, 1);
    cos_array(i, 1) = (+posicions(i+1, 1) - posicions(i, 1)) / long(i, 1);

    % definition of normal & tangent vectors for each control volume
    N_c(i, :) = [sin_array(i, 1), cos_array(i, 1)];
    T_c(i, :) = [cos_array(i, 1), -sin_array(i, 1)];

end

figure(1)
hold on
plot(posicions(:, 1), posicions(:, 2))
plot(pos_cv(:, 1), pos_cv(:, 2), 'x')
quiver(pos_cv(:, 1), pos_cv(:, 2), N_c(:, 1), N_c(:, 2))
quiver(pos_cv(:, 1), pos_cv(:, 2), T_c(:, 1), T_c(:, 2))
xlabel('X')
ylabel('Z')
title('Cylinder discretization')
legend('Cylinder', 'Control volumes', 'Normal vectors', 'Tangnet vectors', 'Location','best')
axis equal
grid on 
grid minor