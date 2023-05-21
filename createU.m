function [M350_Fu] = createU(M350_F)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
rovsT = readtable('rovsT.xlsx');
M350_Fu=zeros(7,1);

for i = 1:7
    M350_Fu(i,1) = sqrt((2*M350_F((i-1)*9 + 1))/interp1(table2array(rovsT(:,1)),table2array(rovsT(:,2)),M350_F((i-1)*9 + 2)));
end

end