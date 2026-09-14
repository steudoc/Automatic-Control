clear all
close all
clc

s = tf('s');
Gp = 25 / (s^3 + 3.3*s^2 + 2*s);
Gs = 2;
Ga = 0.38;
Gf = 0.125;

Kc=0.011%*10^(12.3/20);
nu = 1;
Tp = 1.08;
Sp = 1.39;

Lin = Kc/(s^nu) *Gp*Ga*Gs*Gf;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE ZERO
z = 0.8/60;

Rz = (1 + s/z);
L = Lin*Rz;

figure(2)
myngridst(Tp,Sp);
nichols(L,omega)

% RETE LEAD
md = 6;
zd = 0.8/0.8;

Rd = (1 + s/zd) / (1 + s/(md*zd));
L = L*Rd;

figure(3)
myngridst(Tp,Sp);
nichols(L,omega)

% VERIFICA PRESTAZIONI
S = 1 / (1 + L);
T = L / (1 + L);

figure(4)
omega = linspace(0,30,1000000);
step(T/(Gf*Gs),omega)







