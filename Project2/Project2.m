% Run this file to run everything and spit out all the data.  Its not
% really readable, but this is just for putting the data into Excel so its
% actually readable
% Order that the files execute in:
%   Project2_Part1.m
%   Project2_Part2.m
%   Project2_DCOpPoint.m
%   Project2_Calc_Dump.m
%   Project2_FreqResponse.m

%Katelyn Charbonneau
%EE320 Project 2

format shortEng
format compact

load("Constants.mat")

run Project2_Part1.m
run Project2_Part2.m
run Project2_DCOpPoint.m
run Project2_Calc_Dump.m
run Project2_FreqResponse.m

clear
clc

load("FreqResponse.mat")

Table_1 = [W.*10^6
    W./L
    AD.*10^12
    PD.*10^6
    ID.*10^6
    abs(Vov).*10^3
    VGS
    VDS
    VG
    VD
    VS
    gm.*10^6
    go.*10^6
    ro.*10^-3
    Cgs.*10^15
    Cgd.*10^15
    Cdb.*10^15
    ]

Table_2 = [Rz*10^-3
    CC*10^15
    ]

Table_3 = [Av*10^-3
    Av_dB
    Acm*10^3
    Acm_dB
    CMRR
    Vicm_max
    Vicm_min
    vO_max
    vO_min
    PDC
    ]

Table_4 = [fp1*10^-3
    fp2*10^-6
    fz0*10^-6
    ft*10^-6
    PM0
    ]

Table_5 = [
    SR*10^-6
    ]

Table_6 = [fp1*10^-3
    fp2*10^-6
    fz*10^-6
    ft*10^-6
    PM
    ]