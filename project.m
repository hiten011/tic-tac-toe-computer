clear;
clc;

% Tic Tac toe game
tictaktoe = [" _____ ___ ____   _____  _    _  __  _____ ___  _____ ";
"|_   _| _/ ___|  |_   _|/ \  | |/ / |_   _/ _ \| ____|";
"  | |  | | |       | | / _ \ | ' /    | || | | |  _|  ";
"  | |  | | |___    | |/ ___ \| . \    | || |_| | |___ ";
"  |_| |___\____|   |_/_/   \_\_|\_\   |_| \___/|_____|"];

for tic = 1:5
    fprintf("%s\n", tictaktoe(tic));
    pause(0.1);
end
fprintf("\n");

% if the player wants to play the game again
play_again = true;

while play_again

    % prompting the user for the type of game they want to play
    game_type_options = ["SINGLE", "MULTIPLAYER"];
    game_type = input("Which type of game do you wanna play, single player (s) or multiplayer game (m)? ", "s");
    
    % making the input valid for short forms
    if strcmpi(game_type, 's')
        game_type = "single";
    
    elseif strcmpi(game_type, 'm')
        game_type = "multiplayer";
    end
    
    % prompting the user till he gives an valid input
    while ~(strcmpi(game_type, game_type_options(1))) && ~(strcmpi(game_type, game_type_options(2)))
        game_type = input("Enter a valid input, single player (s) or multiplayer game (m)? ", "s");

        % making the input valid for short forms
        if strcmpi(game_type, 's')
            game_type = "single";
        
        elseif strcmpi(game_type, 'm')
            game_type = "multiplayer";
        end
    end
    
    difficulty_options = ["EASY", "MEDIUM", "NIGHTMARE"];
    if strcmpi(game_type, game_type_options(1))
        number_of_players = 1;
    
        % ask for the difficulty of the level
        difficulty = input("Enter the difficulty of the game, Easy (e), Medium (m), Nightmare (n): ", "s");
    
        if strcmpi(difficulty, 'e')
            difficulty = "easy";
        
        elseif strcmpi(difficulty, 'm')
            difficulty = "medium";
        
        elseif strcmpi(difficulty, 'n')
            difficulty = "nightmare";
        end
    
        while ~(strcmpi(difficulty, difficulty_options(1))) &&  ~(strcmpi(difficulty, difficulty_options(2))) &&  ~(strcmpi(difficulty, difficulty_options(3)))

            % ask for the difficulty of the level
            difficulty = input("Enter a valid input for difficulty of the game, Easy (e), Medium (m), Nightmare (n): ", "s");
        
            if strcmpi(difficulty, 'e')
                difficulty = "easy";
            
            elseif strcmpi(difficulty, 'm')
                difficulty = "medium";
            
            elseif strcmpi(difficulty, 'n')
                difficulty = "nightmare";
            end

        end
    
    else
        number_of_players = 2;
    end
    
    % prompting the users for their name and storing them in a matrix
    % Defining variables and player matrix
    player = string(zeros(number_of_players,2));
    sign = ['O', 'X'];
    
    for i = 1:number_of_players
        player(i, 1) = input("Enter the name of player " + i + ": ", "s");
    
        % assigning signs to each player
        player(i, 2) = sign(i);
    end
    
    % if it is single player game then set the other player as computer
    if number_of_players == 1
        player(2, 1) = "COMPUTER";
    
        % assigning signs to computer
        player(2, 2) = sign(2);
    end
    
    fprintf("\n");
    
    % printing out the name and signs assigned to players
    for j = 1:2
        fprintf("%s is assigned %s\n", player(j, 1), player(j, 2));
    end
    
    fprintf("\n");
    
    % creating matrix to play game
    game = zeros(3, 3);
    number = 1;
    for r = 1:3
        for c = 1:3
            game(r, c) = number;
            number = number + 1;
        end
    end
    
    % making the game matrix and converting it to string to record different signs.
    game = string(game);
    
    % explaining rules to the user
    fprintf("To add the sign in the matrix, \nsimply enter the corresponding number to the location you want to add the sign to.\n");
    print_game(game); % user_defined function to display matrix in a neat form
    fprintf("For instance, player 1 wants to enter the O in the middle, then he will enter 5\n");
    
    % main loop of the game
    is_winner = false; 
    moves = 1; % vairiable to record number of moves
    record_moves = [zeros(1, 9)]; % to keep track of players moves

    % till we find a winner or the game ties, keep on doing while loop
    while ~is_winner
        % running the game for both players at a time
        for k = 1:2
            
            % to clear the board 
            if moves ~= 1
                clc;
            end

            % printing the updates game matrix
            print_game(game);
    
            % taking a valid input from the user or computer and converting it to cordinates
            % if player chooses easy difficulty
            if k == 2 && number_of_players == 1 && strcmpi(difficulty, difficulty_options(1))
                [row, column, temp_move] = easy_computer_input(game);
                fprintf("Computer placed X at %i\n", temp_move);
            % if player chooses medium difficulty
            elseif k == 2 && number_of_players == 1 && strcmpi(difficulty, difficulty_options(2))
                 [row, column, temp_move] = medium_computer_input(game);
                 fprintf("Computer placed X at %i\n", temp_move);
            % if player chooses hard difficulty
            elseif k == 2 && number_of_players == 1 && strcmpi(difficulty, difficulty_options(3))
                 [row, column, temp_move] = hard_computer_input(moves, game, record_moves);
                 fprintf("Computer placed X at %i\n", temp_move);
            % if player is playing multiplayer
            else
                [row, column, temp_move] = valid_input(game, player, k);
            end
    
           % recording the user input to the matrix
           game(row, column) = player(k, 2);
    
           % check whether someone has won
           end_result = won(game, moves);

           % to keep tracks of moves
           record_moves(moves) = temp_move;
           moves = moves + 1;
    
           if end_result == 1 || end_result == 2 || end_result == 3
               is_winner = true;
               clc;
               print_game(game);
               print_winner(end_result, player);
               break;
           end % end if
           
        end % end for
    end % end while for winner

    % prompt user if he wants to play the game again
    play_options = ["yes", "no"];
    play = input("Do you wanna play again? (y/n): ", "s");

    if strcmpi(play, "y")
        play = "yes";
    elseif strcmpi(play, "n")
        play = "no";
    end

    while ~(strcmpi(play, play_options(1))) && ~(strcmpi(play, play_options(2)))
        play = input("Enter a valid input: ", "s");
    end

    if strcmpi(play, "no")
        play_again = false;
    else
        clear;
        clc;
        
        play_again = true;
    end

end % end while for play-again
