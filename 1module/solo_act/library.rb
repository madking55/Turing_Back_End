# frozen_string_literal: true

class Library
  attr_reader :subject, :collection
  def initialize(subject)
    @subject = subject
    @collection = []
  end

  def add_to_library(book)
    @collection << book
  end

  def titles
    @collection.each { |book| p book.title }
  end

  def authors
    @collection.map { |book| p book.author }
  end
end
