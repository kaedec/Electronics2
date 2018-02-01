%Katelyn Charbonneau
%EE320 Homework 01 Problem 2

clear
clc

format shortEng
format compact

%% Constant Declarations
VDD = 10;
Kn = 270e-6; VTn = 0.573; Lambdan = 0.0165;
Kp = 88e-6; VTp = -0.647; Lambdap = 0.0219;
VS1 = 0;
VS4 = VDD;
ID = 500e-6;

sim_ID1 = 507.5e-06; sim_ID2 = 507.5e-06;
sim_ID3 = 507.5e-06; sim_ID4 = 507.5e-06;
sim_VGS1 = 1.9478;
sim_VGS2 = 2.134;
sim_VGS3 = -3.425;
sim_VGS4 = -3.031;

%% Part A
% DC Values
Vovn = sqrt(ID/Kn);
Vovp = -sqrt(ID/Kp);

VG1 = VTn + Vovn + VS1;
VS2 = Vovn;
VG2 = VTn + Vovn + VS2;
VG4 = VS4 - abs(VTp) - abs(Vovp);
VS3 = VDD - abs(Vovp);
VG3 = VS3 - abs(VTp) - abs(Vovp);

VS1 = 0;
VS4 = VDD;
VS2 = VG2-Vovn-VTn;

VD4 = VS4 - abs(Vovp);
VS3 = VD4;
VDS2 = Vovn;
VSD3 = Vovp;
VD2 = VDS2 + VS2;
VD3 = VS3 + VSD3;
VDS2 = VD2 - VS2;
VDS3 = VD3 - VS3;
VGS2 = VG2 - VS2;
VGS3 = VG3 - VS3;
VGS4 = VG4 - VS4;

gm = [2*ID/Vovn, 2*ID/Vovn, 2*ID/abs(Vovp), 2*ID/abs(Vovp)];
go = [Lambdan*ID, Lambdan*ID, Lambdap*ID, Lambdap*ID];
ro = 1./go;
%% Part B
% AC Values
Rin4 = ro(4);
Gin4 = 1/Rin4;

Rin3 = (gm(3)+go(3)+go(4))/(go(4)*go(3));
Gin3 = 1/Rin3;

Gin2 = (Gin3*(gm(2)+go(2)))/(Gin3+go(2));
Rin2 = 1/Gin2;

Gm1 = -gm(1);
Go1 = go(1)+Gin2;

Gm2 = gm(2)+go(2);
Go2 = go(2)+Gin3;

Ro1 = 1/Go1; Ro2 = 1/Go2;

Avo = Gm1*Ro1*Gm2*Ro2;
Avodb = 20*log10(abs(Avo));

% For calculating Ro
Gin3_Ro = Gin3;
Rin2_Ro = (gm(2)+go(2)+go(1))/(go(1)*go(2));
Gin2_Ro = 1/Rin2_Ro;

Go = Gin3_Ro + Gin2_Ro;
Ro = 1/Go;

%% Part C
% Simulation Values
sim_Av = -1485.5;
sim_Avdb = 20*log10(abs(sim_Av));

sim_Vov1 = sim_VGS1 - abs(VTn);
sim_Vov2 = sim_VGS2 - abs(VTn);
sim_Vov3 = -sim_VGS3 - abs(VTp);
sim_Vov4 = -sim_VGS4 - abs(VTp);

sim_ro1 = 1/(Lambdan*sim_ID1);
sim_ro2 = 1/(Lambdan*sim_ID2);
sim_ro3 = 1/(Lambdap*sim_ID3);
sim_ro4 = 1/(Lambdap*sim_ID4);

sim_go1 = 1/sim_ro1;
sim_go2 = 1/sim_ro2;
sim_go3 = 1/sim_ro3;
sim_go4 = 1/sim_ro4;