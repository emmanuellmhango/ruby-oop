require './decorator.rb'

class TrimmerDecorator < BaseDecorator
  def initialize(person)
    @person = person
  end

  def correct_name
    @person.correct_name[0..9]
  end
end