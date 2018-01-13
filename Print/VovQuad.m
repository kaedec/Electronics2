function [Vov] = VovQuad(a,b,c)
%VovQuad Quadratic Formula
%   Use to solve for Vov for MOSFET devices
%   Automatically discards negative root

x = (-b+sqrt(b^2-4*a*c))/(2*a);
if(x < 0)
    Vov = (-b-sqrt(b^2-4*a*c))/(2*a);
else
    Vov = x;
end

end

