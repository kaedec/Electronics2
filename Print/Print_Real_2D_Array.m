%--------------------------------------------------------------------
function Print_Real_2D_Array(S1, R, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Real(S1, Z, S2)
%
% Purpose: Print a 2D real number array
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Real Number
%

%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

[N1, N2] = size(R);

[M1, M2] = size(S1);

Mmax = 6; % maximum length of S1

%--------------------------------------------------------------------

%fprintf('\n %s\t=', S1)

%--------------------------------------------------------------------

for ii = 1:N1
    fprintf('\n %s', S1(ii,1:end))
    for kk = 1:(Mmax-M2)
        fprintf(' ')
    end
    for jj = 1:N2
        fprintf('\t%9.4f', R(ii, jj))
    end
    fprintf('\t %s', S2(ii,1:end))
    fprintf('\n')
end

%--------------------------------------------------------------------
