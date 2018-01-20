*             d g s b/v+
.subckt ald1107 1 2 3 4 
m1 1 2 3 4 pcg l=1u w=1u 
.ends

.MODEL pcg PMOS Level=1 GAMMA=.57 KP=176u LAMBDA=0.0219
+ LD=0.0 PB=0.8 PHI=0.6 TPG=-1 VTO=-647m







