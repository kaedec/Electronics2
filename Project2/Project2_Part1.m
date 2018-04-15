%Katelyn Charbonneau
%EE320 Project 2 Part 1

clear
clc

format shortEng
format compact

load("Constants.mat")

%% Initial Guessing

Print_Header("Initial Vov Guesses")

% Assuming Ad = Av2 or is about = to Av2, this is our Vov_max for the
% relevant transistors.  Our first Vov guess should be a bit below this
% value and a bit above the minimum specification to allow for some wiggle
% room
Vov_max = (2) / (sqrt(Av_min) * (Lambda_nmos + Lambda_pmos))
Vov_fg = 325e-3 %fg = first guess
Vov = [Vov_fg Vov_fg Vov_fg Vov_fg Vov_fg Vov_fg Vov_fg Vov_max];

% For now, set ID5 and ID7 to IREF (same as ID8)
ID = [IREF/2 IREF/2 IREF/2 IREF/2 IREF IREF IREF IREF];

% Calculate the small-signal parameters with these guessed values
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

% Calculate the (differential mode) gain with these guessed values
Print_Header("Iteration 1 Gain")

Gm1 = gm(1);
Go1 = go(2) + go(4);
Gm2 = gm(6);
Go2 = go(6) + go(7);

Av = (Gm1 * Gm2) / (Go1 * Go2)
Av_dB = Convert_to_dB(Av)

%% Transistor Widths
% Since we have guessed IDs and Vovs, now we can determine some decent
% values for the transistor widths

Print_Header("Transistor Widths")

W_real = zeros(1, 8);

for i = 1:8
    if MOStype(i) == 0
        W_real(i) = (2 * ID(i) * L) / (kp * Vov(i)^2);
    else
        W_real(i) = (2 * ID(i) * L) / (kn * Vov(i)^2);
    end
end

% We have to round off the width values; also, see below for the
% Offset_check value - W6/W4 = 2W7/W5 (so this value should be 2)
W_real
W = [44e-6 44e-6 20e-6 20e-6 84e-6 40e-6 84e-6 78e-6]

Offset_check = W(6)*W(5)/W(4)/W(7)

% Save the variables - continued in Project2_Part2.m
save("Part1.mat")