%--------------------------------------------------------------------

function [t, vx] = Read_SPICE_Trans(fid, Node_Name)

%--------------------------------------------------------------------
% Reads the transient results from a spice .out file
% Use:      [t vx] = Read_SPICE_Trans(fid, Node_Name)
% Inputs:   fid - file ID & Node_Name  - Node Name
% Returns:  t vx
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
    
    Flag1 = strfind(tline, 'TIME');
    
    if isempty(Flag1) == 0
        Flag2 = strfind(tline, Node_Name);
        if isempty(Flag2) == 0
            [t, vx] = Read_Trans(fid);
            return
        end
    end
    
    tline = fgetl(fid);
    
end

%--------------------------------------------------------------------











%--------------------------------------------------------------------

function [t, vx] = Read_Trans(fid)

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

t = M(:, 1);

vx = M(:, 2);

return

%--------------------------------------------------------------------
