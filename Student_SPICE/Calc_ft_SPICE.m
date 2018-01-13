%--------------------------------------------------------------------

function [ft, theta_ft] = Calc_ft_SPICE(f, G_dB, theta)

%--------------------------------------------------------------------
% Computes the unity gain frequency for a low pass frequency response
% Use:      [ft, theta_ft] = Calc_ft_SPICE(f, G_dB, theta)
% Inputs:   f, G_dB, theta
% Returns:  ft & theta_ft
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

G_ft = 0;

N = 4;

%--------------------------------------------------------------------

ILx = find(G_dB > G_ft);

IL = ILx(end);

IRx = find(G_dB < G_ft);

IR = IRx(1);

I = [(IL-N):1:IL, IR:1:(IR+N)];

% Np = length(I) - N;

Np = 3;

fmax = max(f(I));

%--------------------------------------------------------------------

p = polyfit(f(I)/fmax, G_dB(I), Np);

px = p;

px(end) = px(end) - G_ft;

x = roots(px);

%--------------------------------------------------------------------

for k = 1:length(x)
    if (abs(imag(x(k))) < 1e4*eps)
        fx = x(k) * fmax;
        if ( (fx > min(f(I))) && (fx < max(f(I))) )
            ft = fx;
        end
    end
end

%--------------------------------------------------------------------

p_theta = polyfit(f(I)/fmax, theta(I), Np);

theta_ft = polyval(p_theta, ft/fmax);

%--------------------------------------------------------------------

return

%--------------------------------------------------------------------
