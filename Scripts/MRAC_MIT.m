%{
Pedro Henrique Diehl
Controle Adaptativo
Model Reference Adaptative Control MIT
%}
clc, close all, clear all

fs = 10^3;
Ts = 1 / fs;

simulation_time = 100;
simulation_time_array = 0:Ts:simulation_time;

ap = 1;
bp = 0.8;
Ap = [-ap];
Bp = [bp];
Cp = [1];
x = [0 0];

am = 3;
bm = 3;
Am = [-am];
Bm = [bm];
Cm = [1];
xm = [0 0];

gamma = 10; % Atribuir valores
theta1 = [0 0];
theta2 = [0 0];
zetar = [0];
zetay = [0];
for k = 2:length(simulation_time_array) - 1
    t(k) = k * Ts;
    r(k) = 2 * square((2 * pi / 20) * k * Ts);
    
    y(k) = Cp * x(k);
    ym(k) = Cm * xm(k); 
    
    e1(k) = y(k) - ym(k);
    
    u(k) = theta1(k) * r(k) - theta2(k) * y(k);
    
    zetar(k) = (3 * Ts * r(k) + zetar(k - 1)) / (1 + 3 * Ts);
    zetay(k) = (3 * Ts * y(k) + zetay(k - 1)) / (1 + 3 * Ts);
   
    theta1(k + 1) = theta1(k) - Ts * gamma * zetar(k) * e1(k);
    theta2(k + 1) = theta2(k) + Ts * gamma * zetay(k) * e1(k);
    
    x(k + 1) = x(k) + Ts * (Ap * x(k) + Bp * u(k));
    xm(k + 1) = xm(k) + Ts * (Am * xm(k) + Bm * r(k));
end

plot(t, ym)
hold on 
plot(t, y)

