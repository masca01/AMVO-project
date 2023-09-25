function [convective_u, convective_v] = convective_num(u, v, L)

N = size(u, 1) - 2;
delta = L/N;

for i = 2:N+1
    for j = 2:N+1
        
        u_e = (u(i, j+1) + u(i, j)) / 2;
        u_w = (u(i, j-1) + u(i, j)) / 2;
        u_n= (u(i+1, j) + u(i, j)) / 2;
        u_s = (u(i-1, j) + u(i, j)) / 2;

        v_e = (v(i, j) + v(i, j+1)) / 2;
        v_w = (v(i, j) + v(i, j-1)) / 2;
        v_n = (v(i, j) + v(i, j+1)) / 2;
        v_s = (v(i-1, j) + v(i-1, j+1)) / 2;
        
        convective_u(i-1, j-1) = (u_e*u_e*delta - u_w*u_w*delta + u_n*v_n*delta - u_s*v_s*delta) / (delta^2);
        convective_v(i-1, j-1) = (u_e*v_e*delta - u_w*v_w*delta + v_n*v_n*delta - v_s*v_s*delta) / (delta^2);
        
    end
end
end



