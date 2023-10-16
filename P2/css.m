function [v] = css(long, N_c, T_c, pointPanCoord, sig)

%point coordinates is referenciated to the first point of the panel
%sig is the intenisty of the source/sink

%aqui falta transformar el punt que ens dona sobre la referencia del
%primer punt del panell

v = zeros(1,2);

r1 = pointPanCoord(1,1)^2 + pointPanCoord(1,2)^2;
r2 = (pointPanCoord(1,1)-long)^2 + pointPanCoord(1,2)^2;

o1 = atan2(pointPanCoord(1,1),sqrt(r1));
o2 = atan2((pointPanCoord(1,1)-long),sqrt(r2));

for i = 1:2

    v(1,i) = (sig / 2 * pi) * (0.5 * ln(r1 / r2) * T_c(1,i) + (o2 - o1) * N_c(1,i));

end