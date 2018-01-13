%--------------------------------------------------------------------
function Print_S2p_Polar(S1, Z, S2)
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

fprintf('\n       | (%4.4f < %+7.2f°)  (%4.4f < %+7.2f°) |', abs(Z(1, 1)), phase_d(Z(1, 1)), abs(Z(1, 2)), phase_d(Z(1, 2)));
fprintf('\n %s =   |                                          |%s', S1, S2);
fprintf('\n       | (%4.4f < %+7.2f°)  (%4.4f < %+7.2f°) | \n', abs(Z(2, 1)), phase_d(Z(2, 1)), abs(Z(2, 2)), phase_d(Z(2, 2)));

%--------------------------------------------------------------------
