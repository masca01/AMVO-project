% main to test part B

clear all
close all
clc

L = 1;
N = 5;

% es fiquen valors de u i v (tot 0 i algun punt on no es 0)
u  =[0 0 0 0 0;
    0 0 1 0 0;
    0 2 1 0 0;
    0 0 3 1 0;
    0 0 0 0 0];
v  =[0 0 0 0 0;
    0 0 3 0 0;
    0 1 4 0 0;
    0 0 0 1 0;
    0 0 0 0 0];

% halo de les velocitats per a poder tractar tots els nodes be
u_halo = first_halo(u, N);
v_halo = first_halo(v, N);
u_halo = halo_update(u_halo);
v_halo = halo_update(v_halo);

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



% a partir d'aqui es on crec que comença a fallar, que no acabo d'entendre
% el que demana


% calcul del gradient de la matriu de la p (pas 5) 
[du_dx, du_dy] = gradient_matrix(p_poisson_matrix, L, N);

% calcul de u^(n+1)    (pas 6)
u_n1 = u - du_dx;
v_n1 = v - du_dy;

% es pasen les matrius de velocitat a halo
un1_halo = first_halo(u_n1, N);
vn1_halo = first_halo(v_n1, N);
un1_halo = halo_update(un1_halo);
vn1_halo = halo_update(vn1_halo);
% calcul de la divergencia de u^(n+1)   (pas 7)
[resultx, resulty] = diverg(un1_halo, vn1_halo, N, L);
% hauria de donar 0 pero no dona, jo crec que l'error ha destar en la
% funció que fa el gradient de la pressio xq no acabo de vuere si es fa un
% u, en u i v, si despres es sumen, etc
