require_relative 'menu'
require_relative 'actions'
require_relative 'library'

library = Library.new

def main(library)
  welcome_message

  options = {
    1 => :create_person_option,
    2 => :create_book_option,
    3 => :create_rental_option,
    4 => :list_all_books_option,
    5 => :list_all_people_option,
    6 => :list_rentals_for_given_person_id_option,
    7 => :exit_program_option
  }

  loop do
    display_options

    option = gets.chomp.to_i

    if options.key?(option)
      send(options[option], library)
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

main(library)
