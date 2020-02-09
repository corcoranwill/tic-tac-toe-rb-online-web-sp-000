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
  input.to_i-1
end

# Executes the move
def move(board, position, token)
  board[position] = token
end

# Checks to see if the position is taken
def position_taken?(board, position)
  # returns false if position is NOT taken == yes, taken
  !(board[position].nil? || board[position] == " ")
end

# Checks to position provided by user against board to see if position is taken
#=> returns true if the move is made to a position that is valid (on the board) AND
#=> the position is not taken already
def valid_move?(board, position)
  !position_taken?(board, position) && position.between?(0,8)
end

# Manages the turn, should encapsulate the logic of a single, complete turn
# 1. Ask user for move by position 1-9
# 2. Receive the user input
# 3. Convert input to index
# 4. If move is valie, make the move and diplay the board
# 5. If move is invalid, ask for a new position
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  position = input_to_index(input)
  token = current_player(board)
  if valid_move?(board, position)
    move(board, position, token)
    display_board(board)
  else
    turn(board)
  end
end

# Keeps track of how many turns have been played in the game by counting occupied positions
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
    return counter
  end
end

# Keeps track of which players turn it is based on which player went last
def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
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

# returns true for draw, returns false for game won, returns false for game in-progress
def draw?(board)
  full?(board) && !won?(board)
end

# returns true for draw, returns true for game won, returns false for game in-progress
def over?(board)
  draw?(board) ||
  won?(board)
end

# returns X when X won, returns O when O won, returns nil when no winner
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

# primary method - plays the game until its won or draw
def play(board)
  until over?(board)
    turn(board)
  end
  if winner(board)
    winning_player = winner(board)
    puts "Congratulations #{winning_player}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
