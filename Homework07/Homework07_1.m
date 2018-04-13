%Katelyn Charbonneau
%EE320 Homework 07 Question 1

clear
clc

format shortEng
format compact

%% Constant declarations
VDD = 1.5; VSS = 1.5; mVSS = -VSS;
IREF = 225e-6;
kn = 180e-6; kp = 60e-6;
Vtn = 0.75; Vtp = 0.75;
Van = 9; Vap = 9;
Lamdan = 1/Van; Lamdap = 1/Vap;

W1 = 30e-6; W2 = 30e-6; W3 = 10e-6; W4 = 10e-6;
W5 = 60e-6; W7 = 60e-6; W8 = 60e-6;
L = 0.5e-6;

WL1 = W1/L; WL2 = W2/L; WL3 = W3/L; WL4 = W4/L;
WL5 = W5/L; WL7 = W7/L; WL8 = W8/L;

MOStype = [0 0 1 1 0 1 0 0]; % 1 is NMOS

%% (a)
Print_Header("W6")

W6 = (2*WL7*WL4*L) / (WL5)
WL6 = W6/L;

W = [W1 W2 W3 W4 W5 W6 W7 W8];

%% (b)

Print_Header("DC Currents")

ID = [IREF/2 IREF/2 IREF/2 IREF/2 IREF IREF IREF IREF]

Print_Header("Vovs")

for i = 1:8
    if MOStype(i) == 0
        VOV(i) = sqrt((2*ID(i)*L)/(kp*W(i)));
        VGS(i) = -(abs(Vtp)+abs(VOV(i)));
    else
        VOV(i) = sqrt((2*ID(i)*L)/(kn*W(i)));
        VGS(i) = Vtn+VOV(i);
    end
end
VOV

Print_Header("VGSs")

VGS

Print_Header("gm and ro")
for i = 1:8
    if MOStype(i) == 0
        gm(i) = 2*ID(i)/abs(VOV(i));
        ro(i) = Vap/ID(i);
    else
        gm(i) = 2*ID(i)/VOV(i);
        ro(i) = Van/ID(i);
    end
end
go = 1./ro;

gm

ro

%% (c)

% Stage 2 Gain

Print_Header("Stage 2 Gain")

Go2 = go(6)+go(7);
Ro2 = 1/Go2;
Gm2 = -gm(6);
Av2 = Gm2*Ro2
Av2_dB = Convert_to_dB(Av2)

% Stage 1 Gain

Print_Header("Stage 1 Differential Mode Gain")

Gmd = gm(2);
Rod = 1/(go(2)+go(4));
Ad = Gmd*Rod
Ad_dB = 20*log10(abs(Ad))

Print_Header("Stage 2 Differential Mode Gain")

RS2 = 2*ro(5);
GS2 = 1/RS2;
RD2 = gm(4) + gm(3);
GD2 = 1/RD2;

Gocm_prime = (go(2) + GS2) / (gm(2) + go(2) + GS2);
Gocm = Gocm_prime + GD2;
Rocm = 1/Gocm;
Gmcm = -(gm(2) + GS2) / (gm(2) + go(2) + GS2);

Acm = Gmcm*Rocm
Acm_dB = Convert_to_dB(Acm)

Print_Header("CMRR of just stage 1")
CMRR = 20*log10(Ad/abs(Acm))

Print_Header("Full gain Av")
Av_differential = Ad*Av2
Av_differential_dB = Convert_to_dB(Av_differential)

Av_common = Acm*Av2
Av_common_dB = Convert_to_dB(Av_common)

Print_Header("CMRR of both stages")
CMRR = 20*log10(abs(Av_differential)/abs(Av_common))
CMRR = Av_differential_dB - Av_common_dB