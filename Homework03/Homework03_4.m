%Katelyn Charbonneau
%EE320 Homework 03 Problem 4

clear
clc

format shortEng
format compact

%% Constant Declarations

Kn = 270e-6; Kp = 88e-6;
Vtn = 0.573; Vtp = -0.647;
Lambdan = 0.0165; Lambdap = 0.0219;
VDD = 7.5; mVSS = -7.5; VSS = 7.5;
VI1 = 0; VG1 = VI1;
VI2 = 0; VG2 = VI2;
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

%% DC Analysis - Q3 and Q4

Print_Header("ID3/4 and Vov3/4")

ID3 = ID5/2;
ID4 = ID5/2
Vov3 = sqrt(ID3/Kp);
Vov4 = sqrt(ID4/Kp)

Print_Header("ro3 and ro4")

ro3 = 1/(Lambdap*ID3)
go3 = 1/ro3;

ro4 = 1/(Lambdap*ID4)
go4 = 1/ro4;

RD = ro3
GD = 1/RD;

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