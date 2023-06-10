%%PU1 EJERCICIO 2
addpath(genpath('.'));
clc; close all; clearvars;

%% hcanald
[n,h]= hcanald(726176);
stemCompleto([n(1) n(end) -1.5 1.5],'n','Amplitud','Respuesta impulsional del sistema',25,'r-',1.5,n,h);
h_v=sis_eco(deltaK(n));

%% Sonido
[x,fs]=audioread('audio.wav');
t=0:length(x)-1;

y=sis_eco(x);
plotDoble([0 60845 -1 1], [0 60845 -1 1], 'n', 'Amplitud', "Audio original", "Audio procesado", 20, 'r-', 1.5, t, x, t, y)
%%sound(y, fs);

%% Dos ramas de retardo

h_f2=sis_2ramas(deltaK(t));
stemCompleto([0 60845 -1 1],'t','Amplitud','h_{f2}',20,'r-',1.5,t, h_f2);

y2=sis_2ramas(y);
plotCompleto([0 60845 -1 1],'t','Amplitud','2 ramas de retardo',20,'r-',1.5,t, y2);
%%sound(y2, fs);

%% Tres ramas de retardo
h_f3=sis_3ramas(deltaK(t));
stemCompleto([0 60845 -1 1],'t','Amplitud','h_{f3}',20,'r-',1.5,t, h_f3);

y3=sis_3ramas(y);
plotCompleto([0 60845 -1 1],'t','Amplitud','3 ramas de retardo',20,'r-',1.5,t, y3);
%%sound(y3, fs);







%audiowrite('./audios/nuevo_audio3.wav', y3, fs);
%audiowrite('./audios/nuevo_audio2.wav', y2, fs);
%audiowrite('./audios/nuevo_audio_eco.wav', y, fs);
