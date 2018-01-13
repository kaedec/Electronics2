%--------------------------------------------------------------------
function Print_Real_i(S1, R, ii, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Real(S1, Z, S2)
%
% Purpose: Print a real number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Real Number
%
%--------------------------------------------------------------------


if nargin < 3, ii = 1; end
if nargin < 4, S2 = ''; end

%--------------------------------------------------------------------

fprintf('\n %s(%2.0f) = %4.4f %s\n', S1, ii, R, S2)

%--------------------------------------------------------------------
