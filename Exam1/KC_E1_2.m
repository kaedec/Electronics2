% Katelyn Charbonneau
% EE320 Spring 2018 Exam 1 Problem 2

clear all
clc

format compact
format shortEng

%% Constant Declarations

gm1 = 375e-6; gm2 = 375e-6;
gm3 = 650e-6; gm4 = 650e-6;
gm5 = 30000e-6; gm6 = 30000e-6;

go1 = 8.5e-6; go2 = 8.5e-6;
go3 = 6.25e-6; go4 = 6.25e-6;
go5 = 30.5e-6; go6 = 30.5e-6;

ro1 = 117.65e3; ro2 = 117.65e3;
ro3 = 160e3; ro4 = 160e3;
ro5 = 32.787e3; ro6 = 32.787e3;

gpi5 = 400e-6; gpi6 = 400e-6;
rpi5 = 2.5e3; rpi6 = 2.5e3;

%% Differential Mode Calculations

God = go2 + go4;
Rod = 1/God;
Gmd = gm2;

Ad = Gmd*Rod
Ad_dB = 20*log10(abs(Ad))

%% Common Mode Calculations

RD2 = ro4; GD2 = go4;

Rin5 = ro5;
RS2 = 2*Rin5;
GS2 = 1/RS2;

Goprime = (go2 * GS2) / (gm2 + go2 + GS2);
Gocm = Goprime + GD2;
Rocm = 1/Gocm;

Gmcm = (-gm2 * GS2) / (gm2 + go2 + GS2);

Acm = Gmcm*Rocm
Acm_dB = 20*log10(abs(Acm))

CMRR = 20*log10(Ad/abs(Acm))