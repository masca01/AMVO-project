function [error_convective, error] = mas_error_convection(convective_u, convective_analytic_u)
% computes the error between the numerical and analytic calculations

error = abs(convective_u - convective_analytic_u);

error_convective = max(max(error));
