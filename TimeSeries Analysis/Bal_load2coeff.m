function [res] = Bal_load2coeff(array)
res = zeros(size(array,1)+1,size(array,2));

for i = 1:size(array,2)
    res(1,i) = array(1,i);                 %axial
    res(2,i) = array(2,i) + array(3,i);    %normal
    res(3,i) = array(4,i) + array(5,i);    %side
    res(4,i) = array(6,i);                 %roll moment 
    res(5,i) = (array(2,i) - array(3,i))*0.035;  %pitching moment 
    res(6,i) = (array(4,i) - array(5,i))*0.035;  %yawing moment 
    res(7,i) = sqrt(res(2,i)*res(2,i) + res(3,i)*res(3,i));    %resu
    if res(3,i) + res(2,i) < 0
        res(7,i) = -1*res(7,i);
    end
end
end