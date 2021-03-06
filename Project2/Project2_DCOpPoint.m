% This file calculates the DC operating point of the amplifier.  This
% includes node voltages, drain to source voltages, and gate to source
% voltages for each transistor.  It also calculates the amount of power
% consumed by the amplifier, the minimum and maximum common source input
% voltages, and the allowable output swing

%Katelyn Charbonneau
%EE320 Project 2 DC Operating Point

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Part2.mat")

%% DC Operating Point

VS(3:4) = mVSS; VS(6) = mVSS;
VS(5) = VDD; VS(7:8) = VDD;
VD(6:7) = 0;

for i = 1:8
    if MOStype(i) == 0 %PMOS
        VGS(i) = -(abs(Vtp) + abs(Vov(i))); %#ok<*SAGROW>
    else
        VGS(i) = Vtn + Vov(i);
    end
end

VG(3) = VGS(3) + VS(3);
VG(8) = VGS(8) + VS(8);
VD(3) = VG(3);
VD(8) = VG(8);

VG(5) = VG(8); VG(7) = VG(8);

VG(6) = VGS(6) + VS(6);

VD(4) = VG(6);
VD(2) = VG(6);

VS(2) = -(VGS(2) - VG(2));
VS(1) = VS(2);
VD(5) = VS(2);
VD(1) = VG(3);
VG(4) = VG(3);

for i = 1:8
    VDS(i) = VD(i) - VS(i);
end

Print_Header("Voltages")

VD
VS
VG
VGS
VDS
VDB = VDS;

Print_Header("Power")

ITotal = ID(8) + ID(5) + ID(6)
PDC = ITotal * 5

Print_Header("Vicm Max/Min")

Vicm_max = VDD - abs(Vov(5)) - abs(Vtp) - abs(Vov(1))
Vicm_min = mVSS + Vtn + Vov(3) - abs(Vtp)

Print_Header("vO Max/Min")

vO_max = VDD - abs(Vov(7))
vO_min = mVSS + Vov(6)

% Save the variables - continued in Project2_Calc_Dump.m
save("DCOpPoint.mat")