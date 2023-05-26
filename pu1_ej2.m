%%PU1 EJERCICIO 2
addpath(genpath('.'));
clc; close all; clearvars;
%%
[n,h]= hcanald(726176);
stemCompleto([n(1) n(end) -1.5 1.5],'n','Amplitud','Señal de entrada x[n]',25,'m*-',1.5,n,h);
h_v=sis_eco(deltaK(n));
[x,fs]=audioread('audio.wav');
y=sis_eco(x);
aux=1:length(y);
plotCompleto([0 60845 -1 1],'t','Amplitud','Salida del sistema',20,'r-',1.5,aux, y);
plot(y);
sound(y,fs);


