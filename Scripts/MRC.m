%{
Controle Adaptativo
Model Reference Control
%}

clc, close all, clear all

fs = 10^3;
ts = 1 / 10^3;

simulation_time = 0:ts:

Va_max = 13;
zeta = 1;
wn = 7.64;

num = [4.28];
den = [1 370.8 1690.6];
G = tf(num, den);

for k = :length(simulation_time) - 1

end