% function to calculate value of column according to following table
% O = 3
% X = 7
% not_assigned = 10

function [value] = column_check(col_number, game)
    value = 0;
    for row = 1: 3

        if strcmp(game(row, col_number), 'O')
            value = value + 3;

        elseif strcmp(game(row, col_number), 'X')
            value = value + 7;
        
        else
            value = value + 10;

        end % end if
    end
end