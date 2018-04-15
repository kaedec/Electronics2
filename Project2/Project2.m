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
Vov = [Vov_first Vov_first Vov_first Vov_first
       Vov_first Vov_first Vov_first Vov_max];

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

W_real;
W = [44e-6 44e-6 20e-6 20e-6 88e-6 40e-6 88e-6 78e-6]