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
stemCompleto([n1(1) n1(end) 0 1],'n','Amplitud', 'h1[n]', 25, 'm*-',1.5, n1, h1);

H1 = 0.5*(1 + exp(-1i*2*pi*s));
plotComplejo([-0.5 0.5 0 1.5],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H1(e^{j2\pis})',25,'m-',1.5,s,H1);
%cerrar_graficos;

% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h1_v = s1(deltaK(n));
[H1_v, ~] = TFTD(h1_v,n1);


y1=s1(x);
stemCompleto([n1(1) n1(end) (min(y1)-1) (max(y1)+1)],'n','Amplitud','y_1[n]',25,'m*-',1.5,n1,y1);
%cerrar_graficos;
[Y1,~]=TFTD(y1,n1);
plotComplejo([-0.5 0.5 -80 110], [-0.5 0.5 0 110],[-0.5 0.5 -4 4], "s",'Y_1(e^{j2\pis})',25,'m-',1.5,s,Y1);
%cerrar_graficos;


%% ECUACION EN DIFERENCIAS 2
% y[n]= (1/2)*x[n] - (1/2)*x[n-1]

%Respuesta impulsional al sistema
h2=(1/2)*deltaK(n1) - (1/2)*deltaK(n1-1);
stemCompleto([n1(1) n1(end) -1 1],'n','Amplitud', 'h_2[n]', 25, 'm*-',1.5, n1, h2);

H2 = 0.5*(1 - exp(-1i*2*pi*s));
plotComplejo([-0.5 0.5 -1 1],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H_2(e^{j2\pis})',25,'m-',1.5,s,H2);
%cerrar_graficos;

% Verificamos que coincida la rta imp. analatica y la de los sistemas.
h2_v = s2(deltaK(n));
[H2_v, ~] = TFTD(h2_v,n1);


y2=s2(x);
stemCompleto([n1(1) n1(end) (min(y2)-1) (max(y2)+1)],'n','Amplitud','y_2[n]',25,'m*-',1.5,n1,y2);
%cerrar_graficos;
[Y2,~]=TFTD(y2,n1);
plotComplejo([-0.5 0.5 -11 11], [-0.5 0.5 0 11],[-0.5 0.5 -4 4], "s",'Y_2(e^{j2\pis})',25,'m-',1.5,s,Y2);
%cerrar_graficos;

disp(isequal(h2,h2_v));
disp(isequal(H2,H2_v));

%% ECUACION EN DIFERENCIAS 3
%y[n]=(1/4)*x[n] + (1/4)*x[n-1] + (1/2)*y[n-1]

h3=(1/4)*deltaK(n1) + 3*((1/2).^(n1+2)).*escalon(n1-1);
stemCompleto([n1(1) n1(end) -1 1],'n','Amplitud', 'h_3[n]', 25, 'm*-',1.5, n1, h3);

H3 = 1/4*ones(1,length(s)) + (3/8)*(exp(-1i*2*pi.*s)./(1-(1/2)*exp(-1i*2*pi*s)));
plotComplejo([-0.5 0.5 -1 1],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H_3(e^{j2\pis})',25,'m-',1.5,s,H3);

h3_v=s3(deltaK(n));
[H3_v, ~] = TFTD(h3_v,n1);

y3=s3(x);
stemCompleto([n1(1) n1(end) (min(y3)-1) (max(y3)+1)],'n','Amplitud','y_3[n]',25,'m*-',1.5,n1,y3);
% %cerrar_graficos;
[Y3,~]=TFTD(y3,n1);
plotComplejo([-0.5 0.5 -80 100], [-0.5 0.5 0 max(abs(Y3))],[-0.5 0.5 -4 4], "s",'Y_3(e^{j2\pis})',25,'m-',1.5,s,Y3);
% %cerrar_graficos;

%% ECUACION EN DIFERENCIAS 4
%y[n]=(1/4)*x[n] - (1/4)*x[n-1] - (1/2)*y[n-1]

h4=(1/4)*deltaK(n1) + (3/8)*exp(1i*2*pi*(n1/2)).*(1/2).^(n1-1).*escalon(n1-1);
stemCompleto([n1(1) n1(end) -1 1],'n','Amplitud', 'h_4[n]', 25, 'm*-',1.5, n1, h4);

H4 = 1/4*ones(1,length(s)) + (3/8)*(exp(-1i*2*pi*(s-1/2))./(1-(1/2)*exp(-1i*2*pi*(s-1/2))));
plotComplejo([-0.5 0.5 -1 1],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H_4(e^{j2\pis})',25,'m-',1.5,s,H4);


h4_v=s4(deltaK(n));
[H4_v, ~] = TFTD(h4_v,n1);
plotComplejo([-0.5 0.5 -1 1],[-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H_4v(e^{j2\pis})',25,'m-',1.5,s,H4_v);

y4=s4(x);
stemCompleto([n1(1) n1(end) (min(y4)-1) (max(y4)+1)],'n','Amplitud','y_4[n]',25,'m*-',1.5,n1,y4);
% %cerrar_graficos;
[Y4,~]=TFTD(y4,n1);
plotComplejo([-0.5 0.5 -80 100], [-0.5 0.5 0 max(abs(Y4))],[-0.5 0.5 -4 4], "s",'Y_4(e^{j2\pis})',25,'m-',1.5,s,Y4);
% %cerrar_graficos;
