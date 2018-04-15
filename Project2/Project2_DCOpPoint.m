%Katelyn Charbonneau
%EE320 Project 2 DC Operating Point

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Part2.mat")

% This file calculates the DC Operating Point of the circuit

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


VD
VS
VG
VGS
VDS
VDB = VDS;
% Save the variables - continued in Project2_Calc_Dump.m
save("DCOpPoint.mat")