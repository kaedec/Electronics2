%--------------------------------------------------------------------
function Print_Polar_Rect2(S1, Z, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Polar(S1, Z, S2)
%
% Purpose: Print a complex number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Complex Number
%
%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

N = length(Z);

for ii = 1 : N
    if N > 1
        S1i = sprintf('\n %s(%2.0f)', S1, ii);
    else
        S1i = S1;
    end
    Print_Polar2(S1i, Z(ii), S2)
    Print_Rect2(S1i, Z(ii), S2)
end

%--------------------------------------------------------------------
