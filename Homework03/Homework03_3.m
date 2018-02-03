%Katelyn Charbonneau
%EE320 Homework 03 Problem 3

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
R = 20e3; G = 1/R;

%% DC Analysis - Q5 and Q6

Print_Header("Vov6 and ID6")

a = Kn*R; b = 1; c = Vtn - VDD - VSS;
Vov6 = VovQuad(a,b,c)

ID6 = Kn*Vov6^2
ID5 = ID6;

Print_Header("Equivalent Resistance")

ro5 = 1/(Lambdan*ID5)
go5 = 1/ro5;

%% DC Analysis - Q1 and Q2

Print_Header("ID and Vov")

ID = ID5/2
Vov = sqrt(ID/Kn)

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

GS = 1/(2*ro5);
Gmcm = (-gm*GS)/(gm+go+GS);
Goprime = (go*GS)/(gm+go+GS);
Gocm = Goprime+GD;
Rocm = 1/Gocm;

Acm = Gmcm*Rocm
Acm_dB = 20*log10(abs(Acm))

%% Common Mode Rejection Ratio

Print_Header("Common Mode Rejection Ratio")

CMRR = 20*log10(Ad/abs(Acm))