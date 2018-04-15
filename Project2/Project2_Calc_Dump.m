%Katelyn Charbonneau
%EE320 Project 2 Calc Dump

clear
clc

format shortEng
format compact

load("Constants.mat")
load("DCOpPoint.mat")

% This file has no output - it simply calculates likes like area,
% perimeter, high frequency capacitors, etc.

% Area/Perimeter
for i = 1:8
    AD(i) = 2.75 * L * W(i);%#ok<*SAGROW>
    AS(i) = 2.75 * L * W(i);
    PD(i) = W(i) + 2 * 2.75 * L;
    PS(i) = W(i) + 2 * 2.75 * L;
end

% Internal HF Caps
for i = 1:8
    if MOStype(i) == 0 %PMOS
        Cgs(i) = W(i) * L * Cox + W(i) * (Cgso_pmos + Cgbo_pmos);
        Cgd(i) = W(i) * Cgdo_pmos;
        AD_Den(i) = (1 + abs(VDB(i)) / Phi_B) ^ MJ_pmos;
        PD_Den(i) = (1 + abs(VDB(i)) / Phi_B) ^ MJSW_pmos;
        Cdb(i) = AD(i)*CJ_pmos/AD_Den(i) + PD(i)*CJSW_pmos/PD_Den(i);
    else
        Cgs(i) = W(i) * L * Cox + W(i) * (Cgso_nmos + Cgbo_nmos);
        Cgd(i) = W(i) * Cgdo_nmos;
        AD_Den(i) = (1 + abs(VDB(i)) / Phi_B) ^ MJ_nmos;
        PD_Den(i) = (1 + abs(VDB(i)) / Phi_B) ^ MJSW_nmos;
        Cdb(i) = AD(i)*CJ_nmos/AD_Den(i) + PD(i)*CJSW_nmos/PD_Den(i);
    end
end

Cgs;
Cgd;
Cdb;

C1 = Cgd(2) + Cdb(2) + Cgd(4) + Cdb(4) + Cgs(6);
C2 = Cdb(6) + Cdb(7) + Cgd(7) + CL;

% Save the variables - continued in Project2_FreqResponse.m
save("Calc_Dump.mat")