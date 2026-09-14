clear all
close all
clc

s = tf('s');
Gp = 100 / (s^2 + 5.5*s + 4.5);
Gs = 1;
Ga = 0.014;
Gf = 1;

p = 0;
Kp = dcgain(s^p *Gp)

nu = 1;
Kc = 22

Tp = 1.08;
Sp = 1.39;

Lin = Kc/(s^nu) *Gp*Ga*Gf*Gs;
minreal(zpk(Lin))

figure(1)
myngridst(Tp,Sp);
omega = linspace(-100,100,1000000);
nichols(Lin,omega)

% RETE ZERO
z = 1/0.6;
Rz = (1 + s/z);

L = Lin*Rz;

figure(2)
myngridst(Tp,Sp);
nichols(L,omega)

% RETE LAG
pi = 1/100;
mi = 10^(14.8/20);

Ri = (1 + s/(mi*pi))/(1 + s/pi);
L = L*Ri;

figure(3)
myngridst(Tp,Sp);
nichols(L,omega)

% VERIFICA PRESTAZIONI
S = 1 / (1 + L);
T = L / (1 + L);

figure(4)
omega = linspace(0,20,1000000);
step(T/(Gf*Gs),omega);

figure(5)
omega = logspace(-2,2,1000000);
bodemag(S,omega)

figure(6)
bodemag(T,omega)




