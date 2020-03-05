class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    [0, 4, 8],
    [2, 4, 6],

    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts("-----------")
    puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts("-----------")
    puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def position_taken?(index)
    if !(@board[index] == " ")
      return true
    end
    return false
  end

  def valid_move?(index)
    if !(position_taken?(index))
      # separated the two if's for code clarity
      if (!((@board[index] == "X") || (@board[index] == "O")) && (index >= 0 && index <= 8))
        return true
      end
    end
    return false
  end

  def move(index, char)
    if (valid_move?(index))
      @board[index] = char
    end
  end

  def turn()
    puts "Please enter 1-9: "
    index = input_to_index(gets.strip.to_i)
    if !(index >= 0 && index <= 8)
      turn()
    else
      move(index, current_player(board))
    end
  end

  def turn_count()
    turn = 0
    @board.each do |space|
      if space != " "
        turn += 1
      end
    end

    return turn
  end

  def current_player()
    if (turn_count() % 2 == 0)
      return "X"
    end

    return "O"
  end
end
