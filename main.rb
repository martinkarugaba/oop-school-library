#!/usr/bin/env ruby

require_relative 'library'
require_relative 'app'
require_relative 'menu'
require_relative 'actions'

def main
  welcome_message

  loop do
    display_options

    option = gets.chomp.to_i

    case option
    when 1 then create_person_option
    when 2 then create_book_option
    when 3 then create_rental_option
    when 4 then list_all_books_option
    when 5 then list_all_people
    when 6 then list_all_rentals_for_given_id
    when 7 then break
    else puts 'Invalid option. Please try again.'
    end
  end
end

main
