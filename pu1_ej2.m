%%PU1 EJERCICIO 2
addpath(genpath('.'));
clc; close all; clearvars;

%%
[n,h]= hcanald(726176);
stemCompleto([n(1) n(end) -1.5 1.5],'n','Amplitud','Respuesta impulsional del sistema',25,'m*-',1.5,n,h);
h_v=sis_eco(deltaK(n));
Le
%% Sonido
[x,fs]=audioread('audio.wav');
t=0:length(x)-1;
plotCompleto([0 60845 -1 1],'t','Amplitud','Sonido (entrada)',20,'r-',1.5,t, x);

y=sis_eco(x);
sound(y, fs);
plotCompleto([0 60845 -1 1],'t','Amplitud','Sonido procesado (salida)',20,'r-',1.5,t, y);

y2=sis_2ramas(y);
plotCompleto([0 60845 -1 1],'t','Amplitud','2 ramas de retardo',20,'r-',1.5,t, y2);

y3=sis_3ramas(y);
plotCompleto([0 60845 -1 1],'t','Amplitud','3 ramas de retardo',20,'r-',1.5,t, y3);








audiowrite('./audios/nuevo_audio3.wav', y3, fs);
audiowrite('./audios/nuevo_audio2.wav', y2, fs);
audiowrite('./audios/nuevo_audio_eco.wav', y, fs);
