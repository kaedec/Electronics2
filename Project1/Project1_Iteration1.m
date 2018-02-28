%Katelyn Charbonneau
%EE320 Spring 2018 Project 1 Iteration 1

clear
clc

format shortEng
format compact

%% Constant Declarations

load("Constants.mat")

%% Total Current

Print_Header("Total Available Current")

ITotal = PDC_Max/(VDD+VSS)

%% Initial Vov

Print_Header("Vov1 Max Value")

% This is the maximum that Vov1 can be before the gain drops below 100V/V
Vov1 = 1/(50*(Lambdan+Lambdap))

% This value is arbitrarily chosen as a number less than Vov1_Max
% Since this is the open loop gain, it is designed to be a bit above
%   the goal of 100V/V so there is leeway
% Its exact value will be determined later

Print_Header("Vov1 Initial Value")

Vov1 = 0.4

% We make an assumption that all Vovs are the same at this point
Vov2 = -Vov1; Vov3 = -Vov1; Vov4 = -Vov1; Vov5 = -Vov1;

Print_Header("Initial Gain")

% For now, the IDs will cancel, so their actual value is not needed
% These will get overwritten later
ID1 = 100e-6; ID2 = 100e-6;

gm1 = 2*ID1/Vov1;
go1 = Lambdan*ID1;
go2 = Lambdap*ID2;
GD1 = go2;
Go1 = go1 + GD1;

Gm1 = -gm1;

Av1 = -gm1/(go1+GD1)
Av1_dB = Convert_to_dB(Av1)

%% Q3 Analysis - Ro and ID3

Print_Header("ID3")

% The gain of this stage should be as close to 1 as possible
% Since the equation for the gain of this stage is gm3/(gm3+GL),
%   gm3 should be at least an order of magnitude larger than GL to
%   mitigate the effects of loading - but not so large that other
%   parameters fall out of the required specifications
gm3 = 15*GL;
ID3 = gm3*abs(Vov3)/2

Print_Header("Stage 2 Gain")

Av2 = gm3/(gm3+GL)
Av2_dB = Convert_to_dB(Av2)

%% Gain of Both Stages

Print_Header("Gain of Both Stages")

Av = Av1*Av2
Av_dB = Convert_to_dB(Av)

Print_Header("Difference between Avo and Av")

Gain_Delta = Av1_dB - Av_dB

%% Transistor Widths

Print_Header("W5 Exact and Rounded")
W5_Exact = ((100e-6)*L)/(kp*Vov5^2)
W5 = 58e-6

ID5 = 1/2*(kp)*(W5/L)*Vov5^2

%% Other Transistor Calculations

W2 = W5;
W1 = W5;
W3 = 200e-6;
W4 = 200e-6;

Print_Header("Other Currents")
ID2 = 1/2*(kp)*(W2/L)*Vov2^2
ID1 = ID2;
ID3 = 1/2*(kp)*(W3/L)*Vov3^2
ID4 = 1/2*(kp)*(W4/L)*Vov4^2

save("Iteration1.mat")

% Continued in Project1_Iteration2.m

%run("Project1_Iteration2.m")