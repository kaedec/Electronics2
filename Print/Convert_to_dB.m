function [dBSignal] = Convert_to_dB(Signal)
%Convert_dB dB conversion function
%   Takes one input as unitless value and converts it to dB

dBSignal = 20*log10(abs(Signal));

end

