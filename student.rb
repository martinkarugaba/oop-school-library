require_relative 'person'

class Student < Person
  def initialize(id, age, classroom = nil, parent_permission: true, name: 'Unknown')
    super(id, age, parent_permission: parent_permission, name: name)
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
