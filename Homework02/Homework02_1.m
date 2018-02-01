%Katelyn Charbonneau
%EE320 Homework 02 Problem 1

clear
clc

format shortEng
format compact

%% Constant Declarations

VCC = 10;
vo = 5;
VT = 25.8e-3;
CB = 0.1e-6;
R = 15e3; RL = 10e6; RB = 100e3;
G = 1/R; GL = 1/RL; GB = 1/RB;
Betafn = 225; VAn = 74.03;
Betafp = 120; VAp = -18.7;
VE1 = 0; VE2 = VCC; VE3 = VCC;
VC1 = 5; VC2 = 5;

%% DC Values

fprintf('\n======= IC3 and VB3/2 =======\n')

VB3 = VCC - 0.7;
VB2 = VB3
VC3 = VB3;
IR = VB3/R;
IC3 = IR/(1+2/Betafp)
IC2 = IC3;
IC1 = IC2;

fprintf('\n======= IB2 =======\n')

IB3 = IC3/Betafp;
IB2 = IB3

fprintf('\n======= VBB =======\n')

IB1 = IC1/Betafn
VB1 = 0.7;
VBB = IB1*RB+VB1

%fprintf('\n======= Small Signal Characteristics =======\n')

gm1 = IC1/VT;
gm2 = IC2/VT;
gm3 = IC3/VT;

ro1 = abs(VAn)/IC1; go1 = 1/ro1;
ro2 = abs(VAp)/IC2; go2 = 1/ro2;
ro3 = abs(VAp)/IC3; go3 = 1/ro3;

rpi1 = VT/IB1; gpi1 = 1/rpi1;
rpi2 = VT/IB2; gpi2 = 1/rpi2;
rpi3 = VT/IB3; gpi3 = 1/rpi3;

%fprintf('\n======= Leftovers =======\n')

VBE1 = VB1 - VE1;
VBE2 = VB2 - VE2;
VBE3 = VB3 - VE3;

VCE1 = VC1 - VE1;
VCE2 = VC2 - VE2;
VCE3 = VC3 - VE3;

IE1 = IC1 + IB1;
IE2 = IC2 + IB2;
IE3 = IC3 + IB3;

%% AC Values

fprintf('\n======= Gain Av =======\n')

Av = (-gm1)/(GL+go1+go2)
Avdb = 20*log10(abs(Av))

fprintf('\n======= Rin and Ro =======\n')

Gin = gpi1 + GB;
Rin = 1/Gin

Go = go1+go2;
Ro = 1/Go