%--------------------------------------------------------------------

function [frequency, G_dB, G_Ang] = Read_SPICE_Freq(fid, Node_Name)

%--------------------------------------------------------------------
% Reads the ac results (dB) from a spice .out file
% Use:      [frequency G_dB G_Ang] = Read_SPICE_Freq(fid, Node_Name)
% Inputs:   fid - file ID & Node_Name  - Node Name
% Returns:  frequency G_dB G_Ang
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

if nargin < 2, Node_Name = 'VO'; end

Node_Name = upper(Node_Name);

%--------------------------------------------------------------------

Type_Node_Name = sprintf('VDB(%s)', Node_Name);

%--------------------------------------------------------------------

tline = fgetl(fid);

%--------------------------------------------------------------------

while ischar(tline)
    
    Flag1 = strfind(tline, 'FREQUENCY');
    
    if isempty(Flag1) == 0
        Flag2 = strfind(tline, Type_Node_Name);
        if isempty(Flag2) == 0
            [frequency, G_dB, G_Ang] = Read_Frequency(fid);
            return
        end
    end
    
    tline = fgetl(fid);
    
end

%--------------------------------------------------------------------











%--------------------------------------------------------------------

function [frequency, G_dB, G_Ang] = Read_Frequency(fid)

%--------------------------------------------------------------------

fgetl(fid);

tline = fgetl(fid);

k = 0;

%--------------------------------------------------------------------

while ischar(tline)
    
    tline = fgetl(fid);
    
    data = str2num(tline);
    
    if isempty(data)
        break
    end
    
    k = k + 1;
    
    M(k, :) = data;
    
end

frequency = M(:, 1);

G_dB = M(:, 3);

G_Ang = M(:, 4);

return

%--------------------------------------------------------------------
