%Katelyn Charbonneau
%EE320 Project 2 Part 2

clear
clc

format shortEng
format compact

load("Constants.mat")
load("Part1.mat")

%% New Vovs and IDs

% Calculate new Vovs and IDs using the selected transistor widths
Print_Header("Recalculated Vovs/IDs:")

Vov(8) = sqrt((2 * ID(8) * L) / (kp * W(8)));

ID(7) = ID(8)*W(7)/W(8);
ID(5) = ID(8)*W(5)/W(8);
ID(6) = ID(7);
ID(1:4) = ID(5)/2;

ID

for i = 1:8
    if MOStype(i) == 0
        Vov(i) = sqrt((2 * ID(i) * L) / (kp * W(i)));
    else
        Vov(i) = sqrt((2 * ID(i) * L) / (kn * W(i)));
    end
end

Vov

%% Part 2 Differential and Common Mode Gains and CMRR

% Recalculate small-signal parameters
gm = zeros(1,8);
ro = zeros(1,8);

for i = 1:8
    if MOStype(i) == 0
        gm(i) = 2*ID(i)/abs(Vov(i));
        ro(i) = Vap/ID(i);
    else
        gm(i) = 2*ID(i)/Vov(i);
        ro(i) = Van/ID(i);
    end
end
go = 1./ro;

% Recalculate the gains
Print_Header("Differential Mode Gain")

Gm1 = gm(1);
Go1 = go(2) + go(4);
Gm2 = gm(6);
Go2 = go(6) + go(7);

Av = (Gm1 * Gm2) / (Go1 * Go2)
Av_dB = Convert_to_dB(Av)

Print_Header("Common Mode Gain")

RS = 2*ro(5);
GS = 1/RS;
Gmcm = (-gm(2)*GS)/(gm(2)+go(2)+GS);
Goprime = (go(2)*GS)/(gm(2)+go(2)+GS);

GDcm = gm(4) + go(4);

Gocm = Goprime+GDcm;
Rocm = 1/Gocm;

Acm = Gmcm*Rocm*Gm2/Go2
Acm_dB = 20*log10(abs(Acm))

Print_Header("CMRR")

CMRR = 20*log10(Av/abs(Acm))

% Save the variables - continued in Project2_DCOpPoint.m
save("Part2.mat")