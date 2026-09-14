clear all
close all
clc

s = tf('s');
Gp = 40 / (s^3 + 3*s^2 + 4.5*s);
Gs = 3;
Ga = -0.27;

Gf = 0.11;
Tp = 1.03;
Sp = 1.34;

nu = 1;
Kc = -0.025*10^(10.5/20);

Lin = Kc/(s^nu) *Gp*Ga*Gf*Gs;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE ZERO
z = 1.2/20;

Rz = (1 + s/z);
L = Lin*Rz;

figure(2)
myngridst(Tp,Sp);
nichols(L,omega)

% RETE LEAD
zd = 1.2/0.55;
md = 16;

Rd = (1 + s/zd)/(1 + s/(md*zd));
L = L*Rd;

figure(3)
myngridst(Tp,Sp);
nichols(L,omega)

% VERIFICA PRESTAZIONI
T = L / (1 + L);

figure(4)
omega = linspace(0,30,10000000);
step(T/(Gf*Gs),omega)

figure(5)
omega = logspace(-2,2,1000000);
bodemag(T,omega)



