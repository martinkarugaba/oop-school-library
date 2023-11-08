require_relative 'person'

class Student < Person
  def initialize(id, age, classroom = nil, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission: parent_permission, name: name)
    self.classroom = classroom
  end

  # Method to set the classroom and add the student to it
  def classroom=(new_classroom)
    # Remove the student from the old classroom (if any)
    @classroom&.students&.delete(self)

    @classroom = new_classroom

    # Add the student to the new classroom (if not nil)
    new_classroom&.students&.push(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
