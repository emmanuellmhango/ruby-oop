require_relative 'decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(person)
    @person = person
    super
  end

  def correct_name
    @person.correct_name.capitalize()
  end
end