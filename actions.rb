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
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  create_book(title, author, $books)
end

def list_all_books_option
  list_all_books($books)
end

def list_all_people_option
  list_all_people($people)
end

def list_rentals_for_person_option_option
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  list_rentals_for_person($rentals, person_id)
end
