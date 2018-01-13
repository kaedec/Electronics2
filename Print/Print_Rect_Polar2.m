%--------------------------------------------------------------------
function Print_Rect_Polar2(S1, Z, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Polar2(S1, Z, S2)
%
% Purpose: Print a complex number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Complex Number
%
%--------------------------------------------------------------------

for ii = 1 : length(Z)
    Print_Rect2(S1, Z(ii), S2)
    Print_Polar2(S1, Z(ii), S2)
end

%--------------------------------------------------------------------
