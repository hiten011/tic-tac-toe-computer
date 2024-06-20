% function to convert the input to cordinates
function [i, j] = valid_location(n)

    temp = 0;

    for i = 1: 3
        for j = 1: 3
            % append temp by one each time
            temp = temp + 1;

            % if the loop reaches the same number as the input
            if temp == n
                return; % to get out of the function
            end % end if

        end % end for j
    end % end for i
end % end function