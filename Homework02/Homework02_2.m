%Katelyn Charbonneau
%EE320 Homework 02 Problem 2

clear
clc

format shortEng
format compact

%% Constant Declarations

VTp = -0.8;
KpWL = 4e-3;
VG1 = 0; VG2 = 0;
I = 0.5e-3;
R = 4e3;
VDD = 2.5; mVSS = -2.5;

%% DC Values

fprintf('\n======= ID1 and ID2 =======\n')

ID1 = I/2
ID2 = I/2

fprintf('\n======= Vovd =======\n')

Vovd = sqrt(ID1/KpWL)

fprintf('\n======= VD1 and VD2 =======\n')

VD1 = ID1*R+mVSS
VD2 = ID2*R+mVSS

%% Common Mode Range

VSG = abs(VTp) + abs(Vovd);
VS = VSG;
VCS = VDD-VS;

VCM_Max = VDD - VCS - VSG
VCM_Min = VD1 - abs(VTp)

%% Differential Mode Range

VS = abs(VTp);
Vovd = sqrt(I/KpWL);
VID_Max = sqrt(2)*Vovd
VID_Min = -sqrt(2)*Vovd