% function to print the mmatrix of the game in neat form
function [] = print_game(game)
  fprintf("\n");
  % using loop to go into each and evry row and column of the matrix
  for i = 1: 3
      for j = 1: 3
          fprintf(" %s ", game(i ,j));

          % if the loop reaches last column go to new line
          if j == 3
              fprintf("\n");
          end % end if
          
      end % end for j
  end % end for i

  fprintf("\n");

end % end function