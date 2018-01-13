%--------------------------------------------------------------------
function Print_Vector_S(S1, A, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Real(S1, Z, S2)
%
% Purpose: Print a vector 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            A - vector
%
%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

fprintf('\n %s = R_hat(%4.4f) + theta_hat(%4.4f) + phi_hat(%4.4f) %s\n', S1, A, S2);

%--------------------------------------------------------------------
