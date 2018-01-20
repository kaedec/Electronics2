%Katelyn Charbonneau
%EE320 Homework 00 Question 1

clear all
clc

format shortEng
format compact

%% Constant declarations
VDD = 10; vo = 5;
CB = 0.1e-6;
R = 15e3; RL = 10e6; RG = 10e6;
G = 1/R; GL = 1/RL; GG = 1/RG;
Kn = 270e-6; VTn = 0.573; Lambdan = 0.0165;
Kp = 88e-6; VTp = -0.647; Lambdap = 0.0219;

sim_VGS1 = 1.873; sim_ID1 = 494.1e-6;
sim_VGS2 = -2.897; sim_ID2 = 494.1e-6;
sim_VGS3 = -2.897; sim_ID3 = 473.6e-6;

%% Part A
%DC Values 
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

VGS3 = VG3-VDD;

gm1 = 2*ID1/Vov1;
gm2 = 2*ID2/Vov2;
gm3 = 2*ID3/Vov3;

ro1 = 1/(Lambdan*ID1);
ro2 = 1/(Lambdap*ID2);
ro3 = 1/(Lambdap*ID3);

go1 = 1/ro1;
go2 = 1/ro2;
go3 = 1/ro3;

VD1 = 5;
VD2 = 5;
VD3 = 7.0431;

VDS1 = VD1 - 0;
VDS2 = VD2 - VDD;
VDS3 = VD3 - VDD;

%% Part B
%AC Values
Av = -gm1/(GL+go1+go2);
Avdb = 20*log10(abs(Av));

Ro = 1/(go1+go2);

%% Part C
%Simulation Values
sim_Av = -43.7199;
sim_Avdb = 20*log10(abs(sim_Av));

sim_Vov1 = sim_VGS1 - abs(VTn);
sim_Vov2 = -sim_VGS2 - abs(VTp);
sim_Vov3 = -sim_VGS3 - abs(VTp);

sim_ro1 = 1/(Lambdan*sim_ID1);
sim_ro2 = 1/(Lambdap*sim_ID2);
sim_ro3 = 1/(Lambdap*sim_ID3);

sim_go1 = 1/sim_ro1;
sim_go2 = 1/sim_ro2;
sim_go3 = 1/sim_ro3;