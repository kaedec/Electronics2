%Katelyn Charbonneau
%EE320 Homework 02 Problem 3

clear
clc

format shortEng
format compact

%% Circuit 1

Ad1 = 4.8409;
Acm1 = 817.5549e-3;

Ad1_dB = 20*log10(abs(Ad1))
Acm1_dB = 20*log10(abs(Acm1))
CMRR1 = 20*log10(Ad1/abs(Acm1))

%% Circuit 2

Ad2 = 5.1092;
Acm2 = 91.0809e-3;

Ad2_dB = 20*log10(abs(Ad2))
Acm2_dB = 20*log10(abs(Acm2))
CMRR2 = 20*log10(Ad2/abs(Acm2))

%% Circuit 3

Ad3 = 52.0012;
Acm3 = 13.9244e-3;

Ad3_dB = 20*log10(abs(Ad3))
Acm3_dB = 20*log10(abs(Acm3))
CMRR3 = 20*log10(Ad3/abs(Acm3))