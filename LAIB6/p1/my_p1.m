close all
clear all
clc

s = tf('s');
Gp = 25 / (s^3 + 3.3*s^2 + 2*s);
Gs = 1;
Ga = 0.095;
Gf = 1;
Kp = dcgain(s*Gp);

nu = 0;
Kc = 6;

Tp = 1.05;
Sp = 1.36;

Lin = Kc/(s^nu) *Gp*Ga*Gs*Gf;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

wc = 0.8;

% RETE LEAD
zd = 0.8/1.2;
md = 11;

Rd = (1 + s/zd)/(1 + s/(md*zd));
L = Lin*Rd;

figure(2)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(L,omega)

% RETE LAG
pi = 0.8/100;
mi = 10^(19.4/20);

Ri = (1 + s/(mi*pi))/(1 + s/pi);
L = L*Ri;

figure(3)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(L,omega)

% VERIFICA PRESTAZIONI
T = L / (1+L);
S = 1 / (1 + L);

figure(4);
omega = linspace(0,100,1000000);
step(T/(Gf*Gs),omega)

figure(5)
omega = logspace(-2,2,1000000);
bodemag(S,omega)

figure(6)
bodemag(T,omega)


