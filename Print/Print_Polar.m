%--------------------------------------------------------------------
function Print_Polar(S1, Z, S2)
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

if N > 1
    for kk = 1 : N
        fprintf('\n %s(%2.0f) = (%4.4f < %4.4f°) %s\n', S1, kk, abs(Z(kk)), phase_d(Z(kk)), S2);
    end
else
    fprintf('\n %s = (%4.4f < %4.4f°) %s\n', S1, abs(Z), phase_d(Z), S2);
end

%--------------------------------------------------------------------
