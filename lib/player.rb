class Player

  def turn(display, board, mark)
    display.choose_cell
    number = display.valid_cell_choice(board)
    board.mark_board(number, mark)
    display.present_board_with_squares(board)
  end
end
