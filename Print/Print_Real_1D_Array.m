%--------------------------------------------------------------------
function Print_Real_1D_Array(S1, R, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Real(S1, Z, S2)
%
% Purpose: Print a 1D real number array
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Real Number
%
%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

N = length(R);
M = length(S1);
Mmax = 6; % maximum length of S1

%--------------------------------------------------------------------

%fprintf('\n %s\t=', S1)
fprintf('\n %s', S1)

%--------------------------------------------------------------------

for ii = 1:(Mmax-M)
    fprintf(' ')
end

%--------------------------------------------------------------------

for ii = 1:N
    fprintf('\t%9.4f', R(ii))
end

fprintf('\t\t%s\n', S2)

%--------------------------------------------------------------------
