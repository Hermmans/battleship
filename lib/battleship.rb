require_relative "board"
require_relative "player"

    class Battleship
        attr_reader :board, :player
            def initialize(n)
                @player = Player.new
                @board = Board.new(n)
                @remaining_misses = (@board.size) / 2
            end
            def start_game 
                
                 @board.place_random_ships
                print "There are #{@board.num_ships} hidden ships"
               p board.print
               
            end
            def lose?
               if @remaining_misses <= 0
                print "you lose"
                return true
               end
               false
            end
            def win? 
                if @board.num_ships == 0
                 print "you win"
                 return true
                end
                false
            end
            def game_over?
                if self.win? == true || self.lose? == true
                    return true
                end
                false
            end
            def turn
                #you don't have to have the @ symbol to represent the attribute
                #@player == player
               move = player.get_move
              if board.attack(move) == true
                board.attack(move)
              else 
                @remaining_misses -= 1
              end 
               p board.print
               p @remaining_misses
            end
        end

