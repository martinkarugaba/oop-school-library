require_relative 'person'

class Student < Person
  def initialize(age, name: 'Unknown', parent_permission: true, classroom: nil)
    super(age, name: name, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def classroom=(new_classroom)
    @classroom&.students&.delete(self)
    @classroom = new_classroom
    new_classroom&.students&.push(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
