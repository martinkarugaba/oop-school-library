require_relative 'library'
require_relative 'app'

def create_person(people)
  puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
  gets.chomp.to_i
end

def create_student(people)
  puts "Student's age:"
  age = gets.chomp.to_i
  puts "Student's name:"
  name = gets.chomp
  puts 'Does the student have parent permission? (Y/N):'
  parent_permission = gets.chomp.downcase == 'y'
  create_student_message(Student.new(id: $people.length + 1, age: age, name: name, parent_permission: parent_permission))
end

def create_teacher_option(people)
  puts "Teacher's age:"
  age = gets.chomp.to_i
  puts "Teacher's name:"
  name = gets.chomp
  puts "Teacher's specialization:"
  specialization = gets.chomp
  create_teacher_message(Teacher.new(age: age, name: name, specialization: specialization))
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
