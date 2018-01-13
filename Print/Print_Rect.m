%--------------------------------------------------------------------
function Print_Rect(S1, Z, S2)
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

N = length(Z);

if N > 1
    for kk = 1 : N
        if X(kk) < 0
            fprintf('\n %s(%2.0f) = (%4.4f - j%4.4f) %s\n', S1, kk, R(kk), abs(X(kk)), S2);
        else
            fprintf('\n %s(%2.0f) = (%4.4f + j%4.4f) %s\n', S1, kk, R(kk), abs(X(kk)), S2);
        end
    end
else
    if X < 0
        fprintf('\n %s = (%4.4f - j%4.4f) %s\n', S1, R, abs(X), S2);
    else
        fprintf('\n %s = (%4.4f + j%4.4f) %s\n', S1, R, abs(X), S2);
    end
end

%--------------------------------------------------------------------
