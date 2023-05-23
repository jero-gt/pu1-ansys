%TP UTILITARIO 1
addpath('./Funciones');
clc; clear variables;
%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,x);

%Transformamos a la señal de entrada
ds = 0.001; s = [-1:ds:1]; X = zeros(size(s));
for i = 1:length(s)
X(i)=sum(x.*exp(-1i*2*pi*s(i)*n));
end

plotComplejo([s(1) s(end) 0 110],'Frecuencia "s" ','Módulo de la TFTD','Gráfico de la TFTD',25,'m-',1.5,s,X);

%% ECUACION EN DIFERENCIAS 1
% y[n]= (1/2)*x[n] + (1/2)*x[n-1]
n1=1:102; %Eje coordenado x para la ecuacion en diferencias 1
y1(1)= (1/2)*x(1);
for i=2:length(x)
    y1(i)=(1/2)*x(i) + (1/2)*x(i-1);
end
y1(length(x)+1)= (1/2)*x(length(x));

%Respuesta impulsional al sistema
h1=(1/2)*deltaK(n) + (1/2)*deltaK(n-1);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,h1);

