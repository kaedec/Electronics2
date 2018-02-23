%Katelyn Charbonneau
%EE320 Spring 2018 Project 1 Iteration 3

clear
clc

format shortEng
format compact

load("Constants.mat")

%% Gain Results in dB

Print_Header("Simulation Gain Results in dB")

Av1_sim = 187.0913;
Av2_sim = 0.8906;
Av_sim = 166.6144;

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

ID_sim = [51.21e-6  51.21e-6    171.4e-6	171.4e-6	47.6e-6];

ro_sim = 1./[Lambdan*ID_sim(1);
             Lambdap*ID_sim(2);
             Lambdap*ID_sim(3);
             Lambdap*ID_sim(4);
             Lambdap*ID_sim(5)];
         
for i = 1:5
    fprintf('ro%i = %i\n', i, ro_sim(i))
end