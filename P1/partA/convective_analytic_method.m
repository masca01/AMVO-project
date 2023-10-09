function [convective_analytic_u, convective_analytic_v] = convective_analytic_method(N, L, u_an, v_an, x, y)

xu = linspace(L/N, L, N);
yu = linspace(L/(2*N), L-L/(2*N), N);

xv = linspace(L/(2*N), L-L/(2*N), N);
yv = linspace(L/N, L, N);

convective_u = u_an * diff(u_an, x) + v_an * diff(u_an, y);
convective_v = u_an * diff(v_an, x) + v_an * diff(v_an, y);

f_u = matlabFunction(convective_u, 'Vars', [x y]);
f_v = matlabFunction(convective_v, 'Vars', [x y]);
for i = 1:N
    for j = 1:N
        convective_analytic_u(i, j) = f_u(xu(i), yu(j));
        convective_analytic_v(i, j) = f_v(xv(i), yv(j));
    end
end


