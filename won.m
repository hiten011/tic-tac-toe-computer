% function to check if someone has won
function [status] = won(game, moves)

    for i = 1: 3

        % checking each row if someone has won
        row_value = row_check(i, game); % getting value of the row

        if row_value == 9
            status = 1;
            return;

        elseif row_value == 21
            status = 2;
            return;
        end

        % checking each column if someone has won
        col_value = column_check(i, game); % getting value of the row

        if col_value == 9
            status = 1;
            return;

        elseif col_value == 21
            status = 2;
            return;
        end
  
    end % end for

    % checking each diagonal
    for j = 1: 2
        diagonal_value = diagonal_check(j, game);    
    
        if diagonal_value == 9
            status = 1;
            return;
    
        elseif diagonal_value == 21
            status = 2;
            return;
        end % end if
    end % end for
    
    % if game has ended in a tie
    if moves == 9
        status = 3;
        return;
    end

    % default value otherwise
    status = 0;

end % end function
