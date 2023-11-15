require 'date'
require_relative 'library'

def create_book_option(library)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  library.create_book(title, author)
end

def create_person_option(library)
  print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
  person_class = gets.chomp.to_i

  case person_class
  when 1 then create_student(library)
  when 2 then create_teacher(library)
  else puts 'Invalid choice. Please select option 1 or 2.'
  end
end

def create_student(library)
  print "Enter Student's age: "
  age = gets.chomp.to_i
  print "Enter Student's name: "
  name = gets.chomp
  print 'Does the student have parent permission? (Y/N): '
  parent_permission = gets.chomp.downcase == 'y'
  library.create_person(age, name: name, parent_permission: parent_permission)
end

def create_teacher(library)
  print "Teacher's age: "
  age = gets.chomp.to_i
  print "Teacher's name: "
  name = gets.chomp
  print "Teacher's specialization: "
  specialization = gets.chomp
  library.create_person(age, name: name, specialization: specialization)
end

def create_rental_option(library)
  puts ''
  library.list_all_books
  print 'Enter the number of the book to be rented: '
  book_number = gets.chomp.to_i
  selected_book = library.books[book_number]

  puts ''
  library.list_all_people
  print 'Enter the number of the person renting the book: '
  person_number = gets.chomp.to_i
  selected_person = library.people[person_number]

  puts ''
  print 'Enter the rental date (MM/DD/YYYY): '
  rental_date_input = gets.chomp
  rental_date = Date.strptime(rental_date_input, '%m/%d/%Y')

  library.create_rental(selected_book, selected_person, rental_date)
end

def list_all_books_option(library)
  library.list_all_books
end

def list_all_people_option(library)
  library.list_all_people
end

def list_rentals_for_given_person_id_option(library)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  library.list_rentals_for_given_person_id(person_id)
end

def exit_program_option(library)
  library.exit_program
end
