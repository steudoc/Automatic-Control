close all
clear all
clc

%% parametri
m = 0.02;
g = 9.81;
Kt = 708.27;
Km = 1.52e-4;

Im = 0.8;

%% 1) equilibrio
x1 = sqrt((Km*(Im)^2) / (m*g));
x2 = 0;
x = [x1 x2]'

%% 2) linearizzazione
A = [0 1; (2*Km*(Im)^2)/(m*(x1)^3) 0]
B = [0 -(2*Km*Im)/(m*(x1)^2)]'
C = [Kt 0]
D = 0
sys = ss(A,B,C,D);

%% 3) stabilità
eig(A)      %il sistema è internamente instabile perchè compare un autovalore a parte reale strett. positiva
H = tf(sys)
s = tf('s');
H1 = minreal(zpk(C*inv(s*eye(2,2)-A)*B+D))
P = pole(H)

%% 4) modello SIMULINK

%% 5) modello SIMULINK

%% 6) raggiungibilità/controllabilità
Mr = ctrb(A,B);
r = rank(Mr)    %il sistema è raggiungibile/controllabile poichè r = n = 2

%% 7) retroazione statica dallo stato
autoval = [-20 -30];  % più sono grandi (in modulo) e più è veloce la risposta
K = place(A,B,autoval);

% Supponiamo di voler inseguire un riferimento a gradino di ampiezza
% qualsiasi

Acl = A-B*K;
Ccl = C-D*K;

S_pippo = ss(Acl,B,Ccl,D);
H_pippo = minreal(zpk(S_pippo)); %fdt come informa fattorizzata in zeri-poli (stessa cosa di tf)

alfa = 1/(dcgain(H_pippo))

%alfa = inv(-(C-D*K)*inv(A-B*K)*B+D)