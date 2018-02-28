%Katelyn Charbonneau
%EE320 Homework 04 Problem 1

clear
clc

format shortEng
format compact

%% Constant Declarations

Kn = 270e-6; Kp = 88e-6;
Vtn = 0.573; Vtp = -0.647;
Lambdan = 0.0165; Lambdap = 0.0219;
VDD = 10; vO = 5;
CB = 1e-6;
R = 15e3; G = 1/R;
RL = 10e6; GL = 1/RL;
RG = 10e6; GG = 1/RG;

%% DC analysis

Print_Header("Vov5 and ID5")

a = R*Kp;
b = 1;
c = abs(Vtp)-VDD;

Vov5 = VovQuad(a,b,c)

ID5 = Kp*Vov5^2

Print_Header("Vov1/2 and ID1/2")

ID2 = ID5; ID1 = ID2;
Vov2 = sqrt(ID2/Kp)
Vov1 = sqrt(ID1/Kn)

Print_Header("Vov3/4 and ID4/4")

ID4 = 2*ID5; ID3 = ID4
Vov4 = Vov5;
Vov3 = sqrt(ID5/(2*Kp))

Print_Header("VG5/3/1")

VG5 = VDD - abs(Vov5) - abs(Vtp)
VG3 = 5 - abs(Vov3) - abs(Vtp)
VG1 = Vov1 + Vtn

Print_Header("gm and ro/go")

gm = [2*ID1/Vov1;
      2*ID2/Vov2;
      2*ID3/Vov3;
      2*ID4/Vov4;
      2*ID5/Vov5]

go = [Lambdan*ID1;
      Lambdap*ID2;
      Lambdap*ID3;
      Lambdap*ID4;
      Lambdap*ID5];

ro = 1./go

%% AC Analysis

Print_Header("Av1")

GD1 = go(2);
Av1 = -gm(1)/(go(1)+go(2))
Av1_dB = Convert_to_dB(Av1)

Print_Header("Av2")
Av2 = gm(3)/(gm(3)+go(3)+go(4)+GL)
Av2_dB = Convert_to_dB(Av2)

Print_Header("Av")
Av = Av1*Av2
Av_dB = Convert_to_dB(Av)

Print_Header("Av1-Av")
Gain_Delta = Av1_dB-Av_dB

Print_Header("Ro")
Go = gm(3)+go(3)+go(4);
Ro = 1/Go