clear
clc

VDD = 2.5;
VSS = 2.5;
mVSS = -2.5;
VO = 0;
MOStype = [0 0 1 1 0 1 0 0]; % 1 is nmos

IREF = 50e-6;
PDC_Max = 0.8e-3;
ITotal = PDC_Max/5;

Av_min_dB = 85;
Av_min = 10^(Av_min_dB/20);

Lambda_nmos = 1.6208e-2;
Lambda_pmos = 2.724e-2;

Van = 1/Lambda_nmos;
Vap = 1/Lambda_pmos;

Vtn = 0.796;
Vtp = -0.8078;

kn = 49.9078e-6;
kp = 21.5705e-6;

L = 2e-6;

CL = 1.5e-12;

Cox = 804.9262;

Cgbo_nmos = 382.75;
Cgbo_pmos = 405.4;

Cgdo_nmos = 301.85;
Cgdo_pmos = 301.85;

Cgso_nmos = 301.85;
Cgso_pmos = 301.85;

MJ_nmos = 0.6306;
MJ_pmos = 0.5353;

MJSW_nmos = 0.315;
MJSW_pmos = 0.253;

CJ_nmos = 101.59;
CJ_pmos = 238.37;

CJSW_nmos = 474.4;
CJSW_pmos = 276;

Phi_B = 0.8;

save("Constants.mat")