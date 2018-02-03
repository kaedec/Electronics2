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