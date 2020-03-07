class Library

  attr_reader :name, :collection

  def initialize(name)
  @name = name
  @collection = []
  end

  def add_book(book)
    @collection << book
  end

  def titles(collection)
    @collection.map { |book| book.title }
  end

  def authors(collection)
    @collection.map { |book| book.author }
  end

end