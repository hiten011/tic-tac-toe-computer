% function to take valid input from the computer
function [row, column, n] = medium_computer_input(game)

    % if their is a chance that computer wins take that
    [ifWin, row1, column1] = if_win(game);
    if ifWin
        row = row1;
        column = column1;
        n = valid_location_rc(row1, column1);
        return;
    end
    
    % if player is going to win and we can block it block
    [ifBlock, row2, column2] = if_block(game);
    if ifBlock
        row = row2;
        column = column2;
        n = valid_location_rc(row2, column2);
        return;
    end
    
    % else nothing then randomoly select value
    [row, column, n] = easy_computer_input(game);

end