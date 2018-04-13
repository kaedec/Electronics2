%Katelyn Charbonneau
%EE320 Homework 05 Problem 2

clear
clc

format shortEng
format compact

syms go1 go2 go3 go4 go5 ro1 ro2 ro3 ro4 ro5 R RL
syms C1 C2 C3 C4 C5


% Tau10
fprintf("Tau10:\n\n")
G10 = inf;
T10 = C1/G10;
pretty(simplify(T10))

% Tau20
fprintf("\nTau20:\n\n")
G20 = go1+go2;
T20 = C2/G20;
pretty(simplify(T20))

% Tau30
fprintf("\nTau30:\n\n")
G30 = go1+go2;
T30 = C3/G30;
pretty(simplify(T30))

% Tau40
fprintf("\nTau40:\n\n")
G40 = go3+go4;
T40 = C4/G40;
pretty(simplify(T40))

% Tau50
fprintf("\nTau50:\n\n")
G50 = go3+go4;
T50 = C5/G50;
pretty(simplify(T50))

%b1
fprintf("\nb1 term:\n\n")
b1 = T10 + T20 + T30 + T40 + T50;
pretty(simplify(b1))

%wH
pretty(simplify(1/(((C2+C3)*(go3+go4) + (C4+C5)*(go1+go2))/((go1+go2)*(go3+go4)))))