# frozen_string_literal: true

# knights travails

# pseudocode:
# GOAL: output the shortest path for a knight to get from one square to another, listing the squares it takes along the way.
# put together a script that creates a game board and a knight
# Treat all possible moves the knight could make as children in a tree.
# Don't allow any moves to go off the board.
# Decide which search algorithm is best to use for this case. One of them could be a potentially infinite series.
# edge lists, adjacency matrices, adjacency lists. Can also be directed or undirected.
# breadth first search will find the shortest distance between two squares - option?

# BFS:
# set the distance and predecessor of each vertex to nil.
# start the search at the source(the root node or the knight's position)
# give each neighbor a distance of 1 and set it's predecessor to be the source.
# Then, visit all the neighbors of the vertices whose distance is 1 AND that have not been visited before, and give each of these vertices a...
# distance of 2 and set its predecessor to be vertex from which we visited it.
# keep going untiall all vertices reachable from teh source vertex have been visited, always visiting all vertices at distance k from ...
# the source before visiting any vertex at distance k + 1
# how to tell if a node has been visited yet - only if the distance value is still nil, which was initialized at the start.
# QUEUE: when we first visit a vertex, enqueue it.

# look into dijkstra's algorithm - try solving first though.
# Use the chosen search algorithm to find the shortest path between the starting square (or node) and the ending square. Output the full path.
