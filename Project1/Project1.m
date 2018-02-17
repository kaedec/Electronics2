%Katelyn Charbonneau
%EE320 Spring 2018 Project 1

clear
clc

format shortEng
format compact

%% Constant Declarations

VDD = 2.5; VSS = 2.5; mVSS = -2.5;
VO = 0;
RL = 10e3; GL = 1/RL; CB = 0.1e-6;
L = 2e-6; % Transistor length
Lambdan = 1.6208e-2; Lambdap = 2.724e-2;
Vtn = 0.796; Vtp = -0.8078;
kn = 49.9078e-6; kp = 21.5705e-6;
PDC_Max = 1.5e-3;

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
Go1 = go1 + GD1; %#ok<*NASGU>

Gm1 = -gm1;

Av1 = -gm1/(go1+GD1)
Av1_dB = Convert_to_dB(Av1)

%% Q3 Analysis - Ro and ID3

Print_Header("ID3")

% What even is this value? I just guess & checked for value of gm3
% The equations werent really working out for whatever reason...
gm3 = 10*GL;
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

R_Exact = (VDD+VSS-Vov5)/(ID5)
R = 92e3
G = 1/R;

%% Third Iterations

a = R*kp*(W5/L)/2;
b = 1;
c = -VDD-VSS;

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

R2 = ro4; G2 = go4; G2 = 1/R2;
G1 = gm3 + go3; R1 = 1/G1;

Go = G1 + G2;
Ro = 1/Go

%% Leftover DC Voltages and Small Signal Parameters

%Print_Header("Leftover Values")

VG5 = VDD - abs(Vov5) - abs(Vtp);

VG3 = 0 - abs(Vov3) - abs(Vtp);

gm_calc = [gm1;
           2*ID2/Vov2;
           gm3;
           2*ID4/Vov4;
           2*ID5/Vov5];

go_calc = [go1;
           go2;
           go3;
           go4;
           Lambdap*ID5];

ro_calc = 1./go_calc;

%% Summary for Cadence

Print_Header("Summary of Information for Cadence")
Print_Header("Transistor Widths in µm")

Transistor_Widths_Microns = [W1*10e5; W2*10e5; W3*10e5; W4*10e5; W5*10e5];

for i = 1:5
    fprintf('Q%i = %i\n', i, Transistor_Widths_Microns(i))
end

Print_Header("Resistor R in kilo ohms")

fprintf('R = %i\n', R/1000)

Print_Header("Gain Information in dB")

fprintf('Av1      = %f\n', Av1_dB)
fprintf('Av2      = %f\n', Av2_dB)
fprintf('Av       = %f\n', Av_dB)
fprintf('|Avo-Av| = %f\n', Gain_Delta)

Print_Header("DC VI Component in V")

%Vov1 = VGS1 - Vtn
%Vov1 = VG1 - VS1 - Vtn
%VG1 = Vov1 + VS1 + Vtn
VS1 = mVSS;
VG1 = Vov1 + VS1 + Vtn; VI = VG1;

fprintf('VI = %f\n', VI)

%% Simulation Results

Print_Header("Simulation Gain Results")

Av1_sim = 201.33;
Av2_sim = 0.8850;
Av_sim = 178.19;

Av1_sim_dB = Convert_to_dB(Av1_sim);
Av2_sim_dB = Convert_to_dB(Av2_sim);
Av_sim_dB = Convert_to_dB(Av_sim);

Gain_Delta_sim = Av1_sim_dB - Av_sim_dB;

fprintf('Av1      = %f\n', Av1_sim_dB)
fprintf('Av2      = %f\n', Av2_sim_dB)
fprintf('Av       = %f\n', Av_sim_dB)
fprintf('|Avo-Av| = %f\n', Gain_Delta_sim)

Print_Header("Simulation ro")

ID_sim = [44.17e-6	44.17e-6	147.9e-6	147.9e-6	41.66e-6];

ro_sim = 1./[Lambdan*ID_sim(1);
             Lambdap*ID_sim(2);
             Lambdap*ID_sim(3);
             Lambdap*ID_sim(4);
             Lambdap*ID_sim(5)];
         
for i = 1:5
    fprintf('ro%i = %i\n', i, ro_sim(i))
end