require_relative 'app'

def main
  people = []

  loop do
    puts "Welcome to School Library App!"
    puts ""
    puts "Please choose an option by entering a number:"
    puts "1. Create a person"
    puts "2. Create a book"
    puts "3. Create a rental"
    puts "4. List all books"
    puts "5. List all people"
    puts "6. List rentals for a given person id"
    puts "7. Exit"

    option = gets.chomp.to_i

    case option
    when 1
      print "Do you want to create a Student (1) or a Teacher (2)? [Input the number]: "
      person_option = gets.chomp.to_i

      case person_option
      # create person
      when 1
        print "Enter student's age: "
        age = gets.chomp.to_i
        print "Enter student's name: "
        name = gets.chomp
        print "Does the student have parent permission? (Y/N): "
        parent_permission = gets.chomp.downcase == 'y'

        student = Student.new(age, name, parent_permission: parent_permission)
        people << student
        puts "Student created successfully - Name: #{student.name}, Age: #{student.age}, ID: #{student.id}"
      when 2
        puts "Enter teacher's age:"
        age = gets.chomp.to_i
        puts "Enter teacher's name:"
        name = gets.chomp
        puts "Enter teacher's specialization:"
        specialization = gets.chomp

        teacher = Teacher.new(age: age, name: name, specialization: specialization)
        people << teacher
        puts "Teacher created successfully - Name: #{teacher.name}, Age: #{teacher.age}, ID: #{teacher.id}, Specialization: #{teacher.specialization}"
      else
        puts "Invalid option"
      end
    # Creating a book
    when 2
      puts "Enter book title:"
      title = gets.chomp
      puts "Enter book author:"
      author = gets.chomp

      create_book(books, title, author)
      puts "Book created successfully - Title: #{title}, Author: #{author}"
    # Creating a rental
    when 3
      puts "List of Books:"
      list_all_books(books)

      puts "Select a book by number:"
      book_number = gets.chomp.to_i - 1
      selected_book = books[book_number]

      puts "Enter rental date (YYYY-MM-DD):"
      date = gets.chomp

      create_rental(rentals, date, selected_book)
      puts "Rental created successfully - Date: #{date}, Book: #{selected_book.title}"
    when 4
    # List all books
    list_all_books(books)
    when 5
      # List all people
      list_all_people(people)
    when 6
      # List all rentals for a given person id
      puts "Enter person ID:"
      person_id = gets.chomp.to_i
      list_rentals_for_person(rentals, person_id)
    when 7
      break
    else
      puts "Invalid option. Please try again."
    end
  end
end

main
