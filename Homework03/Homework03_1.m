%Katelyn Charbonneau
%EE320 Homework 03 Problem 1

clear
clc

format shortEng
format compact

%% Constant Declarations

R = 20e3; G = 1/R;
VDD = 7.5; VSS = 7.5; mVSS = -7.5;
Kn = 265e-6; Kp = 97.5e-6;
Vtn = 0.65; Vtp = -0.65;
VAn = 65; Lambdan = 1/VAn;
VAp = -45; Lambdap = 1/VAp;

VS6 = VDD; VS3 = VDD; VS4 = VDD;
VS7 = mVSS; VS5A = mVSS; VS5B = mVSS;
VI1 = 0; VI2 = 0;

%% DC Analysis

Print_Header("Vov7/6 and ID7/6")

a = Kn*R; b = 2; c = 2*Vtn-VDD-VSS;
Vov7 = VovQuad(a,b,c)
ID7 = Kn*Vov7^2
Vov6 = -Vov7
ID6 = Kn*Vov6^2

Print_Header("Q7/6 Terminal Voltages")

VG7 = Vtn + Vov7 + mVSS
VG6 = VDD - abs(Vtp) - abs(Vov6)

Print_Header("Q1/2 Terminal Voltages/Vov")

ID1 = ID7; ID2 = ID7;
Vov1 = sqrt(ID1/Kn)
VS1 = -Vtn-Vov1
Vov2 = Vov1; VS2 = VS1;

Print_Header("gm and ro/go")

gm1 = 2*ID1/Vov1
ro1 = VAn/ID1
go1 = 1/ro1

Print_Header("RD and RS")

ro3 = ro1;
ro4 = ro1;
ro2 = ro1;
go2 = 1/ro2;
gm2 = gm1;
RD = ro4
GD = 1/RD;
ro5a = ro1; ro5b = ro1;
go5a = 1/ro5a; go5b = 1/ro5b;
GS = go5a+go5b;
RS = 1/GS

%% Superposition Method

Print_Header("Superposition")
Print_Header("Ap")

GinS2 = (GD * (gm2 + go2)) / (go2 + GD);
GS1 = GinS2 + GS;

Gm1 = (gm1*GD)/(go1+GD);

Go1prime = (GD * (gm1 + go1)) / (go1 + GD);
Go1 = Go1prime + GS1;
Ro1 = 1/Go1;

Gm2 = gm2 + go2;
Go2 = go2 + GD;
Ro2 = 1/Go2;

Ap = Gm1*Ro1*Gm2*Ro2
Ap_dB = 20*log10(abs(Ap))

Print_Header("An")

GinS1 = (GD * (gm1 + go1)) / (go1 + GD);
GS2 = GS + GinS1;

Gm3 = (-gm2 * GS2) / (gm2 + go2 + GS2);

Go3prime = (go2 * GS2) / (gm2 + go2 + GS2);
Go3 = Go3prime + GD;
Ro3 = 1/Go3;

An = Gm3*Ro3
An_dB = 20*log10(abs(An))

Print_Header("Ad")

Ad_Superposition = 1/2*(Ap-An)
Ad_Superposition_dB = Convert_to_dB(Ad_Superposition)

Print_Header("Acm")

Acm_Superposition = Ap+An
Acm_Superposition_dB = Convert_to_dB(Acm_Superposition)

Print_Header("CMRR")

CMRR_Superposition = Convert_to_dB(Ad_Superposition/abs(Acm_Superposition))

%% Half-Circuit Method

Print_Header("Half-Circuit")
Print_Header("Ad")

Gmd = -gm2;
God = go2+GD;
Rod = 1/God;

Ad_HalfCircuit = -Gmd*Rod/2
Ad_HalfCircuit_dB = Convert_to_dB(Ad_HalfCircuit)

Print_Header("Acm")

RS2 = 2*RS;
GS2 = 1/RS2;

Gmcm = (-gm2 * GS2) / (gm2 + go2 + GS2);

Goprimecm = (go2 * GS2) / (gm2 + go2 + GS2);
Gocm = Goprimecm + GD;
Rocm = 1/Gocm;

Acm_HalfCircuit = Gmcm*Rocm
Acm_HalfCircuit_dB = Convert_to_dB(Acm_HalfCircuit)

Print_Header("CMRR")

CMRR_HalfCircuit = Convert_to_dB(Ad_HalfCircuit/abs(Acm_HalfCircuit))