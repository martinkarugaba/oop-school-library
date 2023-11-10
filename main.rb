#!/usr/bin/env ruby

require_relative 'app'
require_relative 'menu'
require_relative 'actions'

def main
  welcome_message

  loop do
    display_options

    option = gets.chomp.to_i

    case option
    when 1 then create_student
    when 2 then create_teacher
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rentals_for_person
    when 7 then break
    else puts 'Invalid option. Please try again.'
    end
  end
end

main
