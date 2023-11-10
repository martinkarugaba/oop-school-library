require_relative 'app'

# def create_person_option
#   puts 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
#   gets.chomp.to_i
# end

def create_student
  puts "Enter student's age:"
  age = gets.chomp.to_i
  puts "Enter student's name:"
  name = gets.chomp
  puts 'Does the student have parent permission? (Y/N):'
  parent_permission = gets.chomp.downcase == 'y'
  create_student_message(Student.new(id: people.length + 1, age: age, name: name, parent_permission: parent_permission))
end

def create_teacher
  puts "Enter teacher's age:"
  age = gets.chomp.to_i
  puts "Enter teacher's name:"
  name = gets.chomp
  puts "Enter teacher's specialization:"
  specialization = gets.chomp
  create_teacher_message(Teacher.new(age: age, name: name, specialization: specialization))
end

def create_book
  puts 'Enter book title:'
  title = gets.chomp
  puts 'Enter book author:'
  author = gets.chomp
  create_book_message(Book.new(title, author))
end

def list_all_books
  list_all_books(books)
end

def list_all_people
  list_all_people(people)
end

def list_rentals_for_person_option
  puts 'Enter person ID:'
  person_id = gets.chomp.to_i
  list_rentals_for_person(rentals, person_id)
end
