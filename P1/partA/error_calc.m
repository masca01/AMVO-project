function [error] = error_calc(convective_u, convective_analytic_u)

% computes the error between the numerical and analytic calculations
error = max(max(abs(convective_u - convective_analytic_u)));

end