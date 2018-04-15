%Katelyn Charbonneau
%EE320 Project 2

clear
clc

format shortEng
format compact

load("Constants.mat")

%% Initial Guessing

Print_Header("Initial Vov Guesses")

Vov_max = (2) / (sqrt(Av_min) * (Lambda_nmos + Lambda_pmos))
Vov_first = 325e-3
Vov = [Vov_first Vov_first Vov_first Vov_first Vov_first Vov_first Vov_first Vov_max];

ID = [IREF/2 IREF/2 IREF/2 IREF/2 IREF IREF IREF IREF];

% Iteration 1 gain stuff

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

Print_Header("Iteration 1 Gain")

Gm1 = gm(1);
Go1 = go(2) + go(4);
Gm2 = gm(6);
Go2 = go(6) + go(7);

Av = (Gm1 * Gm2) / (Go1 * Go2)
Av_dB = Convert_to_dB(Av)

%% Transistor Widths
% Since we have "guessed" IDs and Vovs, now we can determine some
%  decent values for the transistor widths

Print_Header("Transistor Widths")

W_real = zeros(1, 8);
W = zeros(1, 8);

for i = 1:8
    if MOStype(i) == 0
        W_real(i) = (2 * ID(i) * L) / (kp * Vov(i)^2);
    else
        W_real(i) = (2 * ID(i) * L) / (kn * Vov(i)^2);
    end
end

W_real
W = [44e-6 44e-6 20e-6 20e-6 84e-6 40e-6 84e-6 78e-6]

Offset_check = W(6)*W(5)/W(4)/W(7)

%% Probably Part 2 later
Print_Header("Recalculated Vovs/currents:")

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

%% Part 2 Gain I think

Print_Header("Part 2 gain or something like that")

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

Print_Header("Iteration 2 Gain")

Gm1 = gm(1);
Go1 = go(2) + go(4);
Gm2 = gm(6);
Go2 = go(6) + go(7);

Av = (Gm1 * Gm2) / (Go1 * Go2)
Av_dB = Convert_to_dB(Av)

Print_Header("Common Mode Gain or something along those lines")

RS = 2*ro(5);
GS = 1/RS;
Gmcm = (-gm(2)*GS)/(gm(2)+go(2)+GS);
Goprime = (go(2)*GS)/(gm(2)+go(2)+GS);

GDcm = gm(4) + go(4);

Gocm = Goprime+GDcm;
Rocm = 1/Gocm;

Acm = Gmcm*Rocm*Gm2/Go2
Acm_dB = 20*log10(abs(Acm))

Print_Header("Piece of crap CMRR")

CMRR = 20*log10(Av/abs(Acm))

%% Frequency response or someshit

Print_Header("fp and shit i think")

CC = 100e-15;

fp1 = (1) / (2 * pi / Go1 * Gm2 / Go2 * CC)

ft = Av*fp1

okay next time i work on this i need to split it up into different files
and also calculate C1 and C2 or something idk what im doing but its sorta
working out so im just gonna keep ploughing forward until it works
or it all explodes into a fireball hot enough to melt a frozen over hell