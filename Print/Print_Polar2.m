%--------------------------------------------------------------------
function Print_Polar2(S1, Z, S2)
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

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

for ii = 1 : length(Z)
    fprintf('\n %s = (%4.4e < %4.4f) %s\n',S1,abs(Z), phase_d(Z), S2);
end

%--------------------------------------------------------------------
