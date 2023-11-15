require 'date'
require_relative 'app'

def create_book_option(books)
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  create_book(title, author, books)
end

def create_person_option(people)
  print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
  person_class = gets.chomp.to_i

  case person_class
  when 1 then create_student(people)
  when 2 then create_teacher(people)
  else puts 'Invalid choice. Please select option 1 or 2.'
  end
end

def create_student(people)
  print "Enter Student's age: "
  age = gets.chomp.to_i
  print "Enter Student's name: "
  name = gets.chomp
  print 'Does the student have parent permission? (Y/N): '
  parent_permission = gets.chomp.downcase == 'y'
  create_person(age, name: name, parent_permission: parent_permission, people: people)
end

def create_teacher(people)
  print "Teacher's age: "
  age = gets.chomp.to_i
  print "Teacher's name: "
  name = gets.chomp
  print "Teacher's specialization: "
  specialization = gets.chomp
  create_person(age, name: name, specialization: specialization, people: people)
end

def create_rental_option(books, people, rentals)
  puts ''
  list_all_books(books)
  print 'Enter the number of the book to be rented: '
  book_number = gets.chomp.to_i
  selected_book = books[book_number]

  puts ''
  list_all_people(people)
  print 'Enter the number of the person renting the book: '
  person_number = gets.chomp.to_i
  selected_person = people[person_number]

  puts ''
  print 'Enter the rental date (MM/DD/YYYY): '
  rental_date_input = gets.chomp
  rental_date = Date.strptime(rental_date_input, '%m/%d/%Y')

  create_rental(selected_book, selected_person, rentals, rental_date)
end

def list_rentals_for_given_person_id_option(rentals)
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  list_rentals_for_given_person_id(rentals, person_id)
end
