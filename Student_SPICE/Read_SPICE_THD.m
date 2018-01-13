%--------------------------------------------------------------------

function [THD, n, fn, Mn, Pn] = Read_SPICE_THD(fid, Node_Name)

%--------------------------------------------------------------------
% Reads the THD results from a spice .out file
% Use:      [THD n fn Mn Pn] = Read_SPICE_THD(fid, Node_Name)
% Inputs:   fid - file ID & Node_Name  - Node Name
% Returns:  THD n fn Mn Pn
%--------------------------------------------------------------------
% 03/17/2012 By John J. Burke, Ph.D., P.E.
% 02/18/2013 By John J. Burke, Ph.D., P.E.
% 09/13/2014 By John J. Burke, Ph.D., P.E.
%--------------------------------------------------------------------

if nargin < 2, Node_Name = 'VO'; end

Node_Name = lower(Node_Name);

%--------------------------------------------------------------------

Type_Node_Name = sprintf('v(%s)', Node_Name);

if Node_Name == ' :', Type_Node_Name = Node_Name; end 

%--------------------------------------------------------------------

tline = fgetl(fid);

%--------------------------------------------------------------------

while ischar(tline)
    
    Flag1 = strfind(tline, 'Fourier analysis');
    
    if isempty(Flag1) == 0
        Flag2 = strfind(tline, Type_Node_Name);
        if isempty(Flag2) == 0
            tline = fgetl(fid);
            Y = textscan(tline, '%s %s %f %s %s %f');
            THD = Y(6);
            [n, fn, Mn, Pn] = Read_Fourier(fid);
            return
        end
    end
    
    tline = fgetl(fid);
    
end

%--------------------------------------------------------------------











%--------------------------------------------------------------------

function [n, fn, Mn, Pn] = Read_Fourier(fid)

%--------------------------------------------------------------------

fgetl(fid);

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

n = M(:, 1);

fn = M(:, 2);

Mn = M(:, 3);

Pn = M(:, 4);

return

%--------------------------------------------------------------------
