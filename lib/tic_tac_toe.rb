

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

end

# Converts user input to array index
def input_to_index(input)
  # convert input to integer
  # subtract 1, make an index
  # return index
  # return -1 if a string
end

# Executes the move
def move(board, position, token)
  # does not allow for a 3rd default argument
  # places the token on the board in the position specified
end

# Checks to see if the position is taken
def position_taken?(board)
  # return true if a valid token is in a valid position
  # returns false if nil or " "
end

# Checks to see if a valid move
def valid_move?(board)
  # returns true if the move is made to a position that is valid (on the board) AND
  # the position is not taken already
end

# Manages the turn
def turn(board)
  # asks for user input
  # asks for input again if not valid

end

# Keeps track of how many turns have been played in the game by counting occupied positions
def turn_count(board)
  # counts occupied positions
end

# Keeps track of which players turn it is based on which player went last
def current_player(board)
  # returns the correct player
end

# Comment
def won?(board)
  # returns false for draw?()
  # returns true for win()
end

# Comment
def full?(board)
  # returns true for draw?()
  # returns false for game in-progress
end

# Comment
def draw?(board)
  # calls won?()
  # calls full?()
  # returns true for draw
  # returns false for game won
  # returns false for game in-progress
end

# Comment
def over?(board)
  # returns true for draw
  # returns true for game won
  # returns false for game in-progress
end

# Comment
def winner(board)
  # returns X when X won
  # returns O when O won
  # returns nil when no winner
end
