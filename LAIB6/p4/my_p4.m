close all
clear all
clc

s = tf('s');
Gp = -30 / (s^3 + 3*s^2 + 2*s);
Gs = 1,
Ga = 0.006;

Gf = 1;
nu = 0;
Kc = -63;

Tp = 1.13;
Sp = 1.45;

Lin = Kc/(s^nu) *Gp*Ga*Gf*Gs;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp)
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE LEAD
zd = 0.6/0.36;
md = 14;

Rd = (1 + s/zd) / (1 + s/(md*zd));
L = Lin*Rd;

figure(2)
myngridst(Tp,Sp)
nichols(L,omega)

% RETE LAG
pi = 0.6/100;
mi = 10^(18.3/20);

Ri = (1 + s/(mi*pi))/(1 + s/pi);
L = L*Ri;

figure(3)
myngridst(Tp,Sp)
nichols(L,omega)

% VERIFICA PRESTAZIONI
T = L / (1 + L);

figure(4)
omega = linspace(0,30,1000000);
step(T/(Gs*Gf),omega)

figure(5)
omega = logspace(-2,2,1000000);
bodemag(T,omega)




