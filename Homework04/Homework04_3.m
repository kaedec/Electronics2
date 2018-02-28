%Katelyn Charbonneau
%EE320 Homework 04 Problem 3

clear
clc

format shortEng
format compact

syms R1 R2 R3 C1 C2
syms G1 G2 G3

%G1 = 1/R1; G2 = 1/R2; G3 = 1/R3;


% Tau10
G10 = (G2*G3)/(G2+G3) + G1;
T10 = C1/G10;
%pretty(simplify(T10))

% Tau20
G20 = (G1*G2)/(G1+G2) + G3;
T20 = C2/G20;
%pretty(simplify(T20))

fprintf("b1 term:\n\n")

pretty(simplify(T10+T20))

%Tau21
G21 = G2 + G3;
T21 = C2/G21;

%Tau12

G12 = G1 + G2;
T12 = C1/G12;

fprintf("\n\nb2 term:\n\n")
pretty(simplify(T10*T21))

pretty(simplify(T20*T12))

%Tau10hat
G10hat = G1;
T10hat = C1/G10hat;

%Tau20hat
G20hat = (G1*G2)/(G1+G2);
T20hat = C2/G20hat;

fprintf("\n\na1 term:\n\n")
pretty(simplify(T20hat))

%Tau12hat
G12hat = G1 + G2;
T12hat = C1/G12hat;

fprintf("\n\na2 term:\n\n")
pretty(simplify(T20hat*T12hat))