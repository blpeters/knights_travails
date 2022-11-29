# frozen_string_literal: true

# knights travails

# pseudocode:
# GOAL: output the shortest path for a knight to get from one square to another, listing the squares it takes along the way.
# put together a script that creates a game board and a knight (not sure I need a Knight class....)

# board class
# initialize with an array containing 64 nodes (or vertices), each represented as a subarray containing a coordinate subarray, a distance variable, and a predecessor_node variable
class Board
  attr_accessor :queue, :board, :position_index

  def initialize
    @board = create_board
    @queue = []
    @position_index = nil
  end

  def knight_moves(starting_coordinates, ending_coordinates)
    # when knight_moves(start, end) is called, traverse graph using start coordinates:
    set_starting_square(starting_coordinates)
    enqueue(position_index)
    # until queue.empty?

    dequeue
    find_possible_moves
    p board
    # enqueue
    
    # end

  end

  private

  def create_board
    board_arr = []
    (1..7).each do |i|
      (1..7).each do |j|
        board_arr << [i, j, nil, nil]
      end
    end
    board_arr
  end

  def set_starting_square(coordinates)
    board.each_with_index do |square, index|
      if square[0..1] == coordinates
        square[2] = 0
        return @position_index = index
      end
    end  
  end

  def enqueue(position_index)
    queue << position_index
  end

  def dequeue
    position_index = queue.shift
  end

  def find_possible_moves
    possible_moves_arr = []
    a, b = board[position_index][0..1] # 2, 1
    move_distances = [[-2, -1], [-2, 1], [-1,-2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
    move_distances.each do |move|
      c, d = move
      x = a + c
      y = b + d
      possible_moves_arr << [x, y] if valid_square?(x, y) && !square_visited?(x, y)
    end  
    p possible_moves_arr
  end

  def valid_square?(x, y)
    return false if !(1..7).include?(x) || !(1..7).include?(y)
    true
  end

  def square_visited?(x, y)
    board.each do |square|
      return true if square[0..1] == [x, y] && square[2] != nil
    end
    false
  end

# until the queue is clear:
# put node with start coordinates into a queue array with distance = 0, predecessor stays as nil

# REPEAT THESE STEPS
# shift node out of queue array (dequeue)

# for each possible move (node) from the previous node: (make separate array with all possible next coordinates)
# if the node has not yet been visited, (find each possible move coordinates in graph array and check if the distance variable is nil or not)
# enqueue node and update the distance + 1 and predecessor_node variable

# return to repeat (dequeue)

# Don't allow any moves to go off the board.

# CHOSEN ALGORITHM - graph with BFS:
# set the distance and predecessor of each vertex to nil.
# start the search at the source(the root node or the knight's position)
# give each neighbor a distance of 1 and set it's predecessor to be the source.
# Then, visit all the neighbors of the vertices whose distance is 1 AND that have not been visited before, and give each of these vertices a...
# distance of 2 and set its predecessor to be vertex from which we visited it.
# keep going untiall all vertices reachable from teh source vertex have been visited, always visiting all vertices at distance k from ...
# the source before visiting any vertex at distance k + 1
# how to tell if a node has been visited yet - only if the distance value is still nil, which was initialized at the start.
# QUEUE: when we first visit a vertex, enqueue it.

# Output the full path that the knight ends up taking to get to the ending square.
end

board = Board.new
board.knight_moves([2,1], [3,4])