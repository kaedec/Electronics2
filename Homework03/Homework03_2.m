%Katelyn Charbonneau
%EE320 Homework 03 Problem 2

clear
clc

format shortEng
format compact

%% Constant Declarations

Kn = 270e-6;
Vtn = 0.573;
Lambdan = 0.0165;
VDD = 7.5; mVSS = -7.5; VSS = 7.5;
VI1 = 0; VG1 = VI1;
VI2 = 0; VG2 = VI2;
RD = 18e3; GD = 1/RD;
RCS = 10e3; GCS = 1/RCS;

%% DC Analysis

Print_Header("VS")

a = 1; b = 2*Vtn-(GCS/(2*Kn)); c = Vtn^2+(mVSS*GCS/(2*Kn));
temp = ComplexQuad(a,b,c,1);
VS = temp(2)
VGS = -VS;

Print_Header("Vov and ID")

Vov = VGS - Vtn
ID = Kn*Vov^2

Print_Header("gm and ro")

gm = 2*ID/Vov
ro = 1/(Lambdan*ID)
go = 1/ro;

%% Differential Mode Analysis

Print_Header("Different Mode Gain")

Gmd = -gm;
God = go+GD;
Rod = 1/God;

Ad = -1/2*Gmd*Rod
Ad_dB = 20*log10(abs(Ad))

%% Common Mode Analysis

Print_Header("Common Mode Gain")

GS = 1/(2*RCS);
Gmcm = (-gm*GS)/(gm+go+GS);
Goprime = (go*GS)/(gm+go+GS);
Gocm = Goprime+GD;
Rocm = 1/Gocm;

Acm = Gmcm*Rocm
Acm_dB = 20*log10(abs(Acm))

%% Common Mode Rejection Ratio

Print_Header("Common Mode Rejection Ratio")

CMRR = 20*log10(Ad/abs(Acm))