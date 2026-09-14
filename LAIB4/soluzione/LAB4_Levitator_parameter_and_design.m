clear all
clc
close all

Im = 0.8;
m = 0.02;
g = 9.81;
Kt = 708.27;
Km = 1.52e-4;
x1_eq = Im*sqrt(Km/(m*g))
x2_eq = 0

A = [0 1; 2*Km*Im^2/(m*x1_eq^3) 0]
B = [0; -2*Km*Im/(m*x1_eq^2)]
C = [Kt 0];
D = 0;

Mr = ctrb(A,B);
rango_matrice_controllabilita = rank(Mr)        % è uguale a 2 che è proprio il numero di stati --> sistema completamente controllabile

Mo = obsv(A,C);
rango_matrice_osservabilita = rank(Mo)          % è uguale a 2 che è proprio il numero di stati --> sistema completamente osservabile

minreal(zpk(ss(A,B,C,D)))                      

p_k = [-20 -30]; % scelgo gli autovalori del sistema controllato in modo che il sistema sia asintoticamente stabile e che il tempo di risposta sia sufficientemente breve (
% --> tempo di assestamento della risposta circa uguale a 5*tao con tao = 1/(più piccolo autovalore in p_k)

K = place(A,B,p_k);

p_l  = [-100 -77];  %scelgo gli autovalori dell'osservatore negativi per avere errore di stima che converge a 0 e li scelgo in valore assoluto più grandi di quelli del sistema di controllo
% per poter garantire che la stima converga rapidamente)

L = place(A',C',p_l)';

alfa = inv(-(C-D*K)*inv(A-B*K)*B + D); % per tracking esatto a steady-state di riferimenti a gradino
