% function to check if the place is occupied already
function [occupied] = is_occupied(n, game)
    
    % by default setting occupied as false
    occupied = false;

    % checking whether the location is already used
    [row, column] = valid_location(n); % converting the input into valid cordinates
    
     if strcmpi(game(row, column), 'O') || strcmpi(game(row, column), 'X')
         occupied = true;
     
     end % end if

end