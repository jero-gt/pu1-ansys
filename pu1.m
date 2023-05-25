%TP UTILITARIO 1
addpath('./funciones');
addpath('./sistemas');
clc; close all; clearvars;


%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Señal de entrada x[n]',25,'m*-',1.5,n,x);
%cerrar_graficos;

[X, s] = TFTD(x, n);
plotComplejo([-0.5 0.5 -80 110], [-0.5 0.5 0 110], [-0.5 0.5 -4 4], 's', "X",25,'m-',1.5,s,X);
%cerrar_graficos;

%% ECUACION EN DIFERENCIAS 1
% y[n]= (1/2)*x[n] + (1/2)*x[n-1]
n1=0:101; %Eje coordenado x para la ecuacion en diferencias 1

%Respuesta impulsional al sistema
h1=(1/2)*deltaK(n1) + (1/2)*deltaK(n1-1);
stemCompleto([n(1) n(end) 0 1],'n','Amplitud', 'h1n analitica', 25, 'm*-',1.5, n1, h1);

H1 = 0.5*(1 + exp(-1i*2*pi*s));
plotComplejo([s(1) s(end) 0 1.5],[s(1) s(end) 0 1.5] ,[-1 1 -3 3],'s','H1 analitica',25,'m-',1.5,s,H1);
%cerrar_graficos;

% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h1_v = s1(deltaK(n));
[H1_v, ~] = TFTD(h1_v,n1);


y1=s1(x);
stemCompleto([n1(1) n1(end) (min(y1)-1) (max(y1)+1)],'n','Amplitud','y1[n]',25,'m*-',1.5,n1,y1);
%cerrar_graficos;
[Y1,~]=TFTD(y1,n1);
plotComplejo([-0.5 0.5 -80 110], [-0.5 0.5 0 110],[-0.5 0.5 -4 4], "s",'Y1(f)',25,'m-',1.5,s,Y1);
%cerrar_graficos;


%% ECUACION EN DIFERENCIAS 2
% y[n]= (1/2)*x[n] - (1/2)*x[n-1]

%Respuesta impulsional al sistema
h2=(1/2)*deltaK(n1) - (1/2)*deltaK(n1-1);
stemCompleto([n(1) n(end) -1 1],'n','Amplitud', 'h2[n]', 25, 'm*-',1.5, n1, h2);

H2 = 0.5*(1 - exp(-1i*2*pi*s));
plotComplejo([-0.5 0.5 -1 1],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H2(e^j2pis)',25,'m-',1.5,s,H2);
%cerrar_graficos;

% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h2_v = s2(deltaK(n));
[H2_v, ~] = TFTD(h2_v,n1);


y2=s2(x);
stemCompleto([n1(1) n1(end) (min(y2)-1) (max(y2)+1)],'n','Amplitud','y2[n]',25,'m*-',1.5,n1,y2);
%cerrar_graficos;
[Y2,~]=TFTD(y2,n1);
plotComplejo([-0.5 0.5 -11 11], [-0.5 0.5 0 11],[-0.5 0.5 -4 4], "s",'Y2(f)',25,'m-',1.5,s,Y2);
%cerrar_graficos;

disp(isequal(h2,h2_v));
disp(isequal(H2,H2_v));


