%Katelyn Charbonneau
%EE320 Spring 2018 Project 1 Iteration 3

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Iteration2.mat")

%% Third Iterations

a = R*kp*(W5/L)/2;
b = 1;
c = -VDD-VSS+abs(Vtp);

Vov5 = VovQuad(a,b,c)
ID5 = kp*(W5/L)/2*Vov5^2

%% Other Current and Vov Values
% Because W5 = W1 = W2, the branches will have the same current

Print_Header("ID1/2 and Vov1/2")

ID1 = ID5
ID2 = ID5

Vov1 = sqrt((2*ID1)/(kn*(W1/L)))
Vov2 = sqrt((2*ID2)/(kp*(W2/L)))

% Use the Ratio of W3/4 : W5

Print_Header("ID3/4 and Vov3/4")

WidthRatio = W3/W5;

Vov4 = Vov2
ID4 = kp*(W4/L)/2*Vov4^2

ID3 = ID4

Vov3 = sqrt((2*ID3)/(kp*(W3/L)))


%% Power Calculations - Third Iteration

Print_Header("Power Consumption - Third Iteration")

TotalCurrent = ID1+ID3+ID5
PowerConsumed = TotalCurrent*(VDD+VSS)

Print_Header("Third Iteration Gain")

%% Calculate the gains again with new IDs and Vovs

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

%% Output Resistance

Print_Header("Ro")

go4 = Lambdap*ID4; go3 = Lambdap*ID3;
ro4 = 1/go4; ro3 = 1/go3;

R2 = ro4; G2 = 1/R2;
G1 = gm3 + go3; R1 = 1/G1;

Go = G1 + G2;
Ro = 1/Go

%% Summary for Cadence

Print_Header("Summary of Information for Cadence")
Print_Header("Transistor Widths in µm")

Transistor_Widths_Microns = [W1*10e5; W2*10e5; W3*10e5; W4*10e5; W5*10e5];

for i = 1:5
    fprintf('Q%i = %i\n', i, Transistor_Widths_Microns(i))
end

Print_Header("Resistor R in kilo ohms")

fprintf('R = %i\n', R/1000)

%% Summary
Print_Header("Summary of Results and Other Information")
Print_Header("Gain Information in dB")

fprintf('Av1      = %f\n', Av1_dB)
fprintf('Av2      = %f\n', Av2_dB)
fprintf('Av       = %f\n', Av_dB)
fprintf('|Avo-Av| = %f\n', Gain_Delta)

Print_Header("DC VI Component in V")

VS1 = mVSS;
VG1 = Vov1 + VS1 + Vtn; VI = VG1;

fprintf('VI = %f\n', VI)

%% Leftover DC Voltages and Small Signal Parameters

Print_Header("Leftover Values")

VG5 = VDD - abs(Vov5) - abs(Vtp)

VG3 = 0 - abs(Vov3) - abs(Vtp)

gm_calc = [gm1;
           2*ID2/Vov2;
           gm3;
           2*ID4/Vov4;
           2*ID5/Vov5]

go_calc = [go1;
           go2;
           go3;
           go4;
           Lambdap*ID5];

ro_calc = 1./go_calc