%--------------------------------------------------------------------
function Print_Real2(S1, R, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Real2(S1, Z, S2)
%
% Purpose: Print a real number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Real Number
%
%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

N = length(R);

if N > 1
    for kk = 1 : N
        fprintf('\n %s(%2.0f) = %4.4e %s\n', S1, kk, R(kk), S2);
    end
else
    fprintf('\n %s = %4.4e %s\n', S1, R, S2);
end

%--------------------------------------------------------------------
