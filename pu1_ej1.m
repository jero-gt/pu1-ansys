%TP UTILITARIO 1
addpath(genpath('.'));
clc; close all; clearvars;

%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Senal de entrada x[n]',18,'ro-',2.5,n,x);

[X, s] = TFTD(x, n); %TFTD de la señal de entrada.
plot_MF([-0.5 0.5 0 110], [-0.5 0.5 -4 4], 's', "X(e^{j2\pis})",18,'r-',2,s,X);

%% ECUACION EN DIFERENCIAS 1: 
%y[n]= (1/2)*x[n] + (1/2)*x[n-1]

%Respuesta impulsional al sistema:
h1=(1/2)*deltaK(n) + (1/2)*deltaK(n-1); %rta. impulsional al sistema 1.
h1_v = s1(deltaK(n));
stemCompleto([n(1) 5 -0.5 1],'n','Amplitud', 'h1[n]', 18, 'bo-', 1.5, n, h1);

%Respuesta en frecuencia del sistema:
H1 = 0.5*(1 + exp(-1i*2*pi*s)); %TFTD analatica de h1.
[H1_v, ~] = TFTD(h1_v,n); % Verificamos que coincida la rta en frec. analatica y la de los sistemas.
plot_comp_MF([-0.5 0.5 0 1.5], [-0.5 0.5 -4 4], 's', "H1(e^{j2\pis})",18,3.5,s,H1, H1_v);


%Señal de salida.
y1=s1(x);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','y_1[n]',18,'bo-',1.5,n,y1);

%TFTD de la señal de salida.
[Y1,~]=TFTD(y1,n);
plot_MF( [-0.5 0.5 0 110],[-0.5 0.5 -4 4], "s",'Y_1(e^{j2\pis})',18,'b-',2,s,Y1);


%% ECUACION EN DIFERENCIAS 2: y[n]= (1/2)*x[n] - (1/2)*x[n-1]

%Respuesta impulsional al sistema:
h2=(1/2)*deltaK(n) - (1/2)*deltaK(n-1);
h2_v = s2(deltaK(n));
stemCompleto([n(1) 5 -1 1],'n','Amplitud', 'h_2[n]', 18, 'bo-',1.5, n, h2);

%Respuesta en frecuencia del sistema:
H2 = 0.5*(1 - exp(-1i*2*pi*s));
[H2_v, ~] = TFTD(h2_v,n); % Verificamos que coincida la rta en frec. analatica y la de los sistemas.
plot_comp_MF([-0.5 0.5 0 1.5], [-0.5 0.5 -4 4], 's', "H_2(e^{j2\pis})",18,3.5,s,H2, H2_v);

%Señal de salida.
y2=s2(x);
stemCompleto([n(1) n(end) -0.4 0.4],'n','Amplitud','y_2[n]',18,'bo-',1.5,n,y2);

%TFTD de la señal de salida.
[Y2,~]=TFTD(y2,n);
plot_MF( [-0.5 0.5 0 11],[-0.5 0.5 -4 4], "s",'Y_2(e^{j2\pis})',18,'b-',2,s,Y2);

%% ECUACION EN DIFERENCIAS 3: y[n]=(1/4)*x[n] + (1/4)*x[n-1] + (1/2)*y[n-1]

%Respuesta impulsional al sistema:
h3= 1/4 * ( (1/2).^n .* escalon(n) + (1/2).^(n-1) .* escalon(n-1) );
h3_v=s3(deltaK(n));
stemCompleto([n(1) 10 -0.5 1],'n','Amplitud', 'h_3[n]', 18, 'b-',1.5, n, h3);

%Respuesta en frecuencia del sistema:
H3 = 1/4*(1 + exp(-1i*2*pi.*s)) ./ (1 - (1/2)*exp(-1i*2*pi*s));
[H3_v, ~] = TFTD(h3_v,n);
plot_comp_MF([-0.5 0.5 0 1.5], [-0.5 0.5 -4 4], 's', "H3(e^{j2\pis})",18,3.5,s,H3, H3_v);

%Señal de salida.
y3=s3(x);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','y_3[n]',18,'bo-',1.5,n,y3);

%TFTD de la señal de salida.
[Y3,~]=TFTD(y3,n);
plot_MF([-0.5 0.5 0 max(abs(Y3))],[-0.5 0.5 -4 4], "s",'Y_3(e^{j2\pis})',18,'b-',2,s,Y3);

%% ECUACION EN DIFERENCIAS 4
%y[n]=(1/4)*x[n] - (1/4)*x[n-1] - (1/2)*y[n-1]

%Respuesta impulsional al sistema:
h4= 1/4 * ( (-1/2).^n .* escalon(n) - (-1/2).^(n-1) .* escalon(n-1) );
h4_v=s4(deltaK(n));
stemCompleto([n(1) 10 -0.5 0.5],'n','Amplitud', 'h_4[n]', 18, 'bo-',1.5, n, h4);


%Respuesta en frecuencia del sistema:
H4 = 1/4*(1 - exp(-1i*2*pi.*s)) ./ (1 + (1/2)*exp(-1i*2*pi*s));
[H4_v, ~] = TFTD(h4_v,n);
plot_comp_MF([-0.5 0.5 0 1.5], [-0.5 0.5 -4 4], 's', "H4(e^{j2\pis})",18,3.5,s,H4, H4_v);


%Señal de salida.
y4=s4(x);
stemCompleto([n(1) n(end) -0.3 0.3],'n','Amplitud','y_4[n]',18,'bo-',1.5,n,y4);

%TFTD de la señal de salida.
[Y4,~]=TFTD(y4,n);
plot_MF([-0.5 0.5 0 max(abs(Y4))],[-0.5 0.5 -4 4], "s",'Y_4(e^{j2\pis})',18,'b-',2,s,Y4);
