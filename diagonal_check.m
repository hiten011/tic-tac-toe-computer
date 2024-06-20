% function to calculate value of diagonal according to following table
% O = 3
% X = 7
% not_assigned = 10

function [value] = diagonal_check(diagonal_number, game)
    value = 0;

    % calculation value for first digonal
    if diagonal_number == 1
        for i = 1: 3
            if strcmp(game(i , i), 'O')
            value = value + 3;

            elseif strcmp(game(i, i), 'X')
                value = value + 7;
            
            else
                value = value + 10;
    
            end % end if
        end % end for
    end % end if

    % calculation value for second digonal
    if diagonal_number == 2
        k = 4;
        for j = 1: 3

            k = k - 1;
            
            if strcmp(game(k , j), 'O')
            value = value + 3;

            elseif strcmp(game(k, j), 'X')
                value = value + 7;
            
            else
                value = value + 10;
    
            end % end if
        end % end for j
    end % end if

end