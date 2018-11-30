function [arrDat] = Import_Weather(fileName)
%This function takes a file name and then reads it as a table by seperated
%comma values as a delimitter. The table is then converted to an array of
%strings which is then parsed to an array of doubles.

warning('off','all') %turn off unessesary input warnings due to unused table elements (ie: blank cells) (this is temporary.)

tableDat = readtable(fileName,  'Delimiter',',','ReadVariableNames',false);
arrDat =[str2double(table2array(tableDat(2:end,14))),str2double(table2array(tableDat(2:end,12))) ]; %speed, direction


warning('on','all') %turn on all warnings now that data is imported



end

