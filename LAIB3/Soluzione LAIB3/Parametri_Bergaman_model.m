% Parametri Bergam minimal model

P1 = 0.003; %paziente diabetico 

P2 = 0.025 % min^-1

P3 = 0.000013% (L/mU)*min^2
p1=P1;
p2=P2;
p3=P3;

V1 = 12; % L

Vg = 126; % dL

n = 5/54; % min^-1

Gb = 81; % mg/dL

Ib = 15; % mU/L

Ub = 16.66667; % mU/min <--u1 di equilibrio

% Matrici linearizzato intorno a punto di equilibrio calcolato 
% che corrisponde di fatto al punto [x1_eq x2_eq x3_eq]' = [Gb Ib 0]' con ingresso
% costante u_eq = [Ub 0]';

A = [-P1 0 -Gb;0 -n 0;0 P3 -P2];

B = [0 1/Vg;1/V1 0;0 0];

C = [1 0 0];

D = [0 0];

% Condizioni iniziali linearizzato

x0lin = [9 0 0]';

