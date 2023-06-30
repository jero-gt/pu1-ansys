%TP UTILITARIO 1
addpath(genpath('.'));
clc; close all; clearvars;

%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Señal de entrada x[n]',25,'mo-',1.5,n,x);

[X, s] = TFTD(x, n); %TFTD de la señal de entrada.
mod_fase([-0.5 0.5 0 110], [-0.5 0.5 -4 4], 's', "X(e^{j2\pis})",25,'m-',1.5,s,X);

%% ECUACION EN DIFERENCIAS 1: y[n]= (1/2)*x[n] + (1/2)*x[n-1]
%n=0:length(n); %Agregamos un valor mas, para tener en cuenta posibles adelantos en las ecuaciones en diferencias.

h1=(1/2)*deltaK(n) + (1/2)*deltaK(n-1); %rta. impulsional al sistema 1.
h1_v = s1(deltaK(n));

stemCompleto([n(1) 5 -0.5 1],'n','Amplitud', 'h1[n]', 25, 'mo-',3, n, h1);

H1 = 0.5*(1 + exp(-1i*2*pi*s)); %TFTD analatica de h1.
[H1_v, ~] = TFTD(h1_v,n); % Verificamos que coincida la rta en frec. analatica y la de los sistemas.

isequal_mod_fase([-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H1(e^{j2\pis})',25,'m-',1.5, s, H1, H1_v);
isequal(H1, H1_v)


y1=s1(x); %Procesamos la señal de entrada con el sistema s1.
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','y_1[n]',25,'mo-',1.5,n,y1);

[Y1,~]=TFTD(y1,n);
%mod_fase([-0.5 0.5 -80 110], [-0.5 0.5 0 110],[-0.5 0.5 -4 4], "s",'Y_1(e^{j2\pis})',25,'m-',1.5,s,Y1);
mod_fase( [-0.5 0.5 0 110],[-0.5 0.5 -4 4], "s",'Y_1(e^{j2\pis})',25,'m-',1.5,s,Y1);


%% ECUACION EN DIFERENCIAS 2: y[n]= (1/2)*x[n] - (1/2)*x[n-1]

%Respuesta impulsional al sistema
h2=(1/2)*deltaK(n) - (1/2)*deltaK(n-1);
h2_v = s2(deltaK(n));
stemCompleto([n(1) 5 -1 1],'n','Amplitud', 'h_2[n]', 25, 'mo-',1.5, n, h2);

H2 = 0.5*(1 - exp(-1i*2*pi*s));
[H2_v, ~] = TFTD(h2_v,n); % Verificamos que coincida la rta en frec. analatica y la de los sistemas.

isequal_mod_fase([-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H2(e^{j2\pis})',25,'m-',1.5, s, H2, H2_v);
isequal(H2, H2_v)


y2=s2(x);
stemCompleto([n(1) n(end) -0.3 0.3],'n','Amplitud','y_2[n]',25,'mo-',1.5,n,y2);

[Y2,~]=TFTD(y2,n);
mod_fase( [-0.5 0.5 0 11],[-0.5 0.5 -4 4], "s",'Y_2(e^{j2\pis})',25,'m-',1.5,s,Y2);

%% ECUACION EN DIFERENCIAS 3: y[n]=(1/4)*x[n] + (1/4)*x[n-1] + (1/2)*y[n-1]
%Ahora trabajamos con uns sistema IIR, por lo que la rta impulsional será infinta.
%Definimos un nuevo vector n que tome valores mas allá de 100 (el largo de n)

h3= 1/4 * ( (1/2).^n .* escalon(n) + (1/2).^(n-1) .* escalon(n-1) );
stemCompleto([n(1) 10 -0.5 1],'n','Amplitud', 'h_3[n]', 25, 'm-',1.5, n, h3);
h3_v=s3(deltaK(n));


H3 = 1/4*(1 + exp(-1i*2*pi.*s)) ./ (1 - (1/2)*exp(-1i*2*pi*s));
[H3_v, ~] = TFTD(h3_v,n);

isequal_mod_fase([-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H3(e^{j2\pis})',25,'m-',1.5, s, H3, H3_v);
isequal(H3, H3_v)
error = (H3 - H3_v)./H3 .*100;figure();stem(s,error,'filled');


y3=s3(x);
stemCompleto([n(1) n(end) (min(y3)-1) (max(y3)+1)],'n','Amplitud','y_3[n]',25,'mo-',1.5,n,y3);

[Y3,~]=TFTD(y3,n);
mod_fase([-0.5 0.5 0 max(abs(Y3))],[-0.5 0.5 -4 4], "s",'Y_3(e^{j2\pis})',25,'m-',1.5,s,Y3);

%% ECUACION EN DIFERENCIAS 4
%y[n]=(1/4)*x[n] - (1/4)*x[n-1] - (1/2)*y[n-1]

h4= 1/4 * ( (-1/2).^n .* escalon(n) - (-1/2).^(n-1) .* escalon(n-1) );
h4_v=s4(deltaK(n));
stemCompleto([n(1) 10 -0.5 0.5],'n','Amplitud', 'h_4[n]', 25, 'mo-',1.5, n, h4);


H4 = 1/4*(1 - exp(-1i*2*pi.*s)) ./ (1 + (1/2)*exp(-1i*2*pi*s));
[H4_v, ~] = TFTD(h4_v,n);
isequal_mod_fase([-0.5 0.5 0 1.5] ,[-0.5 0.5 -3 3],'s','H4(e^{j2\pis})',25,'m-',1.5, s, H4, H4_v);
isequal(H4, H4_v)
error = (angle(H4) - angle(H4_v))./angle(H4) .*100;figure();stem(s,error,'filled');

error = (abs(H4) - abs(H4_v))./abs(H4) .*100;figure();stem(s,error,'filled');


y4=s4(x);
stemCompleto([n(1) n(end) (min(y4)-1) (max(y4)+1)],'n','Amplitud','y_4[n]',25,'mo-',1.5,n,y4);

[Y4,~]=TFTD(y4,n);
mod_fase([-0.5 0.5 0 max(abs(Y4))],[-0.5 0.5 -4 4], "s",'Y_4(e^{j2\pis})',25,'m-',1.5,s,Y4);
