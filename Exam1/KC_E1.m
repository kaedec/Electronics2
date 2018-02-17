% Katelyn Charbonneau
% EE320 Spring 2018 Exam 1 Problem 1

clear all
clc

format compact
format shortEng

%% Constant Declarations

VCC = 5; VEE = 5; mVEE = -5;
R = 12e3; G = 1/R;
Betafp = 75;
Kn = 270e-6; Kp = 88e-6;
VEB = 0.65;
Vtn = 0.573; Vtp = -0.647;
VG1 = 0.5; VG2 = 0.5;

%% DC Analysis - Q5 and Q6

IC6 = ((VCC+VEE-VEB)/R) / (1+(2/Betafp))
IB6 = IC6/Betafp
IE6 = IC6+IB6

Ir = IC6+2*IB6;
VC6 = Ir*R

IC5 = IC6;
I = IC5;


%% DC Analysis - Q1 - Q4

ID1 = I/2
ID2 = I/2; ID3 = I/2; ID4 = I/2;

Vov1 = sqrt(Kp/ID1)
Vov2 = sqrt(Kp/ID2);
Vov3 = sqrt(Kn/ID3)
Vov4 = sqrt(Kn/ID4);

VS3 = mVEE;

VG3 = Vtn + Vov3 + VS3

VGS3 = VG3 - VS3

VS1 = VG1 - abs(Vtp) - abs(Vov1)
VGS1 = VG1 - VS1
VD1 = VG3;
VDS1 = VD1 - VS1

VC5 = VS1;
VCE5 = VC5 - VCC