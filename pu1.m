clear, clc, close all, clearvars;
addpath("./funciones");
addpath("./sistemas");
%% SEÑAL DE ENTRADA
[n,x]=senial(736456);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,x);

%Transformamos a la señal de entrada
ds = 0.001; s = [-1:ds:1]; X = zeros(size(s));
for i = 1:length(s)
X(i)=sum(x.*exp(-1i*2*pi*s(i)*n));
end

plotComplejo([s(1) s(end) 0 110],'Frecuencia s','Modulo de la TFTD','Gráfico de la TFTD',25,'m-',1.5,s,X);

%% ECUACION EN DIFERENCIAS 1
% y[n]= (1/2)*x[n] + (1/2)*x[n-1]
y1 = s1(@(n) deltaK(n),n);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,y1);



y3 = s3(@(n) deltaK(n),n);
stemCompleto([n(1) n(end) -0.5 2.5],'n','Amplitud','Gráfico de la SVIC',25,'m*-',1.5,n,y3);
