% function to take valid input from the user
function [row, column, n] = valid_input(game, player, k)
    % variable to store valid input
    is_valid_int = false;
    occupied = true;

    % while loop to prompt user again and again till he gives correct input
    while ~is_valid_int || occupied

        % taking input from the user
        n = input(player(k, 1)  + " enter the location for " + player(k, 2) + ": ");

        % checking whether integer is valid int
        if 1 <= n && n <= 9 && mod(n, 1) == 0
            is_valid_int = true;
        end % end if

        
        % converting the input into valid cordinates
        [row, column] = valid_location(n); 
        
        % checking whether the location is already used
        occupied = is_occupied(n, game);

    end % end while

end % end function