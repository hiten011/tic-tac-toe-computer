% function to print the winner
function [] = print_winner(n, player)
    switch n
        case 1
            fprintf("%s won the game\n", player(n, 1));
        
        case 2
            fprintf("%s won the game\n", player(n, 1));

        case 3
            fprintf("It's a tie\n");
        
    end % switch
end % function