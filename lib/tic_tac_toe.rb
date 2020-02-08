

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

# Comment
def move(board, position, token)
  # does not allow for a 3rd default argument
  # places the token on the board in the position specified 
end

# Comment
def position_taken?(board)
  # return true if a valid token is in a valid position
  # returns false if nil or " "
end

# Comment
def valid_move?(board)

end

# Comment
def turn(board)

end

# Comment
def turn_count(board)

end

# Comment
def current_player(board)

end

# Comment
def won?(board)

end

# Comment
def full?(board)

end

# Comment
def draw?(board)

end

# Comment
def over?(board)

end

# Comment
def winner(board)

end

