
require './book'
require './library'

book_1 = Book.new('Game of Thrones', "J.J. Tolkien", 'fantasy')
book_2 = Book.new('Harry Potter', "J.K. Rowling", "young adults")
book_3 = Book.new('Deep Work', 'Cal Newport', 'self development')

library_1 = Library.new('private')
library_2 = Library.new("work")

puts library_1
p library_1.collection
library_1.add_book(book_1)
p library_1.collection
p library_1.authors("private")
library_1.add_book(book_2)
p library_1.authors("private")
p '-------------------'
puts library_2
p library_2.collection
library_2.add_book(book_2)
p library_2.titles("work")