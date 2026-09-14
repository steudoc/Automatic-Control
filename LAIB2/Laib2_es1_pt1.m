clear all
close all
clc

%% studio della stabilità interna del sistema
A = [0 -1 5;0 0 3;0 0 -2];
B = [1 1 1]';
C = [0 0 5];

eigenvalues = eig(A)    % in questo caso gli autovalori non sono tutti negativi -> devo utilizzare polinomio minimo

s = tf('s');
A1 = minreal(zpk(inv(s*eye(3,3)-A)))  % vado a forzare possibili cancellazioni

roots(minpoly(A))   %trovo le radici del polinomio minimo, in questo caso molteplicità 2 -> instabile

%% stabilità BIBO
D = 0;
sys = ss(A,B,C,D);
H = tf(sys)
pole(H)     %tutti i poli sono a parte reale < 0 ==> il sistema è BIBO stabile