%{
Pedro Henrique Diehl
Controle Adaptativo
Model Reference Adaptative Control
%}
clc, close all, clear all

fs = 10^3;
Ts = 1 / fs;

simulation_time = 5;
simulation_time_array = 0:Ts:simulation_time;

am = 3;
bm = 3;
ap = 0.1;
bp = 0.1;

theta1_estrela = bm / bp;
theta2_estrela = (am - ap) / bp;

Ap = [-ap];
Bp = [bp];
Cp = [1];
x = [0];
Am = [-am];
Bm = [bm];
Cm = [1];
xm = [0];

for k = 1:length(simulation_time_array) - 1
    t(k) = k * Ts;
    r(k) = 2;
    
    y(k) = Cp * x(k);
    ym(k) = Cm * xm(k); 
  
    u(k) = theta1_estrela * r(k) - theta2_estrela * y(k);
    
    x(k + 1) = x(k) + Ts * (Ap * x(k) + Bp * u(k));
    xm(k + 1) = xm(k) + Ts * (Am * xm(k) + Bm * r(k));
end

plot(t, ym)
hold 
plot(t, y)
