%--------------------------------------------------------------------
function Print_S2p_Real(S1, Z, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Polar(S1, Z, S2)
%
% Purpose: Print a real number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Complex Number
%
%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

fprintf('\n       | %4.4f    %4.4f |', Z(1, 1), Z(1, 2));
fprintf('\n %s =  |                    |%s', S1, S2);
fprintf('\n       | %4.4f    %4.4f | \n', Z(2, 1), Z(2, 2));

%--------------------------------------------------------------------
