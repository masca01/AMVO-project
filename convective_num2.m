function [convective_u, convective_v] = convective_num2(u, v, N, L)
% numerical definition of the convective term in both directions, x and y

% vector definition
convective_u = zeros(N);
convective_v = zeros(N);

% face longitude 
delta = L/N;
        
for i = 2:N+1
    for j = 2:N+1
        
        % u velocity at each face
        F_e=(u(i, j+1)*delta+u(i,j)*delta)/2;
        F_w=(u(i, j-1)*delta+u(i,j)*delta)/2;
        F_s=(v(i-1, j)*delta+v(i-1,j+1)*delta)/2;
        F_n=(v(i, j)*delta+v(i,j+1)*delta)/2;
        
        u_e=(u(i,j+1)+u(i,j))/2;
        u_w=(u(i,j-1)+u(i,j))/2;
        u_s=(u(i-1,j)+u(i,j))/2;
        u_n=(u(i+1,j)+u(i,j))/2;
        
        convective_u(i-1,j-1) = (u_e*F_e - u_w*F_w + u_n*F_n - u_s*F_s) / (delta^2);
        
        % v velocity at each face
        F_e=(u(i+1, j)*delta+u(i,j)*delta)/2;
        F_w=(u(i-1, j)*delta+u(i+1,j-1)*delta)/2;
        F_s=(v(i-1, j)*delta+v(i,j)*delta)/2;
        F_n=(v(i, j)*delta+v(i+1,j)*delta)/2;
        
        v_e=(v(i,j+1)+v(i,j))/2;
        v_w=(v(i,j-1)+v(i,j))/2;
        v_s=(v(i-1,j)+v(i,j))/2;
        v_n=(v(i+1,j+1)+v(i,j))/2;
        
        convective_v(i-1, j-1) = (v_e*F_e - v_w*F_w + v_n*F_n - v_s*F_s) / (delta^2);
        
    end
end



