%--------------------------------------------------------------------
function [R, theta] = Rect_2_Polar(Z)
%--------------------------------------------------------------------
% Converts x + j*y to R theta
%--------------------------------------------------------------------

R = abs(Z);

theta = phase_d(Z);

%--------------------------------------------------------------------
