require_relative 'library'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

# def create_person(person_class, age, name, parent_permission: true)
#   person = person_class.new(age, name, parent_permission: parent_permission)
#   $people << person
#   puts "Created a #{person_class} - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
# end

def create_person(age, name:, parent_permission: true, specialization: nil)
  if specialization.nil?
    person = Student.new(age, name: name, parent_permission: parent_permission)
  else
    person = Teacher.new(age, name: name, specialization: specialization,)
  end
  $people << person
  puts "Created a #{person.class} - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}"
end

def list_all_people(people)
  puts 'List of People:'
  $people.each { |person| puts "#{person.class} - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" }
end

def create_book(title, author)
  book = Book.new(title, author)
  $books << book
  puts "Book created successfully - Title: #{book.title}, Author: #{book.author}"
end

def list_all_books(books)
  puts 'List of Books:'
  $books.each { |book| puts "#{book.title} by #{book.author}" }
end

def list_all_rentals_for_given_id(rentals, person_id)
  person_rentals = rentals.select { |rental| rental.person.id == person_id }
  puts "Rentals for Person ID #{person_id}:"
  person_rentals.each { |rental| puts "Date: #{rental.date}, Book: #{rental.book.title}" }
end
