clear all
close all
clc

s = tf('s');
Gp = 100 / (s^3 + 5.5*s^2 + 4.5*s);
Gs = 0.5;
Ga = 0.112;
Gf = 0.25;

Tp = 1.10;
Sp = 1.41;

nu = 1;
Kp = 22.2;
Kc = 0.06;

Lin = Kc/s^nu *Gp*Ga*Gf*Gs;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp)
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE ZERO
z = 1.2/60;

Rz = (1 + s/z);
L = Lin*Rz;

figure(2)
myngridst(Tp,Sp)
nichols(L,omega)

% RETE LEAD
md = 4;
zd = 1.2/2;

Rd = (1 + s/zd) / (1 + s/(md*zd));
L = L*Rd;

figure(3)
myngridst(Tp,Sp)
nichols(L,omega)

% VERIFICA PRESTAZIONI
S = 1 / (1 + L);
T = S*L;

figure(4)
omega = linspace(0,30,1000000);
step(T/(Gf*Gs),omega)

figure(5)
omega = logspace(-2,2,1000000);
bodemag(S,omega)

figure(6)
bodemag(T,omega)

