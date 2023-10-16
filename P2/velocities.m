function [Vp] = velocities(pointPanCoord, long)

r1 = pointPanCoord(1,1)^2 + pointPanCoord(1,2)^2;
r2 = (pointPanCoord(1,1)-long)^2 + pointPanCoord(1,2)^2;

o1 = atan2(pointPanCoord(1,1),sqrt(r1));
o2 = atan2((pointPanCoord(1,1)-long),sqrt(r2));

Vp(1, 1) = (1 / 4*pi) * log(r1 / r2);
Vp(1, 2) = (1 / 2*pi) * (o2 - o1);