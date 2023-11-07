class TrimmerDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    trimmed_name = original_name[0, 10]
    return trimmed_name
  end
end
