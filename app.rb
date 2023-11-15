require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

def create_person(age, name:, people:, parent_permission: true, specialization: nil)
  person = if specialization.nil?
             Student.new(age, name: name, parent_permission: parent_permission)
           else
             Teacher.new(age, specialization, parent_permission: parent_permission, name: name)
           end
  people << person
  puts "#{person.class} created successfully - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
end

def create_book(title, author, books)
  book = Book.new(title, author)
  books << book
  puts 'Book created successfully - Title: #{book.title}, Author: #{book.author}'
end

def create_rental(book, person, rentals, rental_date)
  if book && person
    rental = Rental.new(rental_date, person, book)
    book.rentals << rental
    person.rentals << rental
    rentals << rental
    puts "Rental created successfully - Book: #{book.title}, Person: #{person.name}, Rental Date: #{rental_date}"
  else
    puts 'Invalid book or person.'
  end
end

def list_all_books(books)
  puts 'List of Books:'
  books.each_with_index do |book, index|
    puts "#{index}. Title: #{book.title}, Author: #{book.author}"
  end
end

def list_all_people(people)
  puts 'List of People:'
  people.each_with_index do |person, index|
    puts "#{index}. Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
  end
end

def list_rentals_for_given_person_id(rentals, person_id)
  person_rentals = rentals.select { |rental| rental.person.id == person_id }

  if person_rentals.empty?
    puts "No rentals found for Person ID #{person_id}."
  else
    puts "Rentals for Person ID #{person_id}:"
    person_rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
  end
end
