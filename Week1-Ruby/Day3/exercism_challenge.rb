# frozen_string_literal: true

# Class representing a library
class Library
  # Title;ISBN;Author;Published
  CATALOG_DATA = <<~DATA
    The Adventures of Tom Sawyer;9780191604928;Mark Twain;2007
    Republic;9780718198916;Plato;2012
    Programming Ruby: The Pragmatic Programmers Guide;9780974514055;David Thomas;2004
    Pride and Prejudice by Jane Austen;9781986431484;Jane Austen;2018
    To Kill a Mockingbird;9780446310789;Harper Lee;1988
    Cosmicomics;9780330319089;Italo Calvino;1969
    The Lord of the Rings;9780544003415;J. R. R. Tolkien;2012
    Lord of the Flies;9780140283334;William Golding;1999
    1984: A Novel;9780451524935;George Orwell;2009
  DATA

  def initialize
    # Convert the string data into an array of hashes to make lookup easier
    lib_as_strings = CATALOG_DATA.split("\n")
    lib_content = []

    lib_as_strings.each do |book|
      book_data = book.split(';')
      lib_content.push({ Title: book_data[0], ISBN: book_data[1], Author: book_data[2],
                         Pub_Date: book_data[3], Stock: -1 })
    end

    @lib_content = lib_content
  end

  def lookup_title(isbn)
    title = nil

    # This would cause us problems if books had duplicate ISBNs ( which shouldn't happen )
    @lib_content.each do |book|
      title = book[:Title] if book[:ISBN] == isbn
    end

    title
  end

  def lookup_author(isbn)
    author = nil

    # This would cause us problems if books had duplicate ISBNs ( which shouldn't happen )
    @lib_content.each do |book|
      author = book[:Author] if book[:ISBN] == isbn
    end

    author
  end

  def lookup_publication_year(isbn)
    pub_year = nil

    # This would cause us problems if books had duplicate ISBNs ( which shouldn't happen )
    @lib_content.each do |book|
      pub_year = book[:Pub_Date] if book[:ISBN] == isbn
    end

    pub_year
  end

  def add_stock!(isbn, count)
    @lib_content.each do |book|
      next unless book[:ISBN] == isbn

      current_stock = book[:Stock]
      # Make sure to add a book in if the stock has yet to be initialised ( stock = -1)
      current_stock += 1 if current_stock == -1
      book[:Stock] = current_stock + count
    end
  end

  def lookup_stock(isbn)
    current_stock = 0
    @lib_content.each do |book|
      current_stock = book[:Stock] if book[:ISBN] == isbn && book[:Stock] != -1
    end
    current_stock
  end

  def borrow!(isbn)
    @lib_content.each do |book|
      book[:Stock] -= 1 if book[:ISBN] == isbn && book[:Stock].positive?
    end
  end

  def put_back!(isbn)
    @lib_content.each do |book|
      book[:Stock] += 1 if book[:ISBN] == isbn
    end
  end

  def book_in_stock?(isbn)
    in_stock = false
    @lib_content.each do |book|
      in_stock = book[:Stock].positive? if book[:ISBN] == isbn
    end
    in_stock
  end

  def books_in_stock
    books = []
    @lib_content.each do |book|
      books.push(book[:ISBN]) if book[:Stock].positive?
    end
    books.sort!
  end

  def total_books_in_stock
    total_stock = 0
    @lib_content.each do |book|
      total_stock += book[:Stock] if book[:Stock].positive?
    end
    total_stock
  end
end