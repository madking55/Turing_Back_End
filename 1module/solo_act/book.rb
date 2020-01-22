# frozen_string_literal: true

class Book
  attr_reader :title, :author, :genre

  def initialize(title, author, genre)
    @title = title
    @author = author
    @genre = genre
  end
end
