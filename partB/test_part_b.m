% main to test part B

clear all
close all
clc

L = 1;
N = 7;

% es posen valors de u i v (tot 0 i excepte algun punt)
% aixo ja ho canviarem que queda molt cutre
u  =[0 0 0 0 0 0 0;
    0 0 1 0 0 0 0;
    0 -1 2 0 1 -1 0;
    0 0 -2 1 0 9 -9;
    0 -1 2 0 1 -1 0;
    0 0 -2 1 0 9 -9
    0 1 0 0 0 0 0];

v  =[0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 1 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 -1];

% halo de les velocitats per a poder tractar tots els nodes be

u_halo = halo_update(first_halo(u,N));
v_halo = halo_update(first_halo(v,N));

% calcul de la divergencia de la velocitat
d = diverg(u_halo, v_halo, N, L);
% es transforma la matriu de la divergencia en un vector
b = field2vector(d);
% es defineix la matriu A
A = A_matrix(N);
% es calcula el terme p a partir de la matriu A i el vector b
p_poisson_vector = inversa(A, b);
% es transforma el terme p, el qual es un vector, en una matriu de NxN
p_poisson_matrix = vector2Matrix(p_poisson_vector, N);
% calcul del gradient de la matriu de la p (pas 5) 
[du_dx, du_dy] = gradient_matrix(p_poisson_matrix, N, L);

% calcul de u^(n+1)    (pas 6)
u_n1 = u - du_dx;
v_n1 = v - du_dy;

% es pasen les matrius de velocitat a halo
un1_halo = halo_update(first_halo(u_n1,N));
vn1_halo = halo_update(first_halo(v_n1,N));
% calcul de la divergencia de u^(n+1)   (pas 7) i es comprova que dona 0
resultx = diverg(un1_halo, vn1_halo, N, L);