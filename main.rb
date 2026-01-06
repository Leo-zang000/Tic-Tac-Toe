require_relative("board.rb")

require_relative("counter.rb")

def player_move(player, board)
  puts(player +"'s move:")
  print("Input the column number that you would like to place the counter in:")
  counter_x_coordinate = gets.chomp
  print("Input the row number that you would like to place the counter in:")
  counter_y_coordinate = gets.chomp
  counter_type = ""
  if player == "Player 1"
    counter_type = "X"
  else
    counter_type = "O"
  end
  current_counter = Counter.new(counter_type, counter_x_coordinate, counter_y_coordinate)
  board.add_counter()
end

game_looping = true
while game_looping
  current_board = Board.new()
  current_board.display()

  player_move("Player 1", current_board)
  player_move("Player 2", current_board)

  if current_board.positions_filled >= 9
    game_looping = false
    print("Board filled - game over - draw")
  end

end