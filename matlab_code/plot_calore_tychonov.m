% Prova funzione implicita

clearvars
close all

%% Funzione tau

syms t x k

h = exp(-t^(-2));

% numero di derivate computate
N = 50;

tau = 0;
for k = 1:N
    tau = tau + (diff(h,k) / factorial(2*k)) * x^(2*k);
end

% possibili visualizzazioni (molto lunghe)

% simplify(tau)
% pretty(tau)
% pretty(simplify(tau))

%%
figure()
%hold on
fsurf(tau, [0 2 -10 10])
xlabel('t')
ylabel('x')
%zlim([-10,10])
hold off



%% Profili

figure()
% title('Profili al variare del tempo fissato x')
hold on
for j=-4:4
    
    x_n = j;
    M=15;

    profilo = 0;
        for k=1:M
            profilo = profilo + (diff(h,k)/factorial(2*k)) * x_n^(2*k);
        end

    subplot(1,9,j+5)
    fplot(profilo, [0,3])
    ylim([-10, 10])
    xlabel(['Profilo in x = ', num2str(j)])

end
hold off


%% Controllo condizione iniziale in 0

g = subs(tau, t, 0.01);

figure()
title('Condizione iniziale')
hold on
fplot(g)
hold off

% ci starebbe bene un controllo in norma inf 

%% Controllo T_t = T_xx

T_t = diff(tau,t);
T_xx = diff(diff(tau,x),x);

f = T_t - T_xx;

figure()
title('Differenza T_t - T_xx')
hold on
fsurf(f, [0 5 -5 5])
zlim([-10,10])
hold off
