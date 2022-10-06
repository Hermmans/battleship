class Board
    attr_reader :size
    def self.print_grid(grid)
        # grid.each do |ele| 
        #     ele.each do |ele_2|
        #         print "#{ele_2} "
        #     end
        #     puts
        # end 
        #for some reason the code that I wrote didn't work, it wasn't being recoginzed, however the bottom code works with 
        #the spec file conditions, even though my code does the same exact thing 
        grid.each do |ele|
            puts ele.join(" ")
        end
    end
  def initialize(number)
    @grid = Array.new(number) { Array.new(number, :N)}
    @size = number * number
  end
  def [](array)
    @grid[array[0]][array[1]]
  end
  def []=(position, symbol)
        @grid[position[0]][position[1]] = symbol
  end
  def num_ships
    @grid.flatten.count {|ele| ele == :S}
  end
  #the following belongs to part 2 
  def attack(position)
        if self[position] == :S
            puts 'you sunk my ship!'
            self[position] = :H
            return true
        else
            self[position] = :X
            return false
        end
  end
    def place_random_ships
            amount = (@size * 25.0 )/ 100.0
    until self.num_ships == amount.round 
        self[[(rand Math.sqrt(@size)),(rand Math.sqrt(@size))]] = :S 
    end
end
    def hidden_ships_grid
        @grid.map do |ele|
            ele.map do |ele_2|
                if ele_2 == :S
                    ele_2 = :N
                else
                    ele_2
                end
            end
        end
    end
    def cheat
        Board.print_grid(@grid)
    end
    def print 
        Board.print_grid(hidden_ships_grid)
    end
end
