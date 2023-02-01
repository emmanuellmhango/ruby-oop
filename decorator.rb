require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(person)
    super
    @nameable = person
  end

  def correct_name
    @nameable.correct_name
  end
end
