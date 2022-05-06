# frozen_string_literal: true

class Board
    attr_accessor :start, :next_node
  
    MOVES = [[1, 2], [-2, -1], [-1, 2], [2, -1],
             [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze
  
    @@queue = []
  
    def initialize(start, next_node)
      @start = start
      @next_node = next_node
      @@queue << @start
    end
  
    def moves
      MOVES.map { |e| [@start[0] + e[0], @start[1] + e[1]] }
           .keep_if { |e| Board.valid?(e) }
           .reject { |e| @@queue.include?(e) }
           .map { |e| Board.new(e, self) }
    end
  
    def self.valid?(input)
      (1..8).include?(input[0]) && (1..8).include?(input[1])
    end
  end
  
  def display(node)
    display(node.next_node) unless node.next_node.nil?
    p node.start
  end
  
  def knight_travails(startp, endp)
    queue = []
    current_node = Board.new(startp, nil)
    until current_node.start == endp
      current_node.moves.each { |e| queue << e }
      current_node = queue.shift
    end
    display(current_node)
  end
  
  knight_travails([1, 1], [8, 7])
  