function [s1,s2] = ComplexQuad(a,b,c)
%COMPLEXQUAD Quadtratic Formula
%   Use for complex numbers

syms s;
s1 = (-b+sqrt(b^2-4*a*c))/(2*a)
s2 = (-b-sqrt(b^2-4*a*c))/(2*a)

end

