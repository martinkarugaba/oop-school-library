require 'date'
require_relative 'library'
require_relative 'app'

def create_person_option
  print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
  person_class = gets.chomp.to_i

  case person_class
  when 1
    print "Enter Student's age: "
    age = gets.chomp.to_i
    print "Enter Student's name: "
    name = gets.chomp
    print 'Does the student have parent permission? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    create_person(age, name: name, parent_permission: parent_permission)
  when 2
    print "Teacher's age: "
    age = gets.chomp.to_i
    print "Teacher's name: "
    name = gets.chomp
    print "Teacher's specialization: "
    specialization = gets.chomp
    create_person(age, name: name, specialization: specialization)
  else
    puts 'Invalid choice. Please select option 1 or 2.'
  end
end

def create_book_option
  print 'Enter book title: '
  title = gets.chomp
  print 'Enter book author: '
  author = gets.chomp
  create_book(title, author)
end

def create_rental_option
  puts ''
  list_all_books
  print 'Enter the number of the book to be rented: '
  book_number = gets.chomp.to_i
  selected_book = $books[book_number]

  puts ''
  list_all_people
  print 'Enter the number of the person renting the book: '
  person_number = gets.chomp.to_i
  selected_person = $people[person_number]

  puts ''
  print 'Enter the rental date (MM/DD/YYYY): '
  rental_date_input = gets.chomp
  rental_date = Date.strptime(rental_date_input, '%m/%d/%Y')

  create_rental(selected_book, selected_person, rental_date)
end


def list_rentals_for_person_option
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  list_rentals_for_person($rentals, person_id)
end
