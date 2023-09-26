function [fprintf] = print_field(u)%, label, format)

%% grup 4
% print field with "coordinal order" (position (1, 1) at bottom left, and
% so on).

% u --> field to be printed/converted
% label --> string with a description
% format --> fprintf format
% example --> print_field(up,'predictor vel. u','%+.3e ')

N = size(u, 1);      % mesh size

for j = 1:N
    k = 1;
    for i = N:-1:1
        fprintf(i, j) = u(j, k);
        k = k + 1;
    end
end

end

