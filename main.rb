# frozen_string_literal: true

# knights travails pseudocode:
# initialize with an array containing 64 nodes, each represented as a subarray containing an
# x-coordinate, y-coordinate, a distance variable, and a predecessor_node variable.
# put node with starting coordinates into a queue array with distance = 0, predecessor stays as nil

# REPEAT THESE STEPS until the queue is clear: (BFS GRAPH TRAVERSAL)
# shift node out of queue array (dequeue)
# for each possible move (node) from the previous node: make separate array of possible moves with all possible next squares
# for each possible move, if the node has not yet been visited:
#   enqueue node and update the distance + 1 and set predecessor_node variable to point to the current node.

# RETURN TO TOP

# Once board has been traversed, find the square containing the end coordinates, and print out each square
# by printing the node, following the predecessor node variable to find the next node, print, etc. until
# reaching the starting square where the predecessor variable == nil.
class Board
  attr_accessor :queue, :board, :position_index, :distance, :starting_square

  def initialize
    @board = create_board
    @queue = []
    @position_index = nil
    @distance = 0
    @starting_square = nil
  end

  def knight_moves(starting_coordinates, ending_coordinates)
    reset_variables(starting_coordinates)
    enqueue([position_index])
    until queue.empty?
      dequeue()
      moves = find_possible_moves()
      enqueue(find_move_indices(moves))
    end
    display_path(ending_coordinates)
  end

  private

  def create_board
    board_arr = []
    (1..8).each do |i|
      (1..8).each do |j|
        # format is x coord, y coord, distance (levels of BFS) from start, predecessor node
        board_arr << [i, j, nil, nil]
      end
    end
    board_arr
  end

  def reset_variables(coordinates)
    @board = create_board
    @position_index = nil
    @distance = 0
    @starting_square = coordinates
    board.each_with_index do |square, index|
      if square[0..1] == coordinates
        square[2] = distance
        return @position_index = index
      end
    end
  end

  def enqueue(index_arr)
    index_arr.each do |index|
      board[index][2] = board[position_index][2] + 1
      board[index][3] = position_index unless board[index][0..1] == @starting_square
      queue << index
    end
  end

  def dequeue
    @position_index = @queue.shift
  end

  def find_possible_moves
    moves = []
    a, b = board[position_index][0..1]
    move_distances = [[-2, -1], [-2, 1], [-1,-2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    move_distances.each do |move|
      c, d = move
      x = a + c
      y = b + d
      moves << [x, y] if valid_square?(x, y) && !square_visited?(x, y)
    end
    moves
  end

  def valid_square?(x_coord, y_coord)
    return false if !(1..8).include?(x_coord) || !(1..8).include?(y_coord)

    true
  end

  def square_visited?(x, y)
    board.each { |square| return true if square[0..1] == [x, y] && !square[2].nil? }
    false
  end

  def find_move_indices(moves)
    indices = []
    moves.each do |move|
      board.each_with_index do |square, index|
        indices << index if square[0..1] == move
      end
    end
    indices
  end

  def display_path(ending_coordinates)
    path = []
    current_square = nil
    board.each do |square| 
      current_square = square if square[0..1] == ending_coordinates
    end
    while true
      path << current_square[0..1]
      index = current_square[3]
      break if index.nil?
      current_square = board[index]
    end
    puts "Path found! It will take the knight #{path.length} moves! Here's the path:"
    path.each do |square| 
      print '   '
      p square
    end
    puts
  end
end

board = Board.new
board.knight_moves([2, 1], [3, 4])
board.knight_moves([3, 7], [7, 7])
board.knight_moves([6, 6], [1, 8])
board.knight_moves([1, 1], [1, 8])
