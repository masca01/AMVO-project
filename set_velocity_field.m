function [pos_x_u, pos_y_u] = set_velocity_field(N, L)
% N --> number of cells
% L --> domain size

u = zeros(N+2, N+2);
v = zeros(N+2, N+2); 

pos_x_u = zeros(N+2, N+2);
pos_y_u = zeros(N+2, N+2);

% pos_x_u
for i = 1:N+2
    for j = 2:N+3
        pos_x_u(i, j) = pos_x_u(i, j-1) + L/(N+2);
    end
end
% pos_y_u
pos_y_u(N+2, :) = (L/(N+2)) / 2;
for i = N+1:-1:1
    for j = 1:N+2
        pos_y_u(i, j) = pos_y_u(i+1, j) + L/(N+2);
    end
end


% % pos_y_v
% for i = N+1:-1:1
%     for j = 1:N+2
%         pos_y(i, j) = pos_y(i+1, j) + L/N;
%     end
% end
% 
% 
% for i = 1:N+2
%     for j = 1:N+2
%         u(i, j) = 2*(pos_x(i, j));             % vel_x  (2 * x) 
%         v(i, j) = 3*(pos_y(i, j));             % vel_y  (3 * y)
%     end
% end



end
