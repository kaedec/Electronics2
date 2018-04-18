% This file calculates the frequency response of the amplifier, both with
% Rz != 0 and with Rz = 0

%Katelyn Charbonneau
%EE320 Project 2 Part 3

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Calc_Dump.mat")

%% Frequency Response

Print_Header("Selecting value for CC")

% ft must be at least 30MHz
ft_min = 30e6;

CC_max = (Gm1) / (2 * pi * ft_min)
CC = 800e-15

Print_Header("fp1, ft, and fp2")

fp1 = (1) / (2 * pi / Go1 * Gm2 / Go2 * CC)

ft = (Gm1) / (2 * pi * CC)

fp2 = (Gm2) / (2 * pi * C2)

Print_Header("Slew Rate")

SR = 2 * pi * Vov(1) * ft

Print_Header("Rz and fz Rz != 0")

Rz = 1/(1.0*Gm2)

fz = (1) / (CC * (Rz - (1/Gm2)))

Print_Header("Phase Margin Rz != 0")

PM = 90 - atand(ft/fp2) - atand(ft/fz)

Print_Header("Rz and fz Rz = 0")

Rz0 = 0

fz0 = (1) / (CC * (Rz0 - (1/Gm2)))

Print_Header("Phase Margin Rz = 0")

PM0 = 90 - atand(ft/fp2) - atand(ft/fz0)

% Save the variables - loaded in Project2.m
save("FreqResponse.mat")