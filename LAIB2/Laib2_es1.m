%% Calcolo della risposta di un sistema LTI
close all
clear all
clc

load out;

A = [0 -1 5; 0 0 3; 0 0 -2];
B = [1 1 1]';
C = [0 0 5];
D = 0;

%% 2) risposta forzata dell'uscita
s = tf('s');
U = 9/s;
sys = ss(A,B,C,D);

H = zpk(sys);  %equivalentemente H = tf(sys)

Y = H*U;
%Y = C*inv(s*eye(size(A))-A)*B*U;

[numY,denY] = tfdata(Y,'v');
[R,p] = residue(numY,denY)

tao = 1/2;
t = [0:tao/20:10*tao];
y = -22.5*exp(-2*t) + 22.5;
figure(1)
plot(t,y)
grid on
hold on  %out.y_sim.signals.values
plot(out.tout, out.y_sim.signals.values, 'r')
title("Risposta punto 2")
xlabel("tempo [s]")
ylabel("Uscita forzata")
pause
close

%% 3) risposta libera dell'uscita
X0 = [1 5 0]';
Y = C*inv(s*eye(size(A))-A)*X0;
Y = minreal(zpk(Y));
[numY,denY] = tfdata(Y,'v');
[R,p] = residue(numY,denY)

y_t = initial(sys, X0, t);
plot(t, y_t, 'r')
grid on
pause
close

%% 4) risposta libera dell'uscita
X0 = [0 0 3]';
Y = C*inv(s*eye(size(A))-A)*X0;
Y = minreal(zpk(Y));
[numY,denY] = tfdata(Y,'v');
[R,p] = residue(numY,denY)

y = 15*exp(-2*t);
plot(t,y,'b')
hold on

y_t = initial(sys, X0, t);
plot(t, y_t, 'r')
grid on