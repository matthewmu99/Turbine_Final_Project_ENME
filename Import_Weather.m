function [arrDat] = Import_Weather(fileName)
%arrDat gives [speed, direction]
%   Detailed explanation goes here
warning('off','all') %turn off unessesary input warnings due to unused table elements (ie: blank cells) (this is temporary.) 

tableDat = readtable(fileName,  'Delimiter',',','ReadVariableNames',false);
arrDat =[str2double(table2array(tableDat(2:end,14))),str2double(table2array(tableDat(2:end,12))) ]; %speed, direction


warning('on','all') %turn on all warnings now that data is imported



end

