function [diffusive_u, diffusive_v] = diffusive(u, v, N, L)

%% diffusive term

% delta_x = L/N;
% delta_y = L/N;

delta = L/N;

for i=2:N+1
    for j=2:N+1
        
        %u
        du_dx_e(i-1, j-1) = (u(i,j+1)-u(i,j))/(delta);
        du_dx_w(i-1, j-1) = (u(i,j)-u(i,j-1))/(delta);
        du_dy_n(i-1, j-1) = (u(i+1,j)-u(i,j))/(delta);
        du_dy_s(i-1, j-1) = (u(i,j)-u(i-1,j))/(delta);
        diffusive_u(i-1, j-1) = (du_dx_e(i-1, j-1)*delta - du_dx_w(i-1, j-1)*delta + du_dy_n(i-1, j-1)*delta - du_dy_s(i-1, j-1)*delta) / delta^2;
        
        %v
        dv_dx_e(i-1, j-1) = (v(i+1,j)-v(i,j))/(delta);
        dv_dx_w(i-1, j-1) = (v(i,j)-v(i-1,j))/(delta);
        dv_dy_n(i-1, j-1) = (v(i,j+1)-v(i,j))/(delta);
        dv_dy_s(i-1, j-1) = (v(i,j)-v(i,j-1))/(delta);
        diffusive_v(i-1, j-1) = (dv_dx_e(i-1, j-1)*delta - dv_dx_w(i-1, j-1)*delta + dv_dy_n(i-1, j-1)*delta - dv_dy_s(i-1, j-1)*delta) / delta^2;
        
    end
end


