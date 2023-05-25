%TP UTILITARIO 1
addpath('./funciones');
addpath('./sistemas');
clc; close all;  clearvars;
%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Señal de entrada x[n]',25,'m*-',1.5,n,x);
cerrar_graficos;
[X, s] = TFTD(x, n);
plotComplejo([-0.5 0.5 -80 110], [-0.5 0.5 0 110],[-0.5 0.5 -4 4], 's ','X(\exp(j*2*\pi*s)','X(\exp(j*2*\pi*s)',25,'m-',1.5,s,X);
cerrar_graficos;
%% ECUACION EN DIFERENCIAS 1
% y[n]= (1/2)*x[n] + (1/2)*x[n-1]
n1=0:101; %Eje coordenado x para la ecuacion en diferencias 1

%Respuesta impulsional al sistema
h1=(1/2)*deltaK(n1) + (1/2)*deltaK(n1-1);
H1 = 0.5*(1 + exp(-1i*2*pi*s));
stemCompleto([n(1) n(end) 0 1],'n','Amplitud','h1[n] analitica',25,'m*-',1.5,n1,h1);
plotComplejo([s(1) s(end) 0 1.5],[s(1) s(end) 0 1.5] ,[-1 1 -3 3],'Frecuencia "s" ','Amplitud','H1 analitica',25,'m-',1.5,s,H1);
% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h1_v = s1(deltaK(n));
[H1_v, ~] = TFTD(h1_v,n1);

%Graficos de las funciones obtenidas con los sistemas (programados en
%Matlab) :)
%stemCompleto([n(1) n(end) 0 1],'n','Amplitud','h1[n] Matlab',25,'m*-',1.5,n1,h1_v);
%plotComplejo([s(1) s(end) 0 1.5], [s(1) s(end) 0 1.5], [-1 1 -3 3],'Frecuencia "s" ','Módulo de la TFTD','H1(f)=TFTD{h1[n]}',25,'m-',1.5,s,H1_v);

cerrar_graficos;

y1=s1(x);
stemCompleto([n1(1) n1(end) (min(y1)-1) (max(y1)+1)],'n','Amplitud','Y1[n]',25,'m*-',1.5,n1,y1);
cerrar_graficos;
[Y1,~]=TFTD(y1,n1);
plotComplejo([-0.5 0.5 -80 110], [-0.5 0.5 0 110],[-0.5 0.5 -4 4], 'Frecuencia "s" ','Módulo de la TFTD','Gráfico de la TFTD',25,'m-',1.5,s,Y1);

