require_relative 'decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(person)
    super
    @person = person
  end

  def correct_name
    @person.correct_name[0..9]
  end
end
