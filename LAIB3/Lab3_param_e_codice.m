close all
clear all
clc

%% 1) Parametri Bergam minimal model

P1 = 0.003; %paziente diabetico -- P1 = 0.028 min^-1 paziente ok
P2 = 0.025; % min^-1
P3 = 0.000013; % (L/mU)*min^2
p1=P1;
p2=P2;
p3=P3;

V1 = 12; % L
Vg = 126; % dL
n = 5/54; % min^-1
Gb = 81; % mg/dL
Ib = 15; % mU/L
Ub = 16.66667; % mU/min <--u1 di equilibrio

%% 2) 3) Sistema linearizzato
A = [-p1 0 -Gb; 0 -n 0; 0 p3 -p2];
B = [0 1/Vg; 1/V1 0; 0 0];
C = [1 0 0];
D = [0 0];

eigenvalues = eig(A)    %il punto di eq è asintoticamente stabile in quanto gli eig(A) sono tutti a parte reale negativa

%% 4) modello SIMULINK

%% 5) modello SIMULINK
sys = ss(A,B,eye(3,3),zeros(3,2));

%% 6) modello SIMULINK

%% 7) raggiungibilità/controllabilità
Mr = ctrb(A,B);
r = rank(Mr)    % il sistema è completamente raggiungibile/controllabile poichè r = n = 3

%% 8) retroazione statica dallo stato
autoval = [-1 -2 -3];
k = place(A,B,autoval)

% Sistema chiuso: x_dot = (A - B*K)*x
Ac = A - B*k;
Bc = zeros(3,1);     % Nessun ingresso esterno
Cc = eye(3);         % Osserviamo tutti gli stati
Dc = zeros(3,1);

sys_cl = ss(Ac, Bc, Cc, Dc);

% Simulazione della risposta libera
x0 = [10; 0; 0];      % Stato iniziale: perturbazione sulla glicemia
t = 0:0.1:30;

[y, t_out, x] = initial(sys_cl, x0, t);

% Plot
figure;
plot(t_out, x)
legend('x_1 (Glicemia)', 'x_2 (Insulina nel sangue)', 'x_3 (Insulina nel tessuto)')
xlabel('Tempo [min]')
ylabel('Stati')
title('Risposta del sistema in retroazione con autovalori [-1, -2, -3]')
grid on