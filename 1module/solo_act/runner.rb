# frozen_string_literal: true

require './book'
require './library'

book_1 = Book.new('Ultralearning', 'Scot Young', 'self-develeopment')
book_2 = Book.new('Mind for numbers', 'Barbara Oakley', 'self-development')
library = Library.new('Business')

require 'pry'; binding.pry
