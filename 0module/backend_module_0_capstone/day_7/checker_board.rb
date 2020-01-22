# frozen_string_literal: true

def draw_board(size)
  if size.even?
    (size / 2).times do
      p draw_odd_row(size)
      p draw_even_row(size)
    end
  else
    p 'Please enter an even number'
  end
  end

def draw_odd_row(size)
  black = 'X'
  white = '-'
  row = []
  (size / 2).times do
    row << black
    row << white
  end
  row
end

def draw_even_row(size)
  black = 'X'
  white = '-'
  row = []
  (size / 2).times do
    row << white
    row << black
  end
  row
end
draw_board(6)
