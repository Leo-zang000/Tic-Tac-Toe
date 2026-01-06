require_relative("board.rb")

require_relative("counter.rb")

def player_move(player, board)
  puts(player + "'s move:")
  repeat_until_valid = true
  while repeat_until_valid
    print("Input the column number that you would like to place the counter in:")
    counter_x_coordinate = gets.chomp.to_i - 1
    print("Input the row number that you would like to place the counter in:")
    counter_y_coordinate = gets.chomp.to_i - 1
    counter_type = ""
    if player == "Player 1"
      counter_type = "X"
    else
      counter_type = "O"
    end
    current_counter = Counter.new(counter_type, counter_x_coordinate, counter_y_coordinate)
    repeat_until_valid = board.add_counter(current_counter)
    board.display()
  end
end

game_looping = true
  current_board = Board.new()
  current_board.display()
while game_looping

  player_move("Player 1", current_board)

  if current_board.winning_position?[1] == true
      game_looping = false
      puts(current_board.winning_position?[0] + " has won the game!")
  elsif current_board.positions_filled? >= 9
      game_looping = false
      puts("Board filled - game over - draw")
  end

  if game_looping == true
    player_move("Player 2", current_board)

    if current_board.winning_position?[1] == true
        game_looping = false
        puts(current_board.winning_position?[0] + " has won the game!")
    elsif current_board.positions_filled? >= 9
        game_looping = false
        puts("Board filled - game over - draw")
    end
  end

end