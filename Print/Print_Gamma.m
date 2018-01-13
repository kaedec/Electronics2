%--------------------------------------------------------------------
function Print_Gamma(S, Gamma)
%--------------------------------------------------------------------
%
% Usage: Print_Gamma(S, Gamma)
%
% Purpose: Print a reflection coefficient 
%
% Parameters: 
%            S - String
%            Gamma - Reflection
%
%--------------------------------------------------------------------

for ii = 1 : length(Gamma)
    fprintf('\n %s = %4.4f < %4.4f \n',S,abs(Gamma), phase_d(Gamma));
end

%--------------------------------------------------------------------
