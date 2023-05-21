%function for matrix sorting 
function[sortedMatrix] = sortm(cell)
    matr = zeros(2,10);
    matr(1,:) = cell2mat(cell(:,1));
    matr(2,:) = cell2mat(cell(:,2));
    [sortedRow, sortedIndices] = sort(matr(2, :));
    sortedMatrix = matr(:, sortedIndices);
end