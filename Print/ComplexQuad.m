function [s] = ComplexQuad(a,b,c,suppress)
%COMPLEXQUAD Quadtratic Formula
%   Use for complex numbers
%   Set suppress=0 to not supress output to screen
%   Set suppress=1 to supress output to screen

if (suppress == 0)
    s(1,1) = (-b+sqrt(b^2-4*a*c))/(2*a);
    s(1,2) = (-b-sqrt(b^2-4*a*c))/(2*a)
else
    s(1,1) = (-b+sqrt(b^2-4*a*c))/(2*a);
    s(1,2) = (-b-sqrt(b^2-4*a*c))/(2*a);
end
end

