% function to take valid input from the computer
function [row, column, n] = easy_computer_input(game)
    occupied = true;

    % while loop to to get correct input from computer
    while occupied
        
        n = randi(9);
        
        % converting the location into valid cordinated
        [row, column] = valid_location(n);
        
        % checking whether the location is already used
        occupied = is_occupied(n, game);

    end % end while
end
