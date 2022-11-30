# Knights Travails - Ruby - The Odin Project

Welcome to my Knights Travails project, which determines the shortest path for a chess knight to move from any given space to another.

This project allowed me to explore the use of search algorithms to solve a practical problem. In this case, I employed a breadth-first graph traversal to map the shortest path for a knight on a chess board.

## BFS Algorithm's Pseudocode:
- initialize board with an array containing 64 nodes, each represented as a subarray containing an
x-coordinate, y-coordinate, a distance variable, and a predecessor_node variable.
- put starting node into a queue array with distance = 0, predecessor stays as nil

REPEAT THESE STEPS until the queue is clear: (BFS GRAPH TRAVERSAL)
- shift node out of queue array (dequeue)
- for each possible move from the current square, make separate array of possible moves with all possible next squares
- for each possible move, if the node has not yet been visited:
    - enqueue node and update the distance + 1 and set predecessor_node variable to point to the current node.
- RETURN TO TOP

Once board has been traversed, find the square containing the end coordinates, and print out each square
by printing the node, following the predecessor node variable to find the next node, print, etc. until
reaching the starting square where the predecessor variable == nil, which terminates the search.