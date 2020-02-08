

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diag 1
  [2,4,6]  # diag 2
]

# Displays board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# Converts user input to array index
def input_to_index(input)
  # convert input to integer
  # subtract 1, make an index
  # return index
  # return -1 if a string
  input = input.to_i
  puts input
  index = input-1
end

### REVISE THIS !!!!!!
# Executes the move
def move(board, index, token)
  update_array_at_with(board, index, token)
end

def update_array_at_with(board, index, token)
  board[index] = token
end
### REVISE THIS !!!!!! ^

# Checks to see if the position is taken
def position_taken?(board, position)
  # returns false if position is NOT taken == yes, taken
  !(board[position].nil? || board[position] == " ")
end

# Checks to position provided by user against board to see if position is taken
#=> returns true if the move is made to a position that is valid (on the board) AND
#=> the position is not taken already
def valid_move?(board, position)

  if position >= 0 && position <= 8
    valid_position = position_taken?(board, position)
    if valid_position == false
      true
    end
  end
end

# Manages the turn
def turn(board)
  # asks for user input
  # asks for input again if not valid
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

# Keeps track of how many turns have been played in the game by counting occupied positions
def turn_count(board)
  # counts occupied positions
  counter = 0
  board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
    return counter
end

# Keeps track of which players turn it is based on which player went last
def current_player(board)
  # returns the correct player
  result = turn_count(board)
  turn = result.even ? "X" : "O"
  return turn
end

# Comment
def won?(board)
  # returns false for draw?()
  # returns true for win()
  WIN_COMBINATIONS.detect do |win_combo|
    position_1 = board[win_combo[0]]
    position_2 = board[win_combo[1]]
    position_3 = board[win_combo[2]]

    position_1 == "X" && position_2 == "X" && position_3 == "X" ||
    position_1 == "O" && position_2 == "O" && position_3 == "O"
  end
end

# Comment
def full?(board)
  # returns true for draw?()
  # returns false for game in-progress
  board.all? do |token|
    token == "X" || token == "O"
  end
end

# Comment
def draw?(board)
  # calls won?()
  # calls full?()
  # returns true for draw
  # returns false for game won
  # returns false for game in-progress
  full?(board) && !won?(board)
end

# Comment
def over?(board)
  # returns true for draw
  # returns true for game won
  # returns false for game in-progress
  draw?(board) ||
  won?(board)
end

# Comment
def winner(board)
  # returns X when X won
  # returns O when O won
  # returns nil when no winner
  if won?(board)
    board[won?(board)[0]]
  end
end
