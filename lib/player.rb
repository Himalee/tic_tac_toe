class Player

  def turn(display, board, mark)
    display.choose_cell
    number = display.receive_integer
    board.mark_board(number, mark)
    display.present_board_with_squares(board)
  end
end
