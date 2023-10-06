function [up, wp] = velocities(point, long)

r1 = point(1,1)^2 + point(1,2)^2;
r2 = (point(1,1)-long)^2 + point(1,2)^2;

o1 = acos2(point(1,1),sqrt(r1));
o2 = acos2((point(1,1)-long),sqrt(r2));

up = (1 / 4*pi) * ln(r1 / r2);
wp = (1 / 2*pi) * (o2 - o1);
