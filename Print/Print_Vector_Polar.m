%--------------------------------------------------------------------
function Print_Vector_Polar(S1, A, S2)
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

MA = abs(A);

PA = phase_d(A);

%--------------------------------------------------------------------

fprintf('\n %s = x_hat(%4.4f < %4.4f) + y_hat(%4.4f < %4.4f) + z_hat(%4.4f < %4.4f) %s\n',S1, MA(1), PA(1), MA(2), PA(2), MA(3), PA(3), S2);

%--------------------------------------------------------------------
