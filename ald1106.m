*            d g s b 
.subckt ald1106 1 2 3 4 
m1 1 2 3 4 ncg l=1u w=1u
.ends

.MODEL ncg NMOS Level=1 GAMMA=0.4 KP=540u LAMBDA=0.0165
+ LD=0.0 PB=0.8 PHI=0.6 TPG=1 VTO=573m
