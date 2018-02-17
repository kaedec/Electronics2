VDD = 2.5; VSS = 2.5; mVSS = -2.5;
VO = 0;
RL = 10e3; GL = 1/RL; CB = 0.1e-6;
L = 2e-6; % Transistor length
Lambdan = 1.6208e-2; Lambdap = 2.724e-2;
Vtn = 0.796; Vtp = -0.8078;
kn = 49.9078e-6; kp = 21.5705e-6;
PDC_Max = 1.5e-3;

save("Constants.mat")