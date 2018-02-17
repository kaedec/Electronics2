%Katelyn Charbonneau
%EE320 Spring 2018 Project 1 Iteration 3

clear
clc

format shortEng
format compact

load("Constants.mat")

%% Gain Results in dB

Print_Header("Simulation Gain Results in dB")

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

%% ro Results

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