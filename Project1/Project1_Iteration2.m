%Katelyn Charbonneau
%EE320 Spring 2018 Project 1 Iteration 2

clear
clc

format shortEng
format compact

load("Iteration1.mat")

%% Second Iteration Values

Print_Header("Second Iteration Vov Values")

Vov5 = sqrt((2*ID5)/(kp*(W5/L)))

Vov3 = sqrt((2*ID3)/(kp*(W3/L)))
Vov4 = sqrt((2*ID4)/(kp*(W4/L)))
Vov2 = sqrt((2*ID2)/(kp*(W2/L)))
Vov1 = sqrt((2*ID1)/(kn*(W1/L)))

Print_Header("Second Iteration Gain")

% Calculate the gains again with new IDs and Vovs

gm1 = 2*ID1/Vov1;
go1 = Lambdan*ID1;
go2 = Lambdap*ID2;
GD1 = go2;
Go1 = go1 + GD1;

Gm1 = -gm1;

Av1 = Gm1/Go1
Av1_dB = Convert_to_dB(Av1)

Print_Header("Stage 2 Gain")

gm3 = 2*ID3/Vov3;

Av2 = gm3/(gm3+GL)
Av2_dB = Convert_to_dB(Av2)

Print_Header("Gain of Both Stages")

Av = Av1*Av2
Av_dB = Convert_to_dB(Av)

Print_Header("Difference between Avo and Av")

Gain_Delta = Av1_dB - Av_dB

%% Power Calculations - Second Iteration

Print_Header("Power Consumption")

TotalCurrent = ID1+ID3+ID5
PowerConsumed = TotalCurrent*(VDD+VSS)

%% Resistor R Calculations

Print_Header("R Value")

R_Exact = (VDD+VSS-Vov5-abs(Vtp))/(ID5)
R = 78e3
G = 1/R;

save("Iteration2.mat")

% Continued in Project1_Iteration3.m

%run("Project1_Iteration3.m")