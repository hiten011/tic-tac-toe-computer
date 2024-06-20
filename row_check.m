% function to calculate value of row according to following table
% O = 3
% X = 7
% not_assigned = 10

function [value] = row_check(row_number, game)
    value = 0;
    for col = 1: 3

        if strcmp(game(row_number, col), 'O')
            value = value + 3;

        elseif strcmp(game(row_number, col), 'X')
            value = value + 7;
        
        else
            value = value + 10;

        end % end if
    end
end