require_relative 'library'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'



def list_all_people(people)
  puts 'List of People:'
  #people.each { |person| puts "#{person.class} - Name: #{person.name}, Age: #{person.age}, ID: #{person.id}" }
end

def create_student(people, age, name, parent_permission: true)
  student = Student.new(age, nil, parent_permission: parent_permission, name: name)
  $people << student
  puts "Student created successfully - Name: #{student.name}, Age: #{student.age}, ID: #{student.id}"
end

def create_teacher(people, age, name, specialization)
  teacher = Teacher.new(age, specialization, parent_permission: true, name: name)
  $people << teacher
  puts "Teacher created successfully - Name: #{teacher.name}, Age: #{teacher.age}, ID: #{teacher.id}"
end

def create_book(title, author, books)
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
