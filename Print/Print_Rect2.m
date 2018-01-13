%--------------------------------------------------------------------
function Print_Rect2(S1, Z, S2)
%--------------------------------------------------------------------
%
% Usage: Print_Rect(S1, Z, S2)
%
% Purpose: Print a complex number 
%
% Parameters: 
%            S1 - String containing name of variable
%            S2 - String containing units of variable
%            Z - Complex Number
%
%--------------------------------------------------------------------

R = real(Z);
X = imag(Z);

%--------------------------------------------------------------------

if nargin < 3, S2 =''; end

%--------------------------------------------------------------------

for ii = 1 : length(Z)
    if X < 0
        fprintf('\n %s = (%4.4e - j%4.4e) %s\n',S1, R, abs(X), S2);
    else
        fprintf('\n %s = (%4.4e + j%4.4e) %s\n',S1, R, abs(X), S2);
    end
end

%--------------------------------------------------------------------
