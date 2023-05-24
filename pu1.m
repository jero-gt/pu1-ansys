%TP UTILITARIO 1
addpath('./funciones');
addpath('./sistemas');
clc, close all, clearvars;
%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,x);

[X, s] = TFTD(x, n);
plotComplejo([-1 1 -80 110], [-1 1 0 110],[-0.5 0.5 -3 3], 'Frecuencia "s" ','Módulo de la TFTD','Gráfico de la TFTD',25,'m-',1.5,s,X);
%cerrar_graficos;
%% ECUACION EN DIFERENCIAS 1
% y[n]= (1/2)*x[n] + (1/2)*x[n-1]
n1=0:101; %Eje coordenado x para la ecuacion en diferencias 1
y1(1)= (1/2)*x(1);
for i=2:length(x)
    y1(i)=(1/2)*x(i) + (1/2)*x(i-1);
end
y1(length(x)+1)= (1/2)*x(length(x));

%Respuesta impulsional al sistema
h1=(1/2)*deltaK(n1) + (1/2)*deltaK(n1-1);
H1 = 0.5*(1 + exp(-j*2*pi*s));
stemCompleto([n(1) n(end) 0 1],'n','Amplitud','h1[n] analitica',25,'m*-',1.5,n1,h1);
plotComplejo([s(1) s(end) 0 1.5],[s(1) s(end) 0 1.5] ,[-1 1 -3 3],'Frecuencia "s" ','Amplitud','H1 analitica',25,'m-',1.5,s,H1);
% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h1_v = s1(deltaK(n));
[H1_v, s] = TFTD(h1_v,n1);
stemCompleto([n(1) n(end) 0 1],'n','Amplitud','h1[n] Matlab',25,'m*-',1.5,n1,h1_v);
plotComplejo([s(1) s(end) 0 1.5], [s(1) s(end) 0 1.5], [-1 1 -3 3],'Frecuencia "s" ','Módulo de la TFTD','H1(f)=TFTD{h1[n]}',25,'m-',1.5,s,H1_v);

%cerrar_graficos;
