class CapitalizeDecorator < Decorator
  def correct_name
    original_name = @nameable.correct_name
    capitalized_name = original_name.capitalize
    return capitalized_name
  end
end
