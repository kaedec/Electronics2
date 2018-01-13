%--------------------------------------------------------------------

function [f3dB] = Calc_f3dB_SPICE(f, G_dB)

%--------------------------------------------------------------------
% Computes the 3 dB frequency for a low pass frequency response
% Use:      [f3dB] = Calc_f3dB_SPICE(f, G_dB)
% Inputs:   f & G_dB
% Returns:  f3dB
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

G_LF = G_dB(1);

G_f3dB = G_LF - 10*log10(2);

N = 4;

%--------------------------------------------------------------------

ILx = find(G_dB > G_f3dB);

IL = ILx(end);

IRx = find(G_dB < G_f3dB);

IR = IRx(1);

I = [(IL-N):1:IL, IR:1:(IR+N)];

% Np = length(I) - N;

Np = 3;

fmax = max(f(I));

%--------------------------------------------------------------------

p = polyfit(f(I)/fmax, G_dB(I), Np);

px = p;

px(end) = px(end) - G_f3dB;

x = roots(px);

%--------------------------------------------------------------------

for k = 1:length(x)
    if (abs(imag(x(k))) < 1e4*eps)
        fx = x(k) * fmax;
        if ( (fx > min(f(I))) && (fx < max(f(I))) )
            f3dB = fx;
        end
    end
end

%--------------------------------------------------------------------

return

%--------------------------------------------------------------------
