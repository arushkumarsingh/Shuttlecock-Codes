function [m] = findm(data)
m = zeros(7,9);

for i = 1:7
    for j = 1:9
        m(i,j) = mean(data((i-1)*9 + j,:));
    end
end
end