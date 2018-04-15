%Katelyn Charbonneau
%EE320 Project 2 Part 3

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Calc_Dump.mat")

%% Frequency response or someshit

Print_Header("fp and shit i think")

CC = 800e-15;

fp1 = (1) / (2 * pi / Go1 * Gm2 / Go2 * CC)

ft = (Gm1) / (2 * pi * CC)

fp2 = (Gm2) / (2 * pi * C2)

Rz = 1/Gm2
%Rz = 0

ft = fp2 * tand(43)

CC = (Gm1) / (2 * pi * ft)

SR = ID(5) / CC

fz = (Gm2) / (2 * pi * CC)

fz = (1) / (CC * (Rz - (1/Gm2)))

PM = 90 - atand(ft/fp2) - atand(ft/fz)