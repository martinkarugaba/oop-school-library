require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, classroom = nil, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission: parent_permission, name: name)
    @classroom = classroom
    add_to_classroom(classroom) if classroom
  end

  # Method to set the classroom and add the student to it
  def set_classroom(classroom)
    @classroom = classroom
    add_to_classroom(classroom)
  end

  private

  # Helper method to add the student to a classroom
  def add_to_classroom(classroom)
    return unless classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
