clear
close all
clc

%% DATA INPUT
R = 0.5;
N = 10;
M = N +1;
Qinf = 2;
angle = linspace(0, 2*pi, M);
pointGlobalCoord = [0.5, 0.5];

%% VECTOR DEFINITION
airfPos = zeros(M, 2);
posContrPoints = zeros(N, 2);
long = zeros(N, 1);
sinArray = zeros(N, 1);
cosArray = zeros(N, 1);
T_c = zeros(N, 2);
N_c = zeros(N, 2);
b = zeros(N, 2);
pointPanCoord = zeros(N, 2);
Vp  = zeros(N, 2);

%% CALCULATIONS

% compute the x & z position of each node point
for i = 1:M
    airfPos(i, 1) = R * cos(angle(1, i));
    airfPos(i, 2) = - R * sin(angle(1, i));
end

for i = 1:N
    % compute the x & z position of each control volume
    posContrPoints(i, 1) = (airfPos(i, 1) + airfPos(i+1, 1)) / 2;
    posContrPoints(i, 2) = (airfPos(i, 2) + airfPos(i+1, 2)) / 2;

    % compute the longitud of each control volume
    diferencia_x = abs(airfPos(i, 1) - airfPos(i+1, 1));
    diferencia_z = abs(airfPos(i, 2) - airfPos(i+1, 2));
    long(i, 1) = sqrt(diferencia_x^2 + diferencia_z^2);

    % compute the cos & sen that the cv maes with x axis
    sinArray(i, 1) = (-airfPos(i+1, 2) + airfPos(i, 2)) / long(i, 1);
    cosArray(i, 1) = (airfPos(i+1, 1) - airfPos(i, 1)) / long(i, 1);

    % definition of normal & tangent vectors for each control volume
    N_c(i, :) = [sinArray(i, 1), cosArray(i, 1)];
    T_c(i, :) = [cosArray(i, 1), -sinArray(i, 1)];

    %double loop for each control point
    b(i, :) = Qinf * N_c(i, :);
    pointPanCoord(i, :) = globalToPan(airfPos(i,:), pointGlobalCoord, sinArray(i), cosArray(i));
    Vp(i, :) = velocities(pointPanCoord(i, :), long(i));

end

figure(1)
hold on
plot(airfPos(:, 1), airfPos(:, 2))
plot(posContrPoints(:, 1), posContrPoints(:, 2), 'x')
quiver(posContrPoints(:, 1), posContrPoints(:, 2), N_c(:, 1), N_c(:, 2))
quiver(posContrPoints(:, 1), posContrPoints(:, 2), T_c(:, 1), T_c(:, 2))
xlabel('X')
ylabel('Z')
title('Cylinder discretization')
legend('Cylinder', 'Control points', 'Normal vectors', 'Tangnet vectors', 'Location','best')
axis equal
grid on 
grid minor