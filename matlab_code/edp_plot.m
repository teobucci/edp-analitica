%% ----------------------------------------------------------------------------
%% SEMAFORO
ro_m = 1;
v_m = 0.5;

x = -10:0.3:10;
t = 0:0.3:10;

[X, T] = meshgrid(x, t);

ro = ro_m.*(X <= -v_m * T)  + ro_m/2*(1 - X./(v_m*T)) .*( (-v_m*T<X) & (X < v_m*T) ) + 0;

figure;
mesh(X, T, ro, 'EdgeColor','black');

%% ----------------------------------------------------------------------------
%% TRAFFICO A VALLE

ro_m = 1;
v_m = 3;

x = -10:0.3:10;
t = 0:0.3:10;

[X, T] = meshgrid(x, t);

ro = 1/8*ro_m .* (X < -1/8 * v_m * T)  + ro_m .* (X > -1/8 * v_m * T);

figure;
mesh(X, T, ro, 'EdgeColor','black');

%% ----------------------------------------------------------------------------
%% CONTROESEMPIO BURGERS
clear all
close all
U=@(x,t,u) u - atan(x-(1-2.*u).*t);
interval_meno_03 = [-5 5 -0.3 -0.299 -5 5];
interval_05 = [-5 5 0.499 0.5 -5 5];
interval_15 = [-5 5 1.499 1.5 -5 5];
figure()
fimplicit3(U)
hold on
title('Soluzione del controesempio di Burgers')
fimplicit3(U, interval_meno_03,'g','LineWidth',5)
fimplicit3(U, interval_05,'b', 'LineWidth',5)
fimplicit3(U, interval_15,'r', 'LineWidth',5)
legend('surface', 't=-0,3', 't=0,5', 't=1')