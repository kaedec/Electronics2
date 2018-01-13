%--------------------------------------------------------------------

function [A_LF, Rin, Ro] = Read_SPICE_TF(fid)

%--------------------------------------------------------------------
% Reads the dc transfer function from a spice .out file
% Use:      [A_LF Rin Ro] = Read_SPICE_TF(fid)
% Inputs:   fid - file ID
% Returns:  A_LF Rin Ro
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

tline = fgetl(fid);

%--------------------------------------------------------------------

while ischar(tline)
    
    Flag = strfind(tline, 'SMALL SIGNAL DC TRANSFER FUNCTION');
    
    if isempty(Flag) == 0
        
       fgetl(fid);
        
        tline2 = fgetl(fid);
        Y2 = textscan(tline2, '%s %f');
        Ro = Y2{2};
        
        tline3 = fgetl(fid);
        Y3 = textscan(tline3, '%s %f');
        Rin = Y3{2};
        
        tline4 = fgetl(fid);
        Y4 = textscan(tline4, '%s %f');
        A_LF = Y4{2};
        
    end
    
    tline = fgetl(fid);
    
end

%--------------------------------------------------------------------
