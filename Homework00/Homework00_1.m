%Katelyn Charbonneau
%EE320 Homework 00 Question 1

%Constant declarations

clear all
clc

VDD = 10; vo = 5;
CB = 0.1e-6;
R = 15e3; RL = 10e6; RG = 10e6;
G = 1/R; GL = 1/RL; GG = 1/RG;
Kn = 270e-6; VTn = 0.573; Lambdan = 0.0165;
Kp = 88e-6; VTp = -0.647; Lambdap = 0.0219;

%Part A
Vov3 = VovQuad(R*Kp, 1, abs(VTp)-VDD);
ID3 = Kp*Vov3^2;
VG3 = ID3*R;
VG2 = VG3;

VSG2 = VDD-ID3*R;
Vov2 = VSG2 - abs(VTp);
ID2 = Kp*abs(Vov2)^2;

ID1 = ID2;
Vov1 = sqrt(ID1/Kn);
VSG1 = Vov1+VTn;

VGS3 = VG3-VDD