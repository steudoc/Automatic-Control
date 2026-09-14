clear all
close all
clc

s=tf('s');
Gp = 40 /(s^2 + 3*s + 4.5);
Gs = 1;
Ga = -0.09;
Gf = 1;
Kp = dcgain(Gp);

nu = 1;
Kc = -3.8;

Tp = 1.02;
Sp = 1.33;

Lin = Kc/(s^nu) *Gp*Ga*Gf*Gs;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE ZERO
z = 3/1;
Rz = (1 + s/z);

L = Lin*Rz;

figure(2)
myngridst(Tp,Sp);
nichols(L,omega)

% RETE LEAD
zd = 3/1.2;
md =16;
Rd = (1 + s/zd)/(1 + s/(md*zd));

L = L*Rd;

figure(3)
myngridst(Tp,Sp);
nichols(L,omega)

% VERIFICA PRESTAZIONI
T = L / (1 + L);

figure(4)
omega = linspace(0,10,10000000);
step(T/(Gf*Gs),omega)

figure(5)
omega = logspace(-2,2,1000000);
bodemag(T,omega)

% POLO
L = L / (1 + s/50);

% VERIFICA FINALE
T = L / (1 + L);

figure(6)
omega = linspace(0,10,10000000);
step(T/(Gf*Gs),omega)

figure(7)
omega = logspace(-2,2,1000000);
bodemag(T,omega)



