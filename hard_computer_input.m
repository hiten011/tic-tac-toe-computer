% function to take valid input from the computer
function [row, column, n] = hard_computer_input(moves, game, recorded_moves)

    if moves == 2
        % record the previous move of player
        temp_first = recorded_moves(1); 

        % determing first move
        first = first_move(temp_first);
        n = first;
        [row, column] = valid_location(first);
        return
    end % end if

    % determing second move
    if moves == 4
        second = second_move(recorded_moves);

        if second ~= 0
            n = second;
            [row, column] = valid_location(second);
            return
        end % end if

    end % end if

    % using medium computer to get the rest of the moves
    [row, column, n] = medium_computer_input(game);

end


function first = first_move(temp_first)

    if temp_first == 5
        first = 3;
        return
    
    elseif temp_first == 1 || temp_first == 3 || temp_first == 7 || temp_first == 9
        first = 5;
        return
    
    else
        if temp_first == 2 || temp_first == 8
            first = temp_first +  1;
        else
            first = temp_first + 3;
        end
        return

    end
end


function [second] = second_move(recorded_moves)

    % for first move 5
    if recorded_moves(1) == 5 && recorded_moves(3) == 7
        second = 9;
        return
    end
    
    % for first move between 1, 3, 7 & 9
    if recorded_moves(1) == 1 && recorded_moves(3) == 8
        second = 7;
        return;
    end

    if recorded_moves(1) == 3 && recorded_moves(3) == 8
        second = 9;
        return;
    end

    if recorded_moves(1) == 1 || recorded_moves(1) == 3 || recorded_moves(1) == 7 || recorded_moves(1) == 9
        second = 8;
        return
    end
    
    % for first move 2
    if recorded_moves(1) == 2 && recorded_moves(3) == 1 ||  recorded_moves(1) == 2 && recorded_moves(3) == 4
        second = 9;
        return;
    end

    if recorded_moves(1) == 2 && recorded_moves(3) == 7 ||  recorded_moves(1) == 2 && recorded_moves(3) == 9
        second = 5;
        return;
    end

    if recorded_moves(1) == 2 && recorded_moves(3) == 6
        second = 4;
        return;
    end

    % for first move 8
    if recorded_moves(1) == 8 && recorded_moves(3) == 7 ||  recorded_moves(1) == 8 && recorded_moves(3) == 4
        second = 3;
        return;
    end

    if recorded_moves(1) == 8 && recorded_moves(3) == 1 ||  recorded_moves(1) == 8 && recorded_moves(3) == 3
        second = 5;
        return;
    end

    if recorded_moves(1) == 8 && recorded_moves(3) == 6
        second = 4;
        return;
    end

    % for first move 4
    if recorded_moves(1) == 4 && recorded_moves(3) == 1 ||  recorded_moves(1) == 4 && recorded_moves(3) == 2
        second = 9;
        return;
    end

    if recorded_moves(1) == 4 && recorded_moves(3) == 3 ||  recorded_moves(1) == 4 && recorded_moves(3) == 6 ||  recorded_moves(1) == 4 && recorded_moves(3) == 9
        second = 5;
        return;
    end

    % for first move 6
    if recorded_moves(1) == 6 && recorded_moves(3) == 2 ||  recorded_moves(1) == 6 && recorded_moves(3) == 3
        second = 7;
        return;
    end


    if recorded_moves(1) == 6 && recorded_moves(3) == 1 ||  recorded_moves(1) == 6 && recorded_moves(3) == 4 ||  recorded_moves(1) == 6 && recorded_moves(3) == 7
        second = 5;
        return;
    end

    second = 0;

end
