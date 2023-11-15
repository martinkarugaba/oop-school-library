#!/usr/bin/env ruby

require_relative 'menu'
require_relative 'actions'

def main(people, books, rentals)
  welcome_message

  loop do
    display_options

    option = gets.chomp.to_i

    case option
    when 1 then create_person_option(people)
    when 2 then create_book_option(books)
    when 3 then create_rental_option(books, people, rentals)
    when 4 then list_all_books(books)
    when 5 then list_all_people(people)
    when 6 then list_rentals_for_given_person_id_option(rentals)
    when 7 then break
    else puts 'Invalid option. Please try again.'
    end
  end
end

books = []
people = []
rentals = []

main(people, books, rentals)
