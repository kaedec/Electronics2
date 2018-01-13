%--------------------------------------------------------------------

function [x, y] = Read_SPICE_dc(fid, Node_Name)

%--------------------------------------------------------------------
% Reads the dc transfer curves from a spice .out file
% Use:      [x y] = Read_SPICE_dc(fid, Node_Name)
% Inputs:   fid - file ID & Node_Name  - Node Name
% Returns:  x y
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

if nargin < 2, Node_Name = 'VO'; end

Node_Name = upper(Node_Name);

%--------------------------------------------------------------------

tline = fgetl(fid);

%--------------------------------------------------------------------

while ischar(tline)
    
    Flag1 = strfind(tline, 'DC TRANSFER CURVES');
    
    if isempty(Flag1) == 0
        fgetl(fid);
        fgetl(fid);
        fgetl(fid);
        tline = fgetl(fid);
        Flag2 = strfind(tline, Node_Name);
        if isempty(Flag2) == 0
            [x, y] = Read_dc(fid);
            return
        end
    end
    
    tline = fgetl(fid);
    
end

%--------------------------------------------------------------------











%--------------------------------------------------------------------

function [x, y] = Read_dc(fid)

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

x = M(:, 1);

y = M(:, 2);

return

%--------------------------------------------------------------------
