%Katelyn Charbonneau
%EE320 Homework 01 Problem 2

clear
clc

format shortEng
format compact

%% Constant Declarations
VDD = 10;
Kn = 270e-6; VTn = 0.573; Lambdan = 0.0165;
Kp = 88e-6; VTp = -0.647; Lambdap = 0.0219;

%% Part A
ID = 500e-6;
Vovn = sqrt(ID/Kn);
Vovp = -sqrt(ID/Kp);

VG1 = VTn + Vovn;
VG2 = VTn + 2*Vovn;
VG3 = VDD - abs(VTp) - 2*abs(Vovp);
VG4 = VDD - abs(VTp) - abs(Vovp);

VS1 = 0;
VS4 = VDD;
VS2 = VG2-Vovn-VTn;

VD4 = VS4 - abs(Vovp);
VS3 = VD4;
VDS2 = Vovn;
VSD3 = Vovp;
VD2 = VDS2 + VS2
VD3 = VS3 + VSD3