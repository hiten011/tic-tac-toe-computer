% function to check if their is a chance to win and return the cordinates
% where computer can put the X to win

function [ifWin, row, column] = if_win(game)
    for i = 1: 3

        % checking each row
        row_value = row_check(i, game);
        
        if row_value == 24 % if there is space where we can win
            ifWin = true;
            
            % finding where to put X
            for j = 1: 3
                if ~strcmp(game(i, j), 'X')
                    row = i;
                    column = j;
                    return
                end % end if
            end % end inner for
        end % end if
        

        % checking each column
        col_value = column_check(i, game);
        
        if col_value == 24 % if there is space where we can win
            ifWin = true;
            
            % finding where to put X
            for k = 1: 3
                if ~strcmp(game(k, i), 'X')
                    row = k;
                    column = i;
                    return
                end % end if
            end % end inner for
        end % end if
        
    end % end for

    % checking each diagonal
    for l = 1: 2
        diagonal_value = diagonal_check(l, game);    
    
        if diagonal_value == 24
            ifWin = true;

            % finding where to put X
            [row, column] = find_diagonal(l, game);

            return;
        end % end if
    end % end for

    
    % if there is no chance to win
    ifWin = false;
    row = 0;
    column = 0;
end % end function



function [row, column] = find_diagonal(diagonal_number, game)

    % finding position to put X for first digonal
    if diagonal_number == 1
        for  m = 1: 3
            if ~strcmp(game(m, m), 'X')
                row = m;
                column = m;
                return;
            end % end if
        end % end for
    end % end if

    % finding position to put X for second digonal
    if diagonal_number == 2
        o = 4;
        for  n = 1: 3
            o = o - 1;
            if ~strcmp(game(o, n), 'X')
                row = o;
                column = n;
                return;
            end % end if
        end % end for
    end % end if

end % end function
