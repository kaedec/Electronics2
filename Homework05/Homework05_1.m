%Katelyn Charbonneau
%EE320 Homework 05 Problem 1

clear
clc

format shortEng
format compact

syms R1 R2 R3 C1 L2
syms G1 G2 G3


% Tau10
G10 = G1+G2;
T10 = C1/G10;
pretty(simplify(T10))

% Tau20
G20 = (G1*G2+G1*G3+G2*G3)/(G1+G2);
T20 = L2*G20;
pretty(simplify(T20))

fprintf("b1 term:\n\n")
pretty(simplify(T10+T20))

%Tau21
G21 = G2 + G3;
T21 = L2*G21;

%Tau12

G12 = (G1*G2+G1*G3+G2*G3)/(G2+G3);
T12 = C1/G12;

fprintf("\nb2 term first case:\n\n")
pretty(simplify(T10*T21))
fprintf("\nb2 term second case:\n\n")
pretty(simplify(T20*T12))

%Tau10hat
G10hat = G1+G2;
T10hat = C1/G10hat;

%Tau20hat
G20hat = (G1*G2)/(G1+G2);
T20hat = L2*G20hat;

fprintf("\na1 term:\n\n")
pretty(simplify(T10hat + T20hat))

%Tau12hat
G12hat = G1;
T12hat = C1/G12hat;

fprintf("\na2 term:\n\n")
pretty(simplify(T20hat*T12hat))