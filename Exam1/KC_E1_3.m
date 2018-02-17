% Katelyn Charbonneau
% EE320 Spring 2018 Exam 1 Problem 3

clear all
clc

format compact
format shortEng

Ad = 20.9008;
Acm = -0.7557;

Ad_dB = 20*log10(abs(Ad))
Acm_dB = 20*log10(abs(Acm))

CMRR = 20*log10(Ad/abs(Acm))