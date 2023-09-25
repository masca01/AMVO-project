function [convective_u, convective_v] = convective_num(u, v, L)

N = size(u, 1) - 2;
delta = L/N;
for i = 2:N+1
    for j = 2:N+1
        u_e(i-1, j-1) = (u(i, j+1) + u(i, j)) / 2;
        u_w(i-1, j-1) = (u(i, j) + u(i, j-1)) / 2;
        u_n(i-1, j-1) = (u(i, j) + u(i-1, j)) / 2;
        u_s(i-1, j-1) = (u(i, j) + u(i+1, j)) / 2;


        v_e(i-1, j-1) = (v(i, j) + v(i, j+1)) / 2;
        v_w(i-1, j-1) = (v(i, j) + v(i, j-1)) / 2;
        v_n(i-1, j-1) = (v(i, j) + v(i-1, j)) / 2;
        v_s(i-1, j-1) = (v(i, j) + v(i+1, j)) / 2;
    end
end

for i = 1:N
    for j=1:N
        convective_u(i, j) = (u_e(i, j)*u_e(i, j)*delta - u_w(i, j)*u_w(i, j)*delta + u_n(i, j)*v_n(i, j)*delta - u_s(i, j)*v_s(i, j)*delta) / delta^2;
        convective_v(i, j) = (u_e(i, j)*v_e(i, j)*delta - u_w(i, j)*v_w(i, j)*delta + v_n(i, j)*v_n(i, j)*delta - v_s(i, j)*v_s(i, j)*delta) / delta^2;
    end
end



