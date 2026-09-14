clear all
close all
clc

s = tf('s');
Gp = -30 / (s^3 + 3*s^2 + 2*s);
Gs = 10;
Ga = 0.06;
Gf = 0.01;

nu = 1;
Kc = -0.25*10^(0.603/20);

Tp = 1.11;
Sp = 1.43;

Lin = Kc/(s^nu) *Gp*Gs*Ga*Gf;
minreal(zpk(Lin))

% RETE ZERO
z = 0.8/30;

Rz = (1 + s/z);
L = Lin*Rz;

% RETE LEAD
zd = 0.8/0.7;
md = 16;

Rd = (1 + s/zd) / (1 + s/(md*zd));
L = L*Rd;

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(L,omega);

% VERIFICA DELLE SPECIFICHE
T = L / (1 + L);

figure(2)
omega = linspace(0,30,1000000);
step(T/(Gf*Gs),omega)

figure(3)
omega = logspace(-2,2,1000000);
bodemag(T,omega)