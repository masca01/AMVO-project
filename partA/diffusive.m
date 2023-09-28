function [diffusive_u, diffusive_v] = diffusive(u, v, N, L)

%% diffusive term

%Inicialitzem matrius
diffusive_u = zeros(N, N);
diffusive_v = zeros(N, N);
delta = L/N;

for i=2:N+1
    for j=2:N+1
        
        %u
        du_dx_e(i-1, j-1) = (u(i,j+1)-u(i,j))/(delta);
        du_dx_w(i-1, j-1) = (u(i,j)-u(i,j-1))/(delta);
        du_dy_n(i-1, j-1) = (u(i+1,j)-u(i,j))/(delta);
        du_dy_s(i-1, j-1) = (u(i,j)-u(i-1,j))/(delta);
        diffusive_u(i-1, j-1) = (du_dx_e(i-1, j-1)*delta - du_dx_w(i-1, j-1)*delta + du_dy_n(i-1, j-1)*delta - du_dy_s(i-1, j-1)*delta) / delta^2;
        du_dx_e = (u(i,j+1)-u(i,j))/(delta);
        du_dx_w = (u(i,j)-u(i,j-1))/(delta);
        du_dy_n = (u(i+1,j)-u(i,j))/(delta);
        du_dy_s = (u(i,j)-u(i-1,j))/(delta);
        %calculem el terme difusiu en u, dividim per delta^2 per desfer la
        %integral
        diffusive_u(i-1, j-1) = (du_dx_e*delta - du_dx_w*delta + du_dy_n*delta - du_dy_s*delta) / delta^2;
        
        %v
        dv_dx_e(i-1, j-1) = (v(i+1,j)-v(i,j))/(delta);
        dv_dx_w(i-1, j-1) = (v(i,j)-v(i-1,j))/(delta);
        dv_dy_n(i-1, j-1) = (v(i,j+1)-v(i,j))/(delta);
        dv_dy_s(i-1, j-1) = (v(i,j)-v(i,j-1))/(delta);
        diffusive_v(i-1, j-1) = (dv_dx_e(i-1, j-1)*delta - dv_dx_w(i-1, j-1)*delta + dv_dy_n(i-1, j-1)*delta - dv_dy_s(i-1, j-1)*delta) / delta^2;
        
        dv_dx_e = (v(i+1,j)-v(i,j))/(delta);
        dv_dx_w = (v(i,j)-v(i-1,j))/(delta);
        dv_dy_n = (v(i,j+1)-v(i,j))/(delta);
        dv_dy_s = (v(i,j)-v(i,j-1))/(delta);
        %calculem el terme difusiu en v, dividim per delta^2 per desfer la
        %integral
        diffusive_v(i-1, j-1) = (dv_dx_e*delta - dv_dx_w*delta + dv_dy_n*delta - dv_dy_s*delta) / delta^2; 
    end
end

